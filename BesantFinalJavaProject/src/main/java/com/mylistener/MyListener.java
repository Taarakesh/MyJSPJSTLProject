package com.mylistener;

import jakarta.servlet.*;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import javax.naming.*;
import javax.sql.*;
import java.sql.*;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import com.mydata.*;
import com.mythreads.*;



/**
 * Application Lifecycle Listener implementation class MyListener
 *
 */
@WebListener
public class MyListener implements ServletContextListener {

    /**
     * Default constructor. 
     */
	
	Connection con=null;
	ScheduledExecutorService se;
    public MyListener() {
        // TODO Auto-generated constructor stub
    }
    
    public void contextInitialized(ServletContextEvent sce)
    {
    	
    	ServletContext sc=sce.getServletContext();
    	try
    	{
    		InitialContext ic=new InitialContext();
    		DataSource ds=(DataSource)ic.lookup("java:/comp/env/jdbc/MyDB");
    		con=ds.getConnection();
    		Data d=new Data(con);
    		
    		d.display();
    		sc.setAttribute("data", d);
    		se=Executors.newSingleThreadScheduledExecutor();
    		se.scheduleAtFixedRate(new Reload(d), 0, 1, TimeUnit.SECONDS);
    		
    		
    	}
    	catch(NamingException ne)
    	{
    		
    	}
    	catch(SQLException se)
    	{
    		
    	}
    	
    }
    
    public void contextDestroyed()
    {
    	try {
    		con.close();
    		
    	}
    	catch(SQLException se)
    	{
    		se.printStackTrace();
    	}
    	
    }
	
}

