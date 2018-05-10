package ru.sober.controllers;

import org.apache.commons.lang3.StringEscapeUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.session.MapSession;
import org.springframework.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import ru.sober.dao.CvDao;
import ru.sober.model.Cv;

import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class CvController {

    // TODO resources and path vars are duplicated
    // TODO file upload implementations are duplicated

    private String timeStampFileName = null;

    private static final Logger logger = LoggerFactory.getLogger(FileUploadController.class);

    private CvDao cvServiceImpl;

    @Autowired
    private DataSource dataSource;

    @Autowired(required = true)
    @Qualifier(value = "cvServiceImpl")
    public void setCvService(CvDao cvServiceImpl) {
        this.cvServiceImpl = cvServiceImpl;
    }


    @RequestMapping(value = "/", method = RequestMethod.GET, produces = "application/json")
    //@Cacheable("indexResults")
    public ModelAndView getIndex() {
        long start = System.nanoTime();
        List<Cv> cvs = cvServiceImpl.listCvs();

        String path = "resources" + File.separator + "files" + File.separator;

        // if cv has file update filename with full path (to provide convenient download link)
        for (Cv cv : cvs) {
            if (cv.getFilename() != null) {
                cv.setFilename(path + cv.getFilename());
            }

            // unescape html entities
            cv.setExperiance_years(StringEscapeUtils.unescapeHtml4(cv.getExperiance_years()));
        }



        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("cv/index");
        modelAndView.addObject("cvs", cvs);




        long finish = System.nanoTime();
        long timeConsumedMillis = finish - start;



        modelAndView.addObject("time", timeConsumedMillis);
        return modelAndView;
    }


    @RequestMapping(value = "/cacheEvictMainPage", method = RequestMethod.GET)
    @CacheEvict(value = "indexResults", allEntries = true)
    public String cacheEvictMainPage() {
        return "redirect:/";
    }



    @RequestMapping(value = "/cv/add", method = RequestMethod.GET)
    public String getAdd() {
        return "cv/cv_add";
    }


    @RequestMapping(value = "/cv/add_new_cv", method = RequestMethod.POST)
    public String postAdd(@ModelAttribute("cv") Cv cv,
                          @RequestParam("file") MultipartFile file,
                          HttpServletRequest request) {

        cv.setBirth(this.reformatRowDate(cv.getBirthdate()));
        String timeStamp = null;

        uploadFile(file, request);


        cv.setFilename(timeStampFileName);
        cvServiceImpl.addCv(cv);



        return "redirect:/";
    }


    /**
     * Deletes file if exists
     *
     * @param fileName that is present in db
     * @param request
     * @return true if delete was successful
     */
    private boolean deleteFile(String fileName, HttpServletRequest request) {
        String resources = request.getSession().getServletContext().getRealPath("/resources/") +
                File.separator + "files" + File.separator + fileName;

        File fileToDelete = new File(resources);
        return fileToDelete.delete();
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
    //public ResponseEntity<String> postGetCommentAjax(@PathVariable("id") String id) {
    public Cv postGetCommentAjax(@PathVariable("id") String id) {
        int cvId = Integer.parseInt(id);

        /*String comment = cvServiceImpl.getCvComment(cvId);



        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Content-type", "text/html;charset=UTF-8");
        return new ResponseEntity<String>(comment, httpHeaders, HttpStatus.OK);*/
        return cvServiceImpl.getCvComment(cvId);
    }



    @RequestMapping(value = "/cv/get-cv/{id}", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public Cv postGetCvAjax(@PathVariable("id") String id) {
        int cvId = Integer.parseInt(id);

        Cv cv = cvServiceImpl.getCvById(cvId);

        String path = "resources" + File.separator + "files" + File.separator + cv.getFilename();

        cv.setFilename(path);

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
            @RequestParam(value = "editable_birth", required = false) String editable_birth,
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
        cv.setBookmark(0);

        if (editable_birth != null)
            cv.setBirth(this.reformatRowDate(editable_birth));


        cvServiceImpl.updateCv(cv);
    }

    /**
     * Reform date according to postgres date type format
     *
     * @param rowDate row date format
     * @return Date
     */
    private Date reformatRowDate(String rowDate) {
        String[] as = rowDate.split("\\.");
        StringBuilder sb = new StringBuilder();

        for (int j = as.length - 1; j >= 0; j--) {
            String dash = "";
            if (j != 0)
                dash = "-";
            sb.append(as[j] + dash);
        }

        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date parsed = null;
        try {
            parsed = format.parse(sb.toString());
        } catch (ParseException e) {
            e.printStackTrace();
        }

        java.sql.Date sql = null;
        try {
            sql = new java.sql.Date(parsed.getTime());
        } catch (NullPointerException e) {
            e.printStackTrace();
        }
        return sql;
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

    @RequestMapping(value = "/upload-new-cv-file", method = RequestMethod.GET)
    public String getUploadNewCvFile() {
        return "cv/upload";
    }

    @RequestMapping(value = "/upload-new-cv-file-handler", method = RequestMethod.POST)
    public String postUploadNewCvFile(@RequestParam("id") Integer id,
                          @RequestParam("file") MultipartFile file,
                          HttpServletRequest request) {


        Cv cv = this.cvServiceImpl.getCvById(id);


        // before update delete the file if exists
        if (cv.getFilename() != null) {
            String resources = request.getSession().getServletContext().getRealPath("/resources/") +
                    File.separator + "files" + File.separator + cv.getFilename();

            File fileToDelete = new File(resources);
            boolean status = fileToDelete.delete();
            if(status) {
                logger.info("file " + resources + " has been successfully deleted");
            }
        }


        uploadFile(file, request);

        this.cvServiceImpl.updateFileName(id, timeStampFileName);
        return "redirect:/";
    }


    private void uploadFile(MultipartFile file, HttpServletRequest request) {

        String timeStamp = null;

        // upload file
        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();

                String resources = request.getSession().getServletContext().getRealPath("/resources/");
                String path = resources + File.separator + "files";

                File dir = new File(path);

                if (!dir.exists())
                    dir.mkdirs();

                // Create the file on server
                timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(Calendar.getInstance().getTime());
                timeStampFileName = timeStamp + "_" + file.getOriginalFilename();

                File serverFile = new File(dir.getAbsolutePath()
                        + File.separator + timeStampFileName);
                BufferedOutputStream stream = new BufferedOutputStream(
                        new FileOutputStream(serverFile));
                stream.write(bytes);
                stream.close();

                logger.info("Server File Location=" + serverFile.getAbsolutePath());

                logger.info("You successfully uploaded file=" + file.getOriginalFilename());
            } catch (Exception e) {
                logger.error("You failed to upload " + file.getOriginalFilename() + " => " + e.getMessage());
            }
        } else {
            logger.error("2 You failed to upload " + file.getOriginalFilename()
                    + " because the file was empty.");
        }
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
