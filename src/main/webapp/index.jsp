// src/main/java/com/example/demo/DemoApplication.java
package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class DemoApplication {

    public static void main(String[] args) {
        SpringApplication.run(DemoApplication.class, args);
    }

    @GetMapping("/")
    public String home() {
        return "<h1>Welcome to the Java Web App!</h1>" +
               "<p>This is a simple Spring Boot web application.</p>" +
               "<p>Try <a href='/api/hello'>/api/hello</a></p>";
    }

    @GetMapping("/api/hello")
    public String hello() {
        return "Hello from the Java backend!";
    }
}
