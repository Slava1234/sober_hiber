/*
package ru.sober.controllers;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import ru.sober.dao.UserDao;
import ru.sober.model.Role;
import ru.sober.model.User;
import ru.sober.model.embeddable.Address;
import ru.sober.service.RoleServiceImpl;
import ru.sober.service.UserServiceImpl;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

@Controller
public class IndexController {

    private UserDao userServiceImpl;

    private RoleServiceImpl roleServiceImpl;

    @Autowired(required = true)
    @Qualifier(value = "userServiceImpl")
    public void setUserService(UserServiceImpl userServiceImpl) {
        this.userServiceImpl = userServiceImpl;
    }

    @Autowired(required = true)
    @Qualifier(value = "roleServiceImpl")
    public void setRoleService(RoleServiceImpl roleServiceImpl) {
        this.roleServiceImpl = roleServiceImpl;
    }


    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView getIndex() {
        List<User> users = userServiceImpl.listUsers();

        return new ModelAndView("user", "users", users);
    }

    @RequestMapping(value = "/test", method = RequestMethod.GET)
    public ModelAndView getTest() {
        List<User> users = userServiceImpl.listUsers();

        return new ModelAndView("test", "test", users);
    }

    @RequestMapping(value = "/add-user", method = RequestMethod.GET)
    public ModelAndView getAddUser() {

        User user = new User();
        Address homeAddress = new Address();
        Address officeAddress = new Address();

        user.setFirst_name("Bloke");
        user.setLast_name("Crood");
        user.setEmail("bloke@gmail.com");
        user.setPassword("qwerty123");
        user.setBirthday(new Date(2018, 03, 11));

        homeAddress.setCity("Michegan");
        homeAddress.setState("Baratch");
        homeAddress.setStreet("bekenham");

        officeAddress.setCity("New Yourk");
        officeAddress.setState("Washington");
        officeAddress.setStreet("Cooveit");

        Role role = roleServiceImpl.getRoleById(1);
        user.getUser_roles().add(role);

        user.setHomeAddress(homeAddress);
        user.setOfficeAddress(officeAddress);


        userServiceImpl.addUser(user);
        return new ModelAndView("add_user", "message", "user added");


    }

}
*/