package es.ucm.iw;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import es.ucm.model.User;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	
	private static final Logger logger = LoggerFactory
			.getLogger(HomeController.class);

	public String getDate(Locale locale) {
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG,
				DateFormat.LONG, locale);
		return dateFormat.format(date);
	}

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model,
			HttpSession session) {
		logger.info("Welcome home! The client locale is {}.", locale);
		model.addAttribute("serverTime", getDate(locale));
		
		if (session.getAttribute("count") == null) {
			session.setAttribute("count", 1);			
		} else {
			session.setAttribute("count", 1 + (Integer)session.getAttribute("count"));
		}
		model.addAttribute("serverTime", getDate(locale));
		
		return "index";
	}
	
	@RequestMapping(value = "/login2", method = RequestMethod.GET)
	public String login2(Locale locale, Model model) {
		return "login2";
	}
	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String about(Locale locale, Model model) {
		return "about";
	}
	@RequestMapping(value = "/services", method = RequestMethod.GET)
	public String services(Locale locale, Model model) {
		return "services";
	}
	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	public String contact(Locale locale, Model model) {
		return "contact";
	}
	@RequestMapping(value = "/faq", method = RequestMethod.GET)
	public String faq(Locale locale, Model model) {
		return "faq";
	}

	@RequestMapping(value = "/reg", method = RequestMethod.GET)
	public String reg(Locale locale, Model model) {
		logger.info("Ok, eres un usuario registrado.");
		model.addAttribute("serverTime", getDate(locale));
		model.addAttribute("user", new User("paco", 12312, "admin"));
		model.addAttribute("pageTitle", "Paco");

		int[] enteros = new int[10];
		for (int i = 0; i < enteros.length; i++)
			enteros[i] = i;
		model.addAttribute("elementos", enteros);
		return "home";
	}

	@RequestMapping(value = "/valorar", method = RequestMethod.GET)
	public String valorar(Locale locale, Model model) {
		int[] enteros = new int[30];
		for (int i = 0; i < enteros.length; i++)
			enteros[i] = i;//
		model.addAttribute("elementos", enteros);
		return "valorar";
	}

	@RequestMapping(value = "/top", method = RequestMethod.GET)
	public String top(Locale locale, Model model) {
		int[] enteros = new int[10];
		for (int i = 0; i < enteros.length; i++)
			enteros[i] = i;
		model.addAttribute("elementos", enteros);
		return "top";
	}

	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public String user(Locale locale, Model model) {
		logger.info("Entrando en jsfidle.net.");
		return "usuarios";
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registro(Locale locale, Model model) {
		return "regi";
	}

	@RequestMapping(value = "/mejoresAlumnos", method = RequestMethod.GET)
	public String profesor(Locale locale, Model model) {
		return "mejoresAlumnos";
	}

	@RequestMapping(value = "/mejoresProfes", method = RequestMethod.GET)
	public String alumnos(Locale locale, Model model) {
		return "mejoresProfes";
	}

	/*
	 * @RequestMapping(value = "/login", method = RequestMethod.POST) public
	 * String reg(@RequestParam("login") String login,
	 * 
	 * @RequestParam("pass") String pass, HttpServletRequest request, Model
	 * model, Locale locale) { logger.info("Ok, te estás registrando como {}",
	 * login); model.addAttribute("pageTitle", "Registrando");
	 * model.addAttribute("serverTime", getDate(locale));
	 * 
	 * model.addAttribute("elementos", request.getParameterMap());
	 * //if(seValida) //return home //si no se valida return "login"; }
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST) 
	public String login2(HttpServletRequest request,
	        HttpServletRequest response, 
	        Model model, HttpSession session) {
	         if (true/* formulario tiene buen aspecto */) {
	            User u = new User("login", 1, "admin");
	            session.setAttribute("user", u);
	         } else {
	            /* guardo errores en el modelo */
	            //response.setStatus(HttpStatus.UNAUTHORIZED);
	            model.addAttribute("loginError", 
	                "Te lo estás inventando!");
	         }
	         return "login";
	    }
}
