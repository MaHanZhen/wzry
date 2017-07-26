package com.ssm.wzry;

import com.ssm.wzry.po.UserCustom;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class Utils {

    public static UserCustom getLoginUserCustom(HttpServletRequest request) throws Exception{
        return (UserCustom)request.getSession().getAttribute("userCustom");
    }

    public static String getRealyProjectPath(HttpServletRequest request,String sqlPath) throws Exception{
        return request.getSession().getServletContext().getRealPath(sqlPath)+"/";
    }
}
