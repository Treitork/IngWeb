package es.ucm.iw;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	public String getDate(Locale locale) {
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(
				DateFormat.LONG, DateFormat.LONG, locale);		
		return dateFormat.format(date);				
	}
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		model.addAttribute("serverTime", getDate(locale));		
		return "home";
	}
	
	// Esto es solo para propositos de demostración; veremos como hacerlo bien
	public static class User {
		private String login; 
		private int id;
		private String role;
		public User(String login, int id, String role) {
			this.login = login; this.id = id; this.role = role;
		}
		public String getLogin() { return login; }
		public int getId() { return id; }
		public String getRole() { return role; }		
	}
	
	@RequestMapping(value = "/reg", method = RequestMethod.GET) 
	public String reg(Locale locale, Model model) {
		logger.info("Ok, eres un usuario registrado.");
		model.addAttribute("serverTime", getDate(locale));				
		model.addAttribute("user", new User("paco", 12312, "admin"));
		model.addAttribute("pageTitle", "Paco");
		
		int[] enteros = new int[10];
		for (int i=0; i<enteros.length; i++) enteros[i] = i;
		model.addAttribute("elementos", enteros);
		return "home";
	}
	@RequestMapping(value = "/valorar", method = RequestMethod.GET) 
	public String valorar(Locale locale, Model model) {
		int[] enteros = new int[30];
		for (int i=0; i<enteros.length; i++) enteros[i] = i;
		model.addAttribute("elementos", enteros);
		return "valorar";
	}
	@RequestMapping(value = "/top", method = RequestMethod.GET) 
	public String top(Locale locale, Model model) {
		int[] enteros = new int[10];
		for (int i=0; i<enteros.length; i++) enteros[i] = i;
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
	
	@RequestMapping(value = "/prof", method = RequestMethod.GET)
	public String profesor(Locale locale, Model model) {
		return "prof";
	}
	
	@RequestMapping(value = "/prueba", method = RequestMethod.GET) 
	public String prueba(Locale locale, Model model) {
		return "prueba";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST) 
	public String reg(@RequestParam("login") String login, 
			@RequestParam("pass") String pass,
			HttpServletRequest request,
			Model model, Locale locale) {
		logger.info("Ok, te estás registrando como {}", login);
		model.addAttribute("pageTitle", "Registrando");
		model.addAttribute("serverTime", getDate(locale));		

		model.addAttribute("elementos", request.getParameterMap());
		return "home";
	}	
}
