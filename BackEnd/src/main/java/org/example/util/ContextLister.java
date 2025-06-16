package org.example.util;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import org.apache.commons.dbcp2.BasicDataSource;

import java.sql.SQLException;

@WebListener
public class ContextLister implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {

        BasicDataSource basicDataSource = new BasicDataSource();
        basicDataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
        basicDataSource.setUrl("jdbc:mysql://localhost:3306/cms");
        basicDataSource.setUsername("root");
        basicDataSource.setPassword("Ijse@1234");
        basicDataSource.setInitialSize(50);
        basicDataSource.setMaxTotal(70);

        ServletContext servletContext = sce.getServletContext();
        servletContext.setAttribute("dataSource",basicDataSource);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {

        ServletContext servletContext = sce.getServletContext();
        BasicDataSource basicDataSource = (BasicDataSource) servletContext.getAttribute("dataSource");
        if(basicDataSource!=null){
            try {
                basicDataSource.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
