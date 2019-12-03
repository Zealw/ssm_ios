package controller;

import domain.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import service.OrderService;

import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderController {
    @Autowired
    private OrderService orderService;
    @RequestMapping("/findByUid")
    public ModelAndView findByUid(int id){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("orderPlus");
        List<Order> orders = orderService.findByUid(id);
        modelAndView.getModelMap().addAttribute("orders",orders);
        return modelAndView;
    }
    @RequestMapping("/pay")
    public ModelAndView pay(String id){//订单id

        orderService.pay(id);

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("redirect:/order/findByUid");
        int uid = orderService.findById(id).getBuyerId();
        modelAndView.getModelMap().addAttribute("id",uid);
        return modelAndView;
    }
}
