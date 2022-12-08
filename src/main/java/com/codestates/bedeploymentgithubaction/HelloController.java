package com.codestates.bedeploymentgithubaction;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {
    private int count;
    @GetMapping("/")
    public String hello() {
        return "<h1>Hello world!</h1>Count: " + ++count;
    }
}
