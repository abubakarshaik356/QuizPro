package com.quizpro.controller;

import java.io.File;

import org.apache.catalina.Context;
import org.apache.catalina.startup.Tomcat;

public class AppServer {

    public static void main(String[] args) throws Exception {

        String port = System.getenv("PORT");
        if (port == null) {
            port = "10000";
        }

        Tomcat tomcat = new Tomcat();
        tomcat.setPort(Integer.parseInt(port));
        tomcat.setBaseDir("tomcat");

        // 🔑 THIS IS THE CRITICAL LINE
        File webappDir = new File("webapp");

        if (!webappDir.exists()) {
            throw new RuntimeException("Webapp directory not found: " + webappDir.getAbsolutePath());
        }

        Context ctx = tomcat.addWebapp("", webappDir.getAbsolutePath());
        ctx.setParentClassLoader(AppServer.class.getClassLoader());

        tomcat.start();
        tomcat.getServer().await();
    }
}
