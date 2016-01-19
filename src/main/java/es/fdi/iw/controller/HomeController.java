package es.fdi.iw.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.UUID;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import es.fdi.iw.ContextInitializer;
import es.fdi.iw.model.Asignatura;
import es.fdi.iw.model.Categoria;
import es.fdi.iw.model.MensajeModeracion;
import es.fdi.iw.model.Usuario;
import es.fdi.iw.model.Votacion;
import scala.annotation.meta.setter;

// entityManager.find(Usuario,id)
// Reescribir en la sesion
// Session set (atribute Usuario u)
// @ModelAttribute("user")

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory
			.getLogger(HomeController.class);

	@PersistenceContext
	private EntityManager entityManager;

	/**
	 * Intercepts login requests generated by the header; then continues to load
	 * normal page
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@Transactional
	public String login(@RequestParam("email") String formLogin,
			@RequestParam("pass") String formPass,
			@RequestParam("source") String formSource,
			HttpServletRequest request, HttpServletResponse response,
			Model model, HttpSession session) {

		logger.info("Login attempt from '{}' while visiting '{}'", formLogin,
				formSource);

		// validate request
		if (formLogin == null || formLogin.length() < 4 || formPass == null
				|| formPass.length() < 4) {
			model.addAttribute("loginError",
					"usuarios y contraseñas: 4 caracteres mínimo");
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
		} else {
			Usuario u = null;
			try {
				u = (Usuario) entityManager.createNamedQuery("usuarioLogin")
						.setParameter("loginParam", formLogin)
						.getSingleResult();
				logger.info("Usuario " + u.toString());
				if (u.esLoginValido(formPass)) {
					logger.info("pass was valid");
					session.setAttribute("user", u);
					// sets the anti-csrf token
					if(isAdmin(session)){
						getTokenForSession(session);
						return "redirect:admin";
					}
					else{
						getTokenForSession(session);
						return "redirect:home";
					}
				} else {
					logger.info("pass was NOT valid");
					model.addAttribute("loginError",
							"error en usuario o contraseña");
					response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);

				}
			} catch (NoResultException nre) {
				if (formPass.length() == 4) {
				} else {
					logger.info("no such login: {}", formLogin);
				}
				model.addAttribute("loginError",
						"error en usuario o contraseña");
			}
		}

		// redirects to view from which login was requested
		return "redirect:" + formSource;
	}

	/**
	 * Delete a user; return JSON indicating success or failure
	 */
	@RequestMapping(value = "/delUser", method = RequestMethod.POST)
	@ResponseBody
	@Transactional
	// needed to allow DB change
	public ResponseEntity<String> bookAuthors(@RequestParam("id") long id,
			@RequestParam("csrf") String token, HttpSession session) {
		if (!isAdmin(session) || !isTokenValid(session, token)) {
			return new ResponseEntity<String>(
					"Error: no such user or bad auth", HttpStatus.FORBIDDEN);
		} else if (entityManager.createNamedQuery("borrarUsuario")
				.setParameter("idParam", id).executeUpdate() == 1) {
			return new ResponseEntity<String>("Ok: user " + id + " removed",
					HttpStatus.OK);
		} else {
			return new ResponseEntity<String>("Error: no such user",
					HttpStatus.BAD_REQUEST);
		}
	}

	/**
	 * Logout (also returns to home view).
	 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		logger.info("User '{}' logged out", session.getAttribute("user"));
		session.invalidate();
		return "redirect:home";
	}

	/**
	 * Uploads a photo for a user
	 * 
	 * @param id
	 *            of user
	 * @param photo
	 *            to upload
	 * @return
	 */
	@RequestMapping(value = "/user", method = RequestMethod.POST)
	public @ResponseBody String handleFileUpload(
			@RequestParam("photo") MultipartFile photo,
			@RequestParam("id") String id) {
		if (!photo.isEmpty()) {
			try {
				byte[] bytes = photo.getBytes();
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(ContextInitializer.getFile("user",
								id)));
				stream.write(bytes);
				stream.close();
				return "You successfully uploaded "
				+ id
				+ " into "
				+ ContextInitializer.getFile("user", id)
				.getAbsolutePath() + "!";
			} catch (Exception e) {
				return "You failed to upload " + id + " => " + e.getMessage();
			}
		} else {
			return "You failed to upload a photo for " + id
					+ " because the file was empty.";
		}
	}

	/**
	 * Displays user details
	 */
	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public String user(HttpSession session, HttpServletRequest request) {
		return "user";
	}


	/**
	 * Returns a users' photo
	 * 
	 * @param id
	 *            id of user to get photo from
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/user/photo", method = RequestMethod.GET, produces = MediaType.IMAGE_JPEG_VALUE)
	public byte[] userPhoto(@RequestParam("id") String id) throws IOException {
		File f = ContextInitializer.getFile("user", id);
		InputStream in = null;
		if (f.exists()) {
			in = new BufferedInputStream(new FileInputStream(f));
		} else {
			in = new BufferedInputStream(this.getClass().getClassLoader()
					.getResourceAsStream("unknown-user.jpg"));
		}

		return IOUtils.toByteArray(in);
	}

	/**
	 * Toggles debug mode
	 */
	@RequestMapping(value = "/debug", method = RequestMethod.GET)
	public String debug(HttpSession session, HttpServletRequest request) {
		String formDebug = request.getParameter("debug");
		logger.info("Setting debug to {}", formDebug);
		session.setAttribute("debug", "true".equals(formDebug) ? "true"
				: "false");
		return "redirect:/";
	}

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String empty(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG,
				DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);
		/*@RequestMapping(value="/buscarUsuario",method = RequestMethod.POST)
		public String buscarUsuario(
				@RequestParam("usuarioBusqueda") String formUsuario){
			@SuppressWarnings("unchecked")
			List<Usuario> u = (List<Usuario>)entityManager.createNamedQuery("todosUsuarios").getResultList();
			return "";
		}*/
		model.addAttribute("serverTime", formattedDate);
		model.addAttribute("pageTitle", "Inicio OmmisCracia");

		return "home";
	}

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String index(Locale locale, Model model,HttpSession session) {
		if (isAdmin(session)){
			return "admin";
		}
		else {
			return empty(locale, model);
		}
	}

	/**
	 * A not-very-dynamic view that shows an "about us".
	 */
	@RequestMapping(value = "/about", method = RequestMethod.GET)
	@Transactional
	public String about(Locale locale, Model model) {
		logger.info("User is looking up 'about us'");
		@SuppressWarnings("unchecked")
		List<Usuario> us = (List<Usuario>) entityManager.createQuery(
				"select u from Usuario u").getResultList();
		System.err.println(us.size());
		model.addAttribute("users", us);
		model.addAttribute("pageTitle", "¿Quiénes somos?");
		return "about";
	}

	@RequestMapping(value = "/faq", method = RequestMethod.GET)
	public String faq(Locale locale, Model model) {
		model.addAttribute("pageTitle", "Preguntas frecuentes");
		return "faq";
	}

	@RequestMapping(value = "/services", method = RequestMethod.GET)
	public String services(Locale locale, Model model) {
		model.addAttribute("pageTitle", "Servicios Omniscracia");
		return "services";
	}

	/**
	 * Checks the anti-csrf token for a session against a value
	 * 
	 * @param session
	 * @param token
	 * @return the token
	 */
	static boolean isTokenValid(HttpSession session, String token) {
		Object t = session.getAttribute("csrf_token");
		return (t != null) && t.equals(token);
	}

	/**
	 * Returns an anti-csrf token for a session, and stores it in the session
	 * 
	 * @param session
	 * @return
	 */
	static String getTokenForSession(HttpSession session) {
		String token = UUID.randomUUID().toString();
		session.setAttribute("csrf_token", token);
		return token;
	}

	/**
	 * Returns true if the user is logged in and is an admin
	 */
	static boolean isAdmin(HttpSession session) {
		Usuario u = (Usuario) session.getAttribute("user");
		if (u != null) {
			return u.getRol().equals("admin");
		} else {
			return false;
		}
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model) {
		model.addAttribute("pageTitle", "Login Omniscracia");
		return "login";
	}

	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public String signin(Model model) {
		model.addAttribute("pageTitle", "Registro Omniscracia");
		return "signin";
	}

	@RequestMapping(value = "/signin", method = RequestMethod.POST)
	@Transactional
	public String signIn(
			@RequestParam("source") String formSource,
			@RequestParam("email") String formEmail,
			@RequestParam("pass") String formPass,
			@RequestParam("firstName") String formName,
			@RequestParam("lastName") String formLastNAme,
			HttpServletRequest request, HttpServletResponse response,
			Model model, HttpSession session) {
		// model.addAttribute("pageTitle","Registro OmnisCracia");
		// logger.info("no-such-user; creating user {}", formEmail);
		if (formEmail == null || formEmail.length() < 4 || formPass == null
				|| formPass.length() < 4) {
			model.addAttribute("loginError",
					"usuarios y contraseñas: 4 caracteres mínimo");
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			return "redirect:home";
		} else {
			Usuario user = Usuario.crearUsuario(formEmail, formPass, formName, formLastNAme, "user");
			entityManager.persist(user);
			session.setAttribute("user", user);
			// sets the anti-csrf token
			getTokenForSession(session);
			return "redirect:" + formSource;
		}
	}



	@RequestMapping(value = "/mensajeModeracion{idvotacion}", method = RequestMethod.GET)
	public String mensajeModeracion(
			@PathVariable("idvotacion") String idVotacion,
			Model model) {
		model.addAttribute("pageTitle", "Moderación");
		return "mensajemoderacion";
	}

	@RequestMapping(value = "/mensajeModeracion{idvotacion}", method = RequestMethod.POST)
	@Transactional
	public String mensajeModeracion(HttpSession sesion,
			@PathVariable("idvotacion") String idVotacion,
			@RequestParam("mensaje") String mensajeForm,
			@RequestParam("motivo") String motivoForm,
			Model model) {
		model.addAttribute("prefix", "./");
		Usuario u = (Usuario) sesion.getAttribute("user");
		MensajeModeracion m = new MensajeModeracion();

		if (idVotacion.isEmpty())//No tiene nada que ver con votaciones el reporte.
			m = m.crearMensajeModeracion(u.getId(),motivoForm, mensajeForm);
		else
			m = m.crearMensajeModeracion(u.getId(), Integer.parseInt(idVotacion), motivoForm, mensajeForm);
		entityManager.persist(m);
		return "home";
	}

	//{idusuario:\\d+} con \\d+ forzamos a que sea un digito.
	@RequestMapping(value = "/perfilUsuario{idusuario:\\d+}", method = RequestMethod.GET)
	@Transactional
	public String perfilUsuario(Model model,@PathVariable("idusuario") long idUsuario,HttpServletResponse response) {
		Usuario u = entityManager.find(Usuario.class, idUsuario);
		if(u == null){
			response.setStatus(HttpServletResponse.SC_NOT_FOUND);
			logger.error("No se encuentra el usuario {}", idUsuario);
		}
		else
			model.addAttribute("usuarioSelec",u);
		model.addAttribute("pageTitle", "PerfilUsuario" + idUsuario);
		model.addAttribute("prefix", "./");
		return "perfilusuario";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/miPerfil", method = RequestMethod.GET)
	public String miPerfil(Model model, HttpSession sesion) {
		model.addAttribute("pageTitle", "Mi Perfil");
		List<Votacion> lista = null;
		Usuario u = (Usuario) sesion.getAttribute("user");
		long id = u.getId();
		/*lista = entityManager.createNamedQuery("buscarVotaciones")
				.setParameter("param1", id).getResultList();*/
		lista = entityManager.createNamedQuery("allVotes").getResultList();
		model.addAttribute("lista", lista);
		return "miperfil";
	}

	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	public String contact(Model model) {
		model.addAttribute("pageTitle", "Contáctanos");
		return "contact";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/busquedaUsuario", method = RequestMethod.GET)
	public String busquedaUsuario(Model model,
			@RequestParam("busqueda") String formBuscar
			) {
		model.addAttribute("cabecera","Resultados Busqueada");
		model.addAttribute("pageTitle", "Resultado de la busqueda");
		List<Usuario> lista = null;
		lista = (List<Usuario>)entityManager.createNamedQuery("busquedaUsuario")
				.setParameter("param1", formBuscar + "%").getResultList();
		for(Usuario u:lista) logger.info(u.getEmail() + "\n");
		PagedListHolder<Usuario> pagedListHolder = new PagedListHolder<Usuario>(lista);
		pagedListHolder.setPageSize(9);
		List<Usuario> pagedList = pagedListHolder.getPageList();
		model.addAttribute("pagedListUsuarios", pagedList);
		return "usersresults";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/mejoresAlumnos", method = RequestMethod.GET)
	public String mejoresAlumnos(Model model) {
		model.addAttribute("pageTitle", "Alumnos");
		List<Usuario> lista = null;
		lista = (List<Usuario>)entityManager
				.createNamedQuery("mejoresAlumnos").getResultList();
		PagedListHolder<Usuario> pagedListHolder = new PagedListHolder<Usuario>(lista);
		pagedListHolder.setPageSize(9);
		List<Usuario> pagedList = pagedListHolder.getPageList();
		model.addAttribute("pagedListUsuarios", pagedList);
		return "usersresults";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/mejoresProfes", method = RequestMethod.GET)
	public String mejoresProfest(Model model) {
		model.addAttribute("pageTitle", "Profesores");
		List<Usuario> lista = null;
		lista = (List<Usuario>)entityManager.createNamedQuery("mejoresProfesores").getResultList();
		PagedListHolder<Usuario> pagedListHolder = new PagedListHolder<Usuario>(lista);
		pagedListHolder.setPageSize(9);
		List<Usuario> pagedList = pagedListHolder.getPageList();
		model.addAttribute("pagedListUsuarios", pagedList);
		return "usersresults";
	}

	@RequestMapping(value = "/realizarValoracion", method = RequestMethod.GET) //valoracion.jsp	
	public String realizarValoracion(Model model) {
		model.addAttribute("prefix", "./");
		model.addAttribute("pageTitle", "Valoración");
		return "valoracion";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/realizarValoracion", method = RequestMethod.POST) //valoracion.jsp
	public String realizarValoracion(Model model,@RequestParam("puntuacion") String puntuacion,
			@RequestParam("categoria") String categoria,HttpSession session) {
		ArrayList<Categoria> lista = new ArrayList<Categoria>();
		Categoria c = new Categoria().crearCategoria(categoria, Integer.parseInt(puntuacion));
		if(session.getAttribute("valoraciones") != null)
			lista = ((ArrayList<Categoria>)session.getAttribute("valoraciones"));
		lista.add(c);
		session.setAttribute("valoraciones", lista);
		model.addAttribute("prefix","./");
		return "voto";
	}

	@RequestMapping(value = "/realizarVotacion{idusuario}", method = RequestMethod.GET) //voto.jsp
	public String realizarVotacion(Model model,@PathVariable("idusuario") String idUsuario,HttpSession session) {
		model.addAttribute("prefix","./");
		session.setAttribute("usuarioVotacion",idUsuario);
		return "voto";
	}


	@RequestMapping(value = "/realizarVotacion", method = RequestMethod.POST) //voto.jsp
	@Transactional
	public String realizarVotacion(Model model,HttpSession session,@RequestParam("comentario") String comentario) {
		model.addAttribute("prefix","./");
		long idEmisor = ((Usuario)session.getAttribute("user")).getId();
		Integer idUsuarioVotacion = Integer.parseInt((String)session.getAttribute("usuarioVotacion"));
		ArrayList<Categoria> lista = new ArrayList<Categoria>();
		lista = (ArrayList<Categoria>) session.getAttribute("valoraciones");
		Votacion v = new Votacion(); 
		v = v.crearVotacion(idEmisor,idUsuarioVotacion,lista,comentario);
		entityManager.persist(v);
		session.removeAttribute("valoraciones");
		session.removeAttribute("usuarioVotacion");
		return "home";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin(Model model) {
		List<Asignatura> asignaturas= null;
		asignaturas = (List<Asignatura>)entityManager
				.createNamedQuery("todasAsignaturas").getResultList();
		model.addAttribute("TodasAsignaturas",asignaturas);
		List<Usuario> usuarios = null;
		usuarios = (List<Usuario>)entityManager.createNamedQuery("todosUsuarios").getResultList();
		model.addAttribute("todosUsuarios",usuarios);
		return "admin";
	}

	@RequestMapping(value = "/adminAddUser", method = RequestMethod.POST)
	@Transactional
	public String admin2(@RequestParam("source") String formSource,
			@RequestParam("email") String formEmail,
			@RequestParam("pass") String formPass,
			@RequestParam("firstName") String formName,
			@RequestParam("lastName") String formLastNAme,
			HttpServletRequest request, HttpServletResponse response,
			Model model, HttpSession session) {
		// model.addAttribute("pageTitle","Registro OmnisCracia");
		// logger.info("no-such-user; creating user {}", formEmail);
		if (formEmail == null || formEmail.length() < 4 || formPass == null
				|| formPass.length() < 4) {
			model.addAttribute("loginError",
					"usuarios y contraseñas: 4 caracteres mínimo");
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);

		} else {
			Usuario user = Usuario.crearUsuario(formEmail, formPass, formName, formLastNAme, "user");
			entityManager.persist(user);
			session.setAttribute("user", user);
			// sets the anti-csrf token
			getTokenForSession(session);

		}
		return "redirect:" + formSource;
	}
	@RequestMapping(value = "/adminAddAsignatura", method = RequestMethod.POST)
	@Transactional
	public String admin3(@RequestParam("source") String formSource,
			@RequestParam("Asignatura") String formAsignatura,
			@RequestParam("Curso") String formCurso,
			@RequestParam("Anio") int formAnio,
			HttpServletRequest request, HttpServletResponse response,
			Model model, HttpSession session) {
		// model.addAttribute("pageTitle","Registro OmnisCracia");
		// logger.info("no-such-user; creating user {}", formEmail);
		Asignatura asig = Asignatura.crearAsignatura(formAsignatura, formCurso, formAnio);
		entityManager.persist(asig);
		session.setAttribute("admin", asig);
		// sets the anti-csrf token
		getTokenForSession(session);	
		return "redirect:" + formSource;
	}
}
