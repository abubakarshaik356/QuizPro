package com.quizpro.controller;

import java.io.File;

import org.apache.catalina.Context;
import org.apache.catalina.connector.Connector;
import org.apache.catalina.startup.Tomcat;

public class AppServer {

    public static void main(String[] args) throws Exception {

        String port = System.getenv("PORT");
        if (port == null) {
            port = "10000";
        }

        Tomcat tomcat = new Tomcat();
        tomcat.setBaseDir("tomcat");

        // 🔑 EXPLICIT CONNECTOR (THIS FIXES RENDER)
        Connector connector = new Connector();
        connector.setPort(Integer.parseInt(port));
        connector.setProperty("address", "0.0.0.0"); // 🔥 THIS IS THE KEY
        tomcat.setConnector(connector);
        tomcat.getService().addConnector(connector);

        // Webapp directory (copied by Docker)
        File webappDir = new File("webapp");
        Context ctx = tomcat.addWebapp("", webappDir.getAbsolutePath());
        ctx.setParentClassLoader(AppServer.class.getClassLoader());

        tomcat.start();
        tomcat.getServer().await();
    }
}
