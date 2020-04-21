package about_mvc.web;

import about_mvc.bean.User;
import org.apache.commons.beanutils.BeanUtils;
import service.IUserService;
import service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

/**
 * @Author: Youzg
 * @CreateTime: 2020-04-19 20:28
 * @PROJECT: YouzgWebs
 * @PACKAGE: ${PACKAGE_NAME}
 * @Description:
 */
@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setCharacterEncoding("utf-8");
            response.setContentType("text/html;charset=utf-8");
            Map<String, String[]> map = request.getParameterMap();
            User user = new User();
            BeanUtils.populate(user,map);
            IUserService userService = new UserServiceImpl();
            User successUser = userService.login(user);
            if(successUser!=null){
                String remember = request.getParameter("remember");
                if(remember!=null){
                    Cookie uCookie = new Cookie("uname", successUser.getName());
                    Cookie pCookie = new Cookie("pwd", successUser.getPassword());
                    uCookie.setMaxAge(60 * 60 * 24 * Integer.parseInt(remember));
                    pCookie.setMaxAge(60 * 60 * 24 * Integer.parseInt(remember));
                    response.addCookie(uCookie);
                    response.addCookie(pCookie);
                }
                //登录成功跳转到主页
                request.getSession().setAttribute("user", successUser);
                response.sendRedirect(request.getContextPath() + "/home.jsp");

            }else{
                //登录失败跳转到登录页面
                request.getSession().setAttribute("msg","用户名或密码错误");
                response.sendRedirect(request.getContextPath()+"/login.jsp");
            }
        } catch (Exception e) {
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

}
