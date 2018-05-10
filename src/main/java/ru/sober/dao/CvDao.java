package ru.sober.dao;

import ru.sober.model.Cv;

import java.util.List;
import java.util.Map;

public interface CvDao {
    public void addCv(Cv cv);

    public void updateCv(Cv cv);

    public void updateCvComment(int id, String comment);

    public Cv getCvComment(int id);

    public void removeCv(int id);

    public Cv getCvById(int id);

    public List<Cv> listCvs();

    public List<Cv> searchCvs(Map<String, String> map, String searchQuery);

    public void changeBookmarkState(int id, int state);

    public List<Cv> getBookmarks();

    public void updateFileName(int id, String filename);
}
