package com.internal.recipes.security;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.stereotype.Component;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.internal.recipes.domain.EventLog;
import com.internal.recipes.domain.EventType;
import com.internal.recipes.domain.User;
import com.internal.recipes.security.RecipeUserDetails;
import com.internal.recipes.service.EventLogService;
import com.internal.recipes.service.UserService;

public class RecipeManagerSessionListener implements ServletContextListener, HttpSessionListener {
	@Autowired
	private EventLogService eventLogService;

	@Autowired
	private UserService userService;
	
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub		
	}

	// use webapplicationcontextutils to make the autowires in this class work
	public void contextInitialized(ServletContextEvent sce) {
		 WebApplicationContextUtils
         .getRequiredWebApplicationContext(sce.getServletContext())
         .getAutowireCapableBeanFactory()
         .autowireBean(this);		
	}

	public void sessionCreated(HttpSessionEvent event) {
		// no valuable info in event		
	}

	public void sessionDestroyed(HttpSessionEvent event) {
		SecurityContext context = (SecurityContext) event.getSession().getAttribute("SPRING_SECURITY_CONTEXT");
		if (context != null) {
			RecipeUserDetails user = (RecipeUserDetails)context.getAuthentication().getPrincipal();
			User thisUser = userService.findByUserName(user.getUsername());
			EventLog el = new EventLog(thisUser.getFirstName() + " " + thisUser.getLastName(), EventType.EVENT_SECURITY,  "logged out as " + thisUser.getUserName());
			eventLogService.create(el);		

			System.out.printf ("Sesssion destroyed for user: %s%n", user.getUsername());
		}
	}
}
