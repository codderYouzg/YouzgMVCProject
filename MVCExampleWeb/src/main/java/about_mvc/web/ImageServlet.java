package about_mvc.web;

import about_mvc.web_util.VerifyCodeUtils;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;

/**
 * @Author: Youzg
 * @CreateTime: 2020-04-19 22:04
 * @PROJECT: YouzgWebs
 * @PACKAGE: ${PACKAGE_NAME}
 * @Description:
 */
@WebServlet(name = "ImageServlet", value = "/image")
public class ImageServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int width = 200;
        int height = 50;
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        String yzmStr = VerifyCodeUtils.drawRandomText(width, height, image);
        ServletContext servletContext = getServletContext();
        servletContext.setAttribute("yzm", yzmStr);
        ImageIO.write(image, "png", response.getOutputStream());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

}
