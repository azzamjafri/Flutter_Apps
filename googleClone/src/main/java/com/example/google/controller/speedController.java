package com.example.google.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@Controller
@RestController
public class speedController {

    @RequestMapping(value = "*azzam*", method = RequestMethod.GET)
    public String speedTest() {
        return "home/speedTest";
    }
}
