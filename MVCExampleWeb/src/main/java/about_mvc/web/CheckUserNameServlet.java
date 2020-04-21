package about_mvc.web;

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
 * @CreateTime: 2020-04-19 22:41
 * @PROJECT: YouzgWebs
 * @PACKAGE: ${PACKAGE_NAME}
 * @Description:
 */
@WebServlet(name = "CheckUserNameServlet", value = "/check")
public class CheckUserNameServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setCharacterEncoding("utf-8");
            String username = request.getParameter("username");
            //调用dao
            IUserService userService = new UserServiceImpl();
            boolean b = userService.isPresent(username);
            if(b){
                response.getWriter().write("no");
            }else{
                response.getWriter().write("yes");
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
