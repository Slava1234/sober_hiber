package ru.sober.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.sober.dao.RoleDao;
import ru.sober.model.Role;

import java.util.List;

@Service
public class RoleServiceImpl implements RoleDao {
    private RoleDao roleDao;

    public void setRoleDao(RoleDao roleDao) {
        this.roleDao = roleDao;
    }

    @Override
    @Transactional
    public void addRole(Role role) {
        this.roleDao.addRole(role);
    }

    @Override
    @Transactional
    public void updateRole(Role role) {
        this.roleDao.updateRole(role);
    }

    @Override
    @Transactional
    public void removeRole(int id) {
        this.roleDao.removeRole(id);
    }

    @Override
    @Transactional
    public Role getRoleById(int id) {
        return this.roleDao.getRoleById(id);
    }

    @Override
    @Transactional
    public List<Role> listRoles() {
        return this.roleDao.listRoles();
    }
}
