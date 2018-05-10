package ru.sober.dao;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.*;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Repository;
import ru.sober.model.Cv;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

@Repository
public class CvDaoImpl implements CvDao {

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addCv(Cv cv) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(cv);
    }

    @Override
    public void updateCv(Cv cv) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(cv);
    }

    @Override
    public void removeCv(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Cv cv = (Cv) session.load(Cv.class, id);

        if (cv != null) {
            session.delete(cv);
        }
    }

    @Override
    public Cv getCvById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Cv cv = (Cv) session.get(Cv.class, id);
        return cv;
    }

    @Override
    //@Cacheable("indexResults")
    @SuppressWarnings("unchecked")
    public List<Cv> listCvs() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Cv> cvList = session.createCriteria(Cv.class).addOrder(Order.desc("id")).list();
        return cvList;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Cv> searchCvs(Map<String, String> map, String searchQuery) {
        Session session = this.sessionFactory.getCurrentSession();

        Criteria criteria = session.createCriteria(Cv.class);


        Criterion birthdateCriterion = null;
        Criterion fioCriterion = null;
        Criterion phoneCriterion = null;
        Criterion sellaryCriterion = null;
        Criterion skillsCriterion = null;
        Criterion commentCriterion = null;

        if (map.containsKey("birthdate")) {
            birthdateCriterion = Restrictions.like("birthdate", searchQuery, MatchMode.ANYWHERE);
        }

        if (map.containsKey("fio")) {
            fioCriterion = Restrictions.like("fio", searchQuery, MatchMode.ANYWHERE);
        }

        if (map.containsKey("phone")) {
            phoneCriterion = Restrictions.like("phone", searchQuery, MatchMode.ANYWHERE);
        }

        if (map.containsKey("sellary")) {
            sellaryCriterion = Restrictions.like("sellary", searchQuery, MatchMode.ANYWHERE);
        }

        if (map.containsKey("skills")) {
            skillsCriterion = Restrictions.like("skills", searchQuery, MatchMode.ANYWHERE);
        }

        if (map.containsKey("comment")) {
            commentCriterion = Restrictions.like("comment", searchQuery, MatchMode.ANYWHERE);
        }


        Disjunction disjunction = Restrictions.disjunction();

        if (birthdateCriterion != null)
            disjunction.add(birthdateCriterion);

        if (fioCriterion != null)
            disjunction.add(fioCriterion);

        if (phoneCriterion != null)
            disjunction.add(phoneCriterion);

        if (sellaryCriterion != null)
            disjunction.add(sellaryCriterion);

        if (skillsCriterion != null)
            disjunction.add(skillsCriterion);

        if (commentCriterion != null)
            disjunction.add(commentCriterion);

        criteria.add(disjunction);

        List<Cv> cvList = criteria.list();
        return cvList;
    }

    public void updateCvComment(int id, String comment) {
        Session session = this.sessionFactory.getCurrentSession();
        String hqlUpdate = "update Cv cv set cv.comment = :newComment, cv.last_comment_update = :newLastCommentUpdate where cv.id = :cvId";

        String date = new SimpleDateFormat("dd.MM.yy").format(Calendar.getInstance().getTime());
        String time = new SimpleDateFormat("HH:mm").format(Calendar.getInstance().getTime());


        int updatedEntities = session.createQuery(hqlUpdate)
                .setString("newComment", comment)
                .setString("newLastCommentUpdate", date + " " + time)
                .setInteger("cvId", id)
                .executeUpdate();
    }

    public Cv getCvComment(int id) {
        // Session session = this.sessionFactory.getCurrentSession();
        //Query query = session.createQuery("SELECT cv.comment  FROM Cv cv WHERE cv.id=:uid");
        // query.setParameter("uid", id);

        // TODO normalize this hql query
        Session session = this.sessionFactory.getCurrentSession();
        Cv cv = (Cv) session.get(Cv.class, id);
        return cv;
    }


    public void changeBookmarkState(int id, int state) {
        Session session = this.sessionFactory.getCurrentSession();
        String hqlUpdate = "update Cv cv set cv.bookmark = :bookmarkState where cv.id = :cvId";

        int updatedEntities = session.createQuery(hqlUpdate)
                .setInteger("bookmarkState", state)
                .setInteger("cvId", id)
                .executeUpdate();
    }

    @SuppressWarnings("unchecked")
    public List<Cv> getBookmarks() {
        Session session = this.sessionFactory.getCurrentSession();
        Criteria criteria = session.createCriteria(Cv.class);
        criteria.add(Restrictions.eq("bookmark", 1));
        return criteria.list();
    }

    public void updateFileName(int id, String filename) {
        Session session = this.sessionFactory.getCurrentSession();

        String hqlUpdate = "update Cv cv set cv.filename = :newFilename where cv.id = :cvId";

        session.createQuery(hqlUpdate)
                .setString("newFilename", filename)
                .setInteger("cvId", id)
                .executeUpdate();
    }


}












