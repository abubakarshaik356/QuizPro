package com.quizpro.controller;

import java.io.File;

import org.apache.catalina.Context;
import org.apache.catalina.Host;
import org.apache.catalina.startup.Tomcat;

public class AppServer {

    public static void main(String[] args) throws Exception {

        String port = System.getenv("PORT");
        if (port == null) {
            port = "10000";
        }

        Tomcat tomcat = new Tomcat();
        tomcat.setPort(Integer.parseInt(port));

        // ===== Base directory =====
        File baseDir = new File("tomcat");
        baseDir.mkdirs();
        tomcat.setBaseDir(baseDir.getAbsolutePath());

        // ===== Host =====
        Host host = tomcat.getHost();
        host.setAppBase(".");

        // ===== WebApp Context =====
        String webappDir = new File("src/main/webapp").getAbsolutePath();
        Context context = tomcat.addWebapp("", webappDir);

        // Fix for JSP scanning
        context.setParentClassLoader(AppServer.class.getClassLoader());

        // Start Tomcat
        tomcat.start();
        tomcat.getServer().await();
    }
}
