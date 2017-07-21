package com.ssm.wzry.controller;

import com.ssm.wzry.po.UserCustom;
import com.ssm.wzry.po.UserSelectVo;
import com.ssm.wzry.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("register")
    public String register() throws Exception {
        return "register";
    }

    @RequestMapping(value = "doRegister", params = {"userCustom.username", "userCustom.userpass"}, method = RequestMethod.POST)
    public String doRegister(UserSelectVo userSelectVo, Model model) throws Exception {

        int result = userService.insertUser(userSelectVo);
        if (result == 0) {
            model.addAttribute("error", "该用户已经被注册");
            return "forward:register.html";
        }
        return "register_success";
    }

    @RequestMapping(value = "doLogin", params = {"userCustom.username", "userCustom.userpass"})
    public void doLogin(UserSelectVo userSelectVo
            , HttpServletRequest request,HttpServletResponse response
    ) throws Exception {
        UserCustom userCustom = userService.queryUserAndUpdateUserStatus(userSelectVo);
        if (userCustom == null) {
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().write("<script>alert('用户名或密码错误；登录失败！');history.back();</script>");
        }else{
            request.getSession().setAttribute("userCustom", userCustom);
            response.sendRedirect("index.html");
        }
    }

    @RequestMapping(value = "doLogout")
    public String doLogout(HttpSession session, Model model) throws Exception {
        UserCustom userCustom = (UserCustom)session.getAttribute("userCustom");

        userService.updateUserStatus(userCustom);
        session.setAttribute("userCustom",null);

        return "redirect:index.html";
    }

}
