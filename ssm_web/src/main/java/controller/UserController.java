package controller;

import domain.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import service.CommodityService;
import service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Controller
@RequestMapping("/user")
@SessionAttributes("user")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private CommodityService commodityService;
    @Autowired
    private HttpServletRequest request;


    @ModelAttribute
    public void before(HttpServletRequest request, User user) {
        user.setDate(new Date());
    }
    @RequestMapping("/login")
    public ModelAndView login(HttpServletRequest request,User user) {
        ModelAndView modelAndView = new ModelAndView();
        ModelMap modelMap = modelAndView.getModelMap();
        Result result = new Result();
        //UserService.changeInviteNum(user);
        Map<User, Result> map1 = userService.login(user);
        Set<Map.Entry<User, Result>> entries = map1.entrySet();
        for (Map.Entry<User, Result> entry : entries) {
            result = entry.getValue();
            result.setResult(true);
            user = entry.getKey();
        }
        if (!result.isResult()) {
            modelMap.addAttribute("result", result);
            modelAndView.setViewName("result");
        } else {
            user.setPassword("0");
            List<Commodity> commodities = commodityService.showAllCommodities();
            modelMap.addAttribute("user", user);
            modelMap.addAttribute("commodities", commodities);
            request.getSession().setAttribute("user",user);
            request.getSession().setAttribute("commodities",commodities);
            modelAndView.setViewName("home");
        }
        return modelAndView;
    }
    @RequestMapping("/register")
    public ModelAndView register1(HttpServletRequest request,User user, String checkCode) throws MyException {
        ModelAndView modelAndView = new ModelAndView();
        HttpSession session = request.getSession();
        String checkCode1 = (String) session.getAttribute("checkCode");
        Result result = userService.register(user, checkCode, checkCode1);
        modelAndView.setViewName(request.getContextPath() + "result");
        ModelMap modelMap = modelAndView.getModelMap();
        modelMap.addAttribute("result", result);
        return modelAndView;
    }
    @RequestMapping("/forgetPwd")
    public ModelAndView forgetPwd(HttpServletRequest request,User user, String checkCode) {
        ModelAndView modelAndView = new ModelAndView();
        HttpSession session = request.getSession();
        String checkCode1 = (String) session.getAttribute("checkCode");
        Result result = userService.changePassword(user, checkCode, checkCode1);
        modelAndView.setViewName(request.getContextPath() + "result");
        ModelMap modelMap = modelAndView.getModelMap();
        modelMap.addAttribute("result", result);
        return modelAndView;
    }
    @RequestMapping("/detail")
    public String mine(HttpServletRequest request) {
        return "mine";
    }

    @RequestMapping("/checkPhoneNum")
    public @ResponseBody
    Result checkPhoneNum(HttpServletRequest request,String phoneNum) {
        Result result = userService.checkPhoneNum(phoneNum);
        return result;
    }

    @RequestMapping("/certify")
    public ModelAndView certify(HttpServletRequest request,User user) {//此时使用的user就是session中的user
        Result result = userService.certify(user);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("result");
        modelAndView.getModelMap().addAttribute("result",result);
        return modelAndView;
    }

    @RequestMapping("/upload")
    public @ResponseBody Result uploadUimg(HttpServletRequest request,MultipartFile file) throws Exception {
        return userService.updateUimg(file);
    }

    @RequestMapping("/updateMsg")
    public String updateMsg(HttpServletRequest request,User user) throws Exception {
        userService.updateUserMsg(user);
        return "mine";
    }
    @RequestMapping("/sell")
    public ModelAndView sell(CoinBuyer coinBuyer){
        ModelAndView modelAndView = new ModelAndView();
        User user = (User)request.getSession().getAttribute("user");
        boolean b = userService.tradePre(coinBuyer, user);
        String msg = b == true ? "交易成功，等待买家打款" : "交易失败,您的趣豆余额不足!";
        Result result = new Result();
        result.setResult(b);
        result.setMessage(msg);
        modelAndView.setViewName("result");
        modelAndView.getModelMap().addAttribute("result",result);
        return modelAndView;
    }
    @RequestMapping("/trade")
    public ModelAndView trade(CoinBuyer coinBuyer){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.getModelMap().addAttribute("coinBuyer",coinBuyer);
        modelAndView.setViewName("sell");
        return modelAndView;

    }


}
