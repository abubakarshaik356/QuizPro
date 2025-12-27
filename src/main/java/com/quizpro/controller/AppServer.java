package com.quizpro.controller;

import org.apache.catalina.startup.Tomcat;

public class AppServer {
    public static void main(String[] args) throws Exception {

        String port="8080";

        Tomcat tomcat = new Tomcat();
        tomcat.setPort(Integer.parseInt(port));

        tomcat.getConnector(); // trigger connector
        tomcat.start();
        tomcat.getServer().await();
    }
}

