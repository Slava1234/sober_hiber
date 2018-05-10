package ru.sober.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.sober.dao.CvDao;
import ru.sober.model.Cv;

import java.util.List;
import java.util.Map;

@Service
public class CvServiceImpl implements CvDao {

    private CvDao cvDao;

    public void setCvDao(CvDao cvDao) {
        this.cvDao = cvDao;
    }

    @Override
    @Transactional
    public void addCv(Cv cv) {
        this.cvDao.addCv(cv);
    }

    @Override
    @Transactional
    public void updateCv(Cv cv) {
        this.cvDao.updateCv(cv);
    }

    @Override
    @Transactional
    public void removeCv(int id) {
        this.cvDao.removeCv(id);
    }

    @Override
    @Transactional
    public Cv getCvById(int id) {
        return this.cvDao.getCvById(id);
    }

    @Override
    @Transactional
    public List<Cv> listCvs() {
        return this.cvDao.listCvs();
    }

    @Override
    @Transactional
    public List<Cv> searchCvs(Map<String, String> map, String searchQuery) {
        return this.cvDao.searchCvs(map, searchQuery);
    }

    @Override
    @Transactional
    public void updateCvComment(int id, String comment) {
        this.cvDao.updateCvComment(id, comment);
    }

    @Override
    @Transactional
    public Cv getCvComment(int id) {
        return this.cvDao.getCvComment(id);
    }

    @Override
    @Transactional
    public void changeBookmarkState(int id, int state) {
        this.cvDao.changeBookmarkState(id, state);
    }

    @Override
    @Transactional
    public List<Cv> getBookmarks() {
        return this.cvDao.getBookmarks();
    }

    @Override
    @Transactional
    public void updateFileName(int id, String filename) {
        this.cvDao.updateFileName(id, filename);
    }


}










