package ru.sober.controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;


@Controller
public class TestController {

    private static final Logger logger = LoggerFactory.getLogger(FileUploadController.class);


    @RequestMapping(value = "/cv/test/update", method = RequestMethod.POST)
    @ResponseBody
    public String postUpdateTest(@RequestParam(value = "editable_file", required = false) MultipartFile file,
                                 HttpServletRequest request) {
        String timeStamp = null;
        String timeStampFileName = null;

        // upload file
        /*if (!file.isEmpty()) {
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
        }*/

        return "success + " ;
    }

    @RequestMapping(value = "/cv/test", method = RequestMethod.GET)
    public String getTest() {

        return "cv/test";
    }

}
