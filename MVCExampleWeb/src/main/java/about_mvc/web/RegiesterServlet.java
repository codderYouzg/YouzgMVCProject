package about_mvc.web;

import about_mvc.bean.User;
import service.IUserService;
import service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @Author: Youzg
 * @CreateTime: 2020-04-19 22:30
 * @PROJECT: YouzgWebs
 * @PACKAGE: ${PACKAGE_NAME}
 * @Description:
 */
@WebServlet(name = "RegiesterServlet", value = "regiester")
public class RegiesterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            //设置编码
            request.setCharacterEncoding("utf-8");
            response.setContentType("text/html;charset=utf-8");
            //获取请求参数，并封装到对象里面
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            User user = new User(username, password);
            //调用service层
            IUserService userService = new UserServiceImpl();
            boolean b = userService.saveUser(user);
            //根据service层返回的结果进行页面的调度
            if(b){
                //注册成功，跳转到登录页面
                response.sendRedirect(request.getContextPath()+"/home.jsp");
            }else{
                //注册失败，跳转到注册页面
                request.getSession().setAttribute("msg","【注册失败】:用户名已存在!");
                response.sendRedirect(request.getContextPath() + "/regiest.jsp");
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
