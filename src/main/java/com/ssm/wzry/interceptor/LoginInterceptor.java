package com.ssm.wzry.interceptor;

import com.ssm.wzry.Utils;
import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor {
    static Logger logger = Logger.getLogger(LoginInterceptor.class);
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {

        String url = request.getRequestURI();
        logger.debug(url);

        if(url.equals("/wzry/")){
            return true;
        }

        if(url.indexOf("index.html")>=0 || url.indexOf("doLogin.html")>=0 || url.indexOf("detail.html")>=0){
            return true;
        }

        if(Utils.getLoginUserCustom(request) !=null){
            return true;
        }

        response.setContentType("text/html;charset=utf-8");
        response.getWriter().write("<script>alert('请先登录');history.back();</script>");
        return false;
    }

    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
