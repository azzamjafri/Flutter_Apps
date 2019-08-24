package com.example.google.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("")
public class speedController {

//    @ResponseBody
    @RequestMapping(value = "/google", method = RequestMethod.GET)
    public String speedTest(@RequestParam("q") String q) {

        if(q.contains("speed ") || q.contains("Speed ") || q.contains(" speed") || q.contains(" Speed")) {

            return "home/speedTest";
        }


        return "home/error";
    }
}
