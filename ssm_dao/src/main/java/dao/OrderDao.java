package dao;

import domain.Order;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderDao {
    @Select("select * from market_order")
    List<Order> findAll();
    @Select("select * from market_order where sellerId = #{sellerId}")
    List<Order> findBySellerId(int sellerId );
    @Select("select * from market_order where id = #{id}")
    Order findById(String id);
    @Select("select * from market_order where buyerId = #{buyerId}")
    List<Order> findByBuyerId(int buyerId );
    @Update("update market_order set orderStatus ='1' where id = #{id} ")
    void pay(String id);
    @Insert("insert into market_order values (#{id},#{buyerId},#{tradeNum},#{sellerId},#{orderTime},#{orderStatus},#{tradePrice},#{coinBuyerId})")
    void add(Order order);
    @Delete("delete from market_order where id = #{id} ")
    void delById(String id);
}
