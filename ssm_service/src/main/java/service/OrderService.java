package service;

import dao.OrderDao;
import domain.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class OrderService {
    @Autowired
    private OrderDao orderDao;
    @Autowired
    private UserService userService;
    public List<Order> findBySellerId(int sellerId){
        return orderDao.findBySellerId(sellerId);
    }
    public List<Order> findByBuyerId(int buyerId){
        return orderDao.findBySellerId(buyerId);
    }
    public List<Order> findByUid(int uid){
        sort();
        List<Order> orders = orderDao.findBySellerId(uid);
        for(Order order:orderDao.findByBuyerId(uid)){
            orders.add(order);
        }
        return orders;
    }
    public Order findById(String id){
        return orderDao.findById(id);

    }
    public void sort(){
        List<Order> orders = orderDao.findAll();
        for(Order order:orders){
            if(order.getOrderStatus() == 0 && (new Date().getTime() - order.getOrderTime().getTime())>10*1000 ){
                orderDao.delById(order.getId());
            }
        }
    }
    public void pay(String id){//订单id
        Order order = orderDao.findById(id);
        userService.trade(order);
        orderDao.pay(id);

    }
}
