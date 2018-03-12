package ru.sober.dao;


import ru.sober.model.Role;
import ru.sober.model.User;

import java.util.List;

public interface RoleDao {

    public void addRole(Role role);

    public void updateRole(Role role);

    public void removeRole(int id);

    public Role getRoleById(int id);

    public List<Role> listRoles();
}
