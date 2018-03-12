package ru.sober.dao;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import ru.sober.model.Role;
import ru.sober.model.User;

import java.util.List;

@Repository
public class RoleDaoImpl implements RoleDao {

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addRole(Role role) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(role);
    }

    @Override
    public void updateRole(Role role) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(role);
    }

    @Override
    public void removeRole(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Role role = (Role) session.load(Role.class, id);

        if (role != null) {
            session.delete(role);
        }
    }

    @Override
    public Role getRoleById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Role role = (Role) session.get(Role.class, id);
        return role;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Role> listRoles() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Role> rolesList = session.createCriteria(Role.class).list();

        return rolesList;
    }

}
