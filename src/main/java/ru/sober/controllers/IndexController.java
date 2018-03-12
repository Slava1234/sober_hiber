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
import ru.sober.dao.RoleDao;
import ru.sober.dao.UserDao;
import ru.sober.model.Role;
import ru.sober.model.User;
import ru.sober.model.embeddable.Address;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Controller
public class IndexController {

    private UserDao userServiceImpl;

    private RoleDao roleServiceImpl;

    @Autowired(required = true)
    @Qualifier(value = "userServiceImpl")
    public void setUserService(UserDao userServiceImpl) {
        this.userServiceImpl = userServiceImpl;
    }

    @Autowired(required = true)
    @Qualifier(value = "roleServiceImpl")
    public void setRoleService(RoleDao roleServiceImpl) {
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

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public ModelAndView getAddUser() {

        Role role = roleServiceImpl.getRoleById(3);
        User user = new User();

        Address homeAddress = new Address();
        Address officeAddress = new Address();

        user.setFirst_name("Viktor");
        user.setLast_name("Fefelov");
        user.setEmail("fefelov@gmail.com");
        user.setPassword("fef994");
        user.setBirthday(new Date(1989, 03, 11));

        homeAddress.setCity("Almaty");
        homeAddress.setState("Almatinskaya");
        homeAddress.setStreet("batanich");

        officeAddress.setCity("Uralsk");
        officeAddress.setState("Zapad");
        officeAddress.setStreet("Kolhoz");

        user.setHomeAddress(homeAddress);
        user.setOfficeAddress(officeAddress);

        // add user to role
        role.setUsers(user);
        // add roles to user_roles
        user.setUser_roles(role);

        userServiceImpl.addUser(user);


        return new ModelAndView("add_user", "role", role);
    }

    @RequestMapping(value = "/del", method = RequestMethod.GET)
    public ModelAndView getDeleteUser() {
        User user = userServiceImpl.getUserById(10);
        userServiceImpl.removeUser(user.getId());

        return new ModelAndView("add_user", "msg", "user deleted");
    }

    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public ModelAndView getUpdateUser() {

        Role role = roleServiceImpl.getRoleById(3);
        User user = userServiceImpl.getUserById(9);

        user.setFirst_name(user.getFirst_name() + " again");

        // add user to role
        role.setUsers(user);
        // add roles to user_roles
        user.setUser_roles(role);

        userServiceImpl.updateUser(user);

        return new ModelAndView("add_user", "msg", "user updated");
    }

}
