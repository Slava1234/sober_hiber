package ru.sober.controllers;

import org.springframework.session.MapSession;
import org.springframework.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class AuthController {

    /*@RequestMapping(value = "/auth", method = RequestMethod.GET)
    public String auth() {
        return "cv/auth";
    }

    @RequestMapping(value = "/authTry", method = RequestMethod.POST)
    public String authTry(@RequestParam("username") String username, @RequestParam("password") String password) {

        String u = "admin";
        String p = "111";

        Session session = new MapSession();

        if(username.equals(u) || password.equals(p)) {
            session.setAttribute("auth_data", "true");
        }

        return "cv/index";
    }*/
}
