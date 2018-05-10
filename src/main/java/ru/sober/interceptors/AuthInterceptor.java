package ru.sober.interceptors;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.session.MapSession;
import org.springframework.session.Session;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import ru.sober.controllers.FileUploadController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AuthInterceptor /*extends HandlerInterceptorAdapter*/ {
   /* private static final Logger logger = LoggerFactory.getLogger(FileUploadController.class);

    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object handler) throws Exception {

        String userIp =  request.getRemoteAddr();

        logger.info("User ip: " + userIp);

        //Session session = new MapSession();




        response.sendRedirect(request.getContextPath()+"/auth");
        return false;


        //return super.preHandle(request, response, handler);
    }*/
}
