package ru.sober.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import ru.sober.dao.CvDao;
import ru.sober.model.Cv;

import javax.persistence.criteria.CriteriaBuilder;
import javax.sql.DataSource;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

@Controller
public class CvController {

    private CvDao cvServiceImpl;

    @Autowired
    private DataSource dataSource;

    @Autowired(required = true)
    @Qualifier(value = "cvServiceImpl")
    public void setCvService(CvDao cvServiceImpl) {
        this.cvServiceImpl = cvServiceImpl;
    }


    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView getIndex() {
        List<Cv> cvs = cvServiceImpl.listCvs();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("cv/index");
        modelAndView.addObject("cvs", cvs);
        modelAndView.addObject("amount", cvs.size());

        return modelAndView;
    }


    @RequestMapping(value = "/cv/add", method = RequestMethod.GET)
    public String getAdd() {
        return "cv/cv_add";
    }

    @RequestMapping(value = "/cv/add_new_cv", method = RequestMethod.POST)
    public String postAdd(@ModelAttribute("cv") Cv cv) {
        cvServiceImpl.addCv(cv);
        return "redirect:/";
    }


    @RequestMapping(value = "/cv/edit/{id}", method = RequestMethod.POST)
    @ResponseBody
    public String getEdit(@PathVariable("id") String id, @RequestParam("comment") String comment) {
        return "fsd";
    }






    @RequestMapping(value = "/cv/update-comment/{id}", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<String> postUpdateCommentAjax(@PathVariable("id") String id, @RequestParam("comment") String comment) {
        int cvId = Integer.parseInt(id);
        cvServiceImpl.updateCvComment(cvId, comment);
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Content-type", "text/html;charset=UTF-8");
        return new ResponseEntity<String>("true", httpHeaders, HttpStatus.OK);
    }









    @RequestMapping(value = "/cv/get-comment/{id}", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<String> postGetCommentAjax(@PathVariable("id") String id) {
        int cvId = Integer.parseInt(id);

        String comment = cvServiceImpl.getCvComment(cvId);

        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Content-type", "text/html;charset=UTF-8");
        return new ResponseEntity<String>(comment, httpHeaders, HttpStatus.OK);
    }














    @RequestMapping(value = "/cv/get-cv/{id}", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public Cv postGetCvAjax(@PathVariable("id") String id) {
        int cvId = Integer.parseInt(id);

        Cv cv = cvServiceImpl.getCvById(cvId);

        return cv;
    }




    @RequestMapping(value = "/cv/update", method = RequestMethod.POST)
    @ResponseBody
    public void postUpdate(
            @RequestParam(value = "cvId", required = false) Integer cvId,
            @RequestParam(value = "editable_fio", required = false) String editable_fio,
            @RequestParam(value = "editable_email", required = false) String editable_email,
            @RequestParam(value = "editable_phone", required = false) String editable_phone,
            @RequestParam(value = "editable_sellary", required = false) String editable_sellary,
            @RequestParam(value = "editable_birthdate", required = false) String editable_birthdate,
            @RequestParam(value = "editable_experiance_years", required = false) String editable_experiance_years,
            @RequestParam(value = "editable_experiance_places", required = false) String editable_experiance_places,
            @RequestParam(value = "editable_skills", required = false) String editable_skills,
            @RequestParam(value = "editable_about", required = false) String editable_about,
            @RequestParam(value = "editable_comment", required = false) String editable_comment
    ) {

        Cv cv = new Cv();
        cv.setId(cvId);
        cv.setFio(editable_fio);
        cv.setEmail(editable_email);
        cv.setPhone(editable_phone);
        cv.setSellary(editable_sellary);
        cv.setBirthdate(editable_birthdate);
        cv.setExperiance_years(editable_experiance_years);
        cv.setExperiance_places(editable_experiance_places);
        cv.setSkills(editable_skills);
        cv.setAbout(editable_about);
        cv.setComment(editable_comment);


        cvServiceImpl.updateCv(cv);
    }

    /*@RequestMapping(value = "/cv/delete", method = RequestMethod.GET)
    public String getDelete(@RequestParam("id") int id) {
        cvServiceImpl.removeCv(id);
        return "redirect:/";
    }*/

    @RequestMapping(value = "/cv/search", method = RequestMethod.GET)
    public ModelAndView getSearch(
            @RequestParam(value = "search_query") String search_query,
            @RequestParam(value = "names", required = false) String names,
            @RequestParam(value = "birthdates", required = false) String birthdates,
            @RequestParam(value = "phones", required = false) String phones,
            @RequestParam(value = "sellarys", required = false) String sellarys,
            @RequestParam(value = "skills", required = false) String skills,
            @RequestParam(value = "comments", required = false) String comments
    ) {

        Map<String, String> map = new HashMap<String, String>();

        if (names != null)
            map.put("fio", "fio");
        if (birthdates != null)
            map.put("birthdate", "birthdate");
        if (phones != null)
            map.put("phone", "phone");
        if (sellarys != null)
            map.put("sellary", "sellary");
        if (skills != null)
            map.put("skills", "skills");
        if (comments != null)
            map.put("comment", "comment");

        List<Cv> res = cvServiceImpl.searchCvs(map, search_query);
        return new ModelAndView("cv/cv_search_result", "results", res);
    }

    @RequestMapping(value = "/cv/search_view", method = RequestMethod.GET)
    public ModelAndView getSearchView(@RequestParam("id") String id) {
        int cvId = Integer.parseInt(id);
        Cv cv = cvServiceImpl.getCvById(cvId);
        return new ModelAndView("cv/cv_search_view", "cv", cv);
    }




    @RequestMapping(value = "/cv/change-bookmark-state", method = RequestMethod.POST)
    @ResponseBody
    public void postChangeBookmarkState(
            @RequestParam(value = "cvId", required = true) Integer cvId,
            @RequestParam(value = "state", required = true) String state
    ) {
        Integer state2 = Integer.parseInt(state);
        cvServiceImpl.changeBookmarkState(cvId, state2);
    }






    @RequestMapping(value = "/bookmarks", method = RequestMethod.GET, produces = "application/json")
    public ModelAndView getBookmarks() {
        List<Cv> cvs = cvServiceImpl.getBookmarks();

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("cv/bookmarks");
        modelAndView.addObject("cvs", cvs);

        return modelAndView;
    }















}
