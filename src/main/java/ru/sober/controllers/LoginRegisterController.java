package ru.sober.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import ru.sober.model.User;

import javax.validation.Valid;

@Controller
public class LoginRegisterController {

    /**
     * Log in
     */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String getLoginPage() {
        return "login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView postLoginPage(@Valid @ModelAttribute("user") User user, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            //return "login";
            return new ModelAndView("login");
        }

        //model.addAttribute("user", user);

        return new ModelAndView("home", "user", user);
    }

    /**
     * Register
     */
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String getRegisterPage() {
        return "register";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String postRegisterPage() {
        return "register";
    }

    @RequestMapping(value = "/login-failed", method = RequestMethod.GET)
    public ModelAndView getLoginFailed() {
        return new ModelAndView("failed", "message", "Login failed");
    }
}
