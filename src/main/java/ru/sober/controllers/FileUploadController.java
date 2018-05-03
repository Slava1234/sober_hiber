package ru.sober.controllers;


import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.Calendar;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * Handles requests for the application file upload requests
 */
@Controller
public class FileUploadController {

    private static final Logger logger = LoggerFactory
            .getLogger(FileUploadController.class);


    @RequestMapping(value = "/upload", method = RequestMethod.GET)
    public String uploadFileHandler2() {
        return "cv/upload";
    }

    @RequestMapping(value = "/u", method = RequestMethod.GET)
    @ResponseBody
    public String uploadFileHandler3(HttpServletRequest request) {
        String name = "";

        String resources = request.getSession().getServletContext().getRealPath("/resources/") +
                File.separator + "files" + File.separator + name;

        File fileToDelete = new File(resources);
        boolean success = fileToDelete.delete();

        return "status " + success;
    }


    /**
     * Upload single file using Spring Controller
     */
    /*@RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
    public @ResponseBody
    String uploadFileHandler(@RequestParam("file") MultipartFile file,
                             HttpServletRequest request) {

        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();


                // Creating the directory to store file
                //String rootPath = System.getProperty("catalina.home");
                //File dir = new File(rootPath + File.separator + "tmpFiles");


                String resources =  request.getSession().getServletContext().getRealPath("/resources/");
                String path = resources + File.separator + "files";

                File dir = new File(path);

                if (!dir.exists())
                    dir.mkdirs();

                // Create the file on server
                File serverFile = new File(dir.getAbsolutePath()
                        + File.separator + file.getOriginalFilename());
                BufferedOutputStream stream = new BufferedOutputStream(
                        new FileOutputStream(serverFile));
                stream.write(bytes);
                stream.close();

                logger.info("Server File Location="
                        + serverFile.getAbsolutePath());

                return "You successfully uploaded file=" + file.getOriginalFilename();
            } catch (Exception e) {
                return "1 You failed to upload " + file.getOriginalFilename() + " => " + e.getMessage();
            }
        } else {
            return "2 You failed to upload " + file.getOriginalFilename()
                    + " because the file was empty.";
        }
    }*/

    /**
     * Upload multiple file using Spring Controller
     */
    /*@RequestMapping(value = "/uploadMultipleFile", method = RequestMethod.POST)
    public @ResponseBody
    String uploadMultipleFileHandler(@RequestParam("name") String[] names,
                                     @RequestParam("file") MultipartFile[] files) {

        if (files.length != names.length)
            return "Mandatory information missing";

        String message = "";
        for (int i = 0; i < files.length; i++) {
            MultipartFile file = files[i];
            String name = names[i];
            try {
                byte[] bytes = file.getBytes();

                // Creating the directory to store file
                String rootPath = System.getProperty("catalina.home");
                File dir = new File(rootPath + File.separator + "tmpFiles");
                if (!dir.exists())
                    dir.mkdirs();

                // Create the file on server
                File serverFile = new File(dir.getAbsolutePath()
                        + File.separator + name);
                BufferedOutputStream stream = new BufferedOutputStream(
                        new FileOutputStream(serverFile));
                stream.write(bytes);
                stream.close();

                logger.info("Server File Location="
                        + serverFile.getAbsolutePath());

                message = message + "You successfully uploaded file=" + name
                        + "<br />";
            } catch (Exception e) {
                return "You failed to upload " + name + " => " + e.getMessage();
            }
        }
        return message;
    }*/
}