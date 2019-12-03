package web.servlet;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

@WebServlet("/checkCode")
public class CheckCode extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1.随机生成字符串
        String code = "QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm0123456798";
        Random rd = new Random();
        String img = "";
        for(int i = 0; i < 4;i++){
            char c = code.charAt(rd.nextInt(code.length()));
            img = img + c;
        }
        HttpSession session = req.getSession();
        session.setAttribute("checkCode",img);

        //2.利用字符串生成一张图片
        //创建图片对象
        BufferedImage  image = new BufferedImage(70,25,BufferedImage.TYPE_INT_RGB);
        //背景色
        Graphics graphics = image.getGraphics();
        graphics.setColor(Color.LIGHT_GRAY);
        graphics.fillRect(0,0,70,25);
        //画边框
        graphics.setColor(Color.white);
        graphics.drawRect(0,0,69,24);
        //写文字
        graphics.setColor(Color.MAGENTA);
        for(int i = 0; i < img.length();i++){
            char c = img.charAt(i);
            graphics.drawString(c + "",12*(i+1),17);
        }
        //画干扰线
        graphics.setColor(Color.CYAN);
        for(int i = 0; i < 1; i++){
            int x1 = rd.nextInt(70);
            int x2 = rd.nextInt(70);
            int y1 = rd.nextInt(25);
            int y2 = rd.nextInt(25);
            graphics.drawLine(x1,y1,x2,y2);
        }

        //3.将图片响应到网页中
        ImageIO.write(image,"bmp",resp.getOutputStream());

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


    }
}
