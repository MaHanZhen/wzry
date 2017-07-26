package com.ssm.wzry.controller;

import com.ssm.wzry.Utils;
import com.ssm.wzry.po.*;
import com.ssm.wzry.service.ArticleService;
import com.ssm.wzry.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.PrintWriter;
import java.util.Date;
import java.util.UUID;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private ArticleService articleService;

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
            , HttpServletRequest request, HttpServletResponse response
    ) throws Exception {
        UserCustom userCustom = userService.queryUserAndUpdateUserStatus(userSelectVo);
        if (userCustom == null) {
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().write("<script>alert('用户名或密码错误；登录失败！');history.back();</script>");
        } else {
            request.getSession().setAttribute("userCustom", userCustom);
            response.sendRedirect("index.html");
        }
    }

    @RequestMapping(value = "doLogout")
    public String doLogout(HttpServletRequest request) throws Exception {

        UserCustom userCustom = Utils.getLoginUserCustom(request);

        userService.updateUserStatus(userCustom);
        request.getSession().setAttribute("userCustom", null);

        return "redirect:index.html";
    }

    @RequestMapping(value = "postArticle")
    public void postArticle(ArticleSelectVo articleSelectVo, HttpServletRequest request, HttpServletResponse response) throws Exception {

        //从页面接收的参数
        //        title content zoneId
        //从会话获取的参数
        //        userId posterName
        //当前时间
        //        postTime
        articleSelectVo.setUserCustom(Utils.getLoginUserCustom(request));
        articleSelectVo.getArticleCustom().setPosttime(new Date());

        System.out.print(articleSelectVo);
        int result = articleService.insertArticle(articleSelectVo);
        if (result == 0) {
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().write("<script>alert('发帖失败');history.back();</script>");
        } else {
            response.sendRedirect("index.html?zoneId="+articleSelectVo.getArticleCustom().getZoneid());
        }
    }

    @RequestMapping(value = "likeArticle")
    public String likeArticle(int articleId, HttpServletRequest request) throws Exception {
        articleService.updateLikeCountByArticleId(articleId, Utils.getLoginUserCustom(request).getUserid());

        return "redirect:detail.html?articleId=" + articleId;
    }


    @RequestMapping(value = "comment")
    public void comment(Comment comment, HttpServletRequest request, HttpServletResponse response) throws Exception {
        UserCustom userCustom = Utils.getLoginUserCustom(request);

        comment.setCommentusername(userCustom.getUsername());
        comment.setUserid(userCustom.getUserid());
        comment.setCommenttime(new Date());
        comment.setCommentstatus(0);

        articleService.updateArticleCommentCountByArticleId(comment.getArticleid());

        int result = articleService.insertComment(comment);

        response.setContentType("text/html;charset=utf-8");
        if (result == 0) {
            response.getWriter().write("<script>alert('评论失败');history.back();</script>");
        } else {
            response.getWriter().write("<script>alert('评论成功');</script>");
            response.sendRedirect("detail.html?articleId=" + comment.getArticleid());
        }
    }

    @RequestMapping(value = "commentReply")
    public void commentReply(CommentReply commentReply, int articleid, HttpServletRequest request, HttpServletResponse response) throws Exception {
        UserCustom userCustom = Utils.getLoginUserCustom(request);

        commentReply.setReplyername(userCustom.getUsername());
        commentReply.setUserid(userCustom.getUserid());
        commentReply.setReplytime(new Date());


        response.setContentType("text/html;charset=utf-8");
        int result = articleService.insertCommentReply(commentReply);
        if (result == 0) {
            response.getWriter().write("<script>alert('评论失败');history.back();</script>");
        } else {
            response.getWriter().write("<script>alert('评论成功');</script>");
            response.sendRedirect("detail.html?articleId=" + articleid);
        }
    }

    @RequestMapping("changeUser")
    public void changeUser(UserSelectVo userSelectVo,
                           @RequestParam("pic") CommonsMultipartFile pic,
                           HttpServletRequest request, HttpServletResponse response) throws Exception {

        if (pic != null && pic.getSize() != 0) {
            String filename = pic.getOriginalFilename();
            String newFileName = UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
            String sqlPath = "upload/images";
            File file = new File(Utils.getRealyProjectPath(request, sqlPath) + newFileName);
            pic.transferTo(file);
            userSelectVo.getUserCustom().setPicurl(sqlPath + "/" + newFileName);
        }

        userService.updateUser(userSelectVo);


        response.setContentType("text/html;charset=utf-8");

        response.getWriter().write("<script>alert('修改成功,请重新登录');</script>");

        response.sendRedirect("doLogout.html");
    }


    @RequestMapping(value = "changePass", params = {"oldPass", "newPassAgain", "newPass", "userCustom.userid"})
    public void changeUser(UserSelectVo userSelectVo, HttpServletRequest request, HttpServletResponse response) throws Exception {
        response.setContentType("text/html;charset=utf-8");
        UserCustom userCustom= Utils.getLoginUserCustom(request);
        if (!userSelectVo.getOldPass().equals( Utils.getLoginUserCustom(request).getUserpass())) {
            request.setAttribute("msg", "密码错误");
            request.getRequestDispatcher("userPwd.html").forward(request, response);
        } else if (!userSelectVo.getNewPass().equals(userSelectVo.getNewPassAgain())) {
            request.setAttribute("msg", "新密码与确认密码不一致");
            request.getRequestDispatcher("userPwd.html").forward(request, response);
        } else {
            userSelectVo.getUserCustom().setUserpass(userSelectVo.getNewPassAgain());
            userService.updateUser(userSelectVo);
            response.sendRedirect("doLogout.html");
        }


    }
}
