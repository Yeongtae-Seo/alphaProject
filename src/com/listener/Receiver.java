package com.listener;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionActivationListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;


public class Receiver implements HttpSessionListener, HttpSessionAttributeListener, HttpSessionActivationListener {
	//=========================================================================
	
	ServletContext application;
	
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		HttpSession session =se.getSession();
		System.out.println("sessionCreated.."+session.getId());
		application = session.getServletContext();
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		System.out.println("sessionDestroyed..");
		HttpSession session = se.getSession();
		session.setAttribute("auth", null);
	}
	//=========================================================================
	
	@Override
	public void attributeAdded(HttpSessionBindingEvent se) {
		
	}

	@Override
	public void attributeRemoved(HttpSessionBindingEvent se) {
		System.out.println("sessionAtttDes");
	}

	@Override
	public void attributeReplaced(HttpSessionBindingEvent se) {
		
	}
}
