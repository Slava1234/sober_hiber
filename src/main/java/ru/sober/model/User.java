package ru.sober.model;

import com.sun.istack.internal.NotNull;
import ru.sober.model.embeddable.Address;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

/**
 * Descriptions
 *
 * @Lob = larg object
 *
 *
 *
 */


@Entity
@Table(name = "user")
public class User {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @NotNull
    @Column(name = "email")
    @Size(min = 4, max = 45, message = "{email.size.error}")
    @javax.validation.constraints.NotNull
    private String email;

    @NotNull
    @Column(name = "password")
    @Size(min = 4, max = 45, message = "{password.size.error}")
    @javax.validation.constraints.NotNull
    private String password;

    @NotNull
    @Column(name = "first_name")
    @Size(min = 2, max = 50, message = "{first_name.size.error}")
    private String first_name;

    @Column(name = "last_name")
    @Size(min = 2, max = 50, message = "{last_name.size.error}")
    private String last_name;

    @Column(name = "birthday")
    private Date birthday;

    @ManyToMany(cascade = CascadeType.MERGE, fetch = FetchType.LAZY)
    @JoinTable(
            name = "user_roles",
            joinColumns = { @JoinColumn(name = "user_id") },
            inverseJoinColumns = { @JoinColumn(name = "role_id") }
    )
    private List<Role> user_roles = new ArrayList<>();


    @Embedded
    private Address homeAddress;

    @Embedded
    @AttributeOverrides({
            @AttributeOverride(name = "state", column = @Column(name = "office_state")),
            @AttributeOverride(name = "street", column = @Column(name = "office_street")),
            @AttributeOverride(name = "city", column = @Column(name = "office_city"))
    })
    private Address officeAddress;

    public User() {
    }

    public Address getHomeAddress() {
        return homeAddress;
    }

    public void setHomeAddress(Address homeAddress) {
        this.homeAddress = homeAddress;
    }

    public Address getOfficeAddress() {
        return officeAddress;
    }

    public void setOfficeAddress(Address officeAddress) {
        this.officeAddress = officeAddress;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String login) {
        this.email = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public List<Role> getUser_roles() {
        return user_roles;
    }

    public void setUser_roles(Role user_roles) {
        this.user_roles.add(user_roles);
    }
}

