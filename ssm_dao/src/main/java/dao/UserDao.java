package dao;

import domain.User;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDao {
    @Select("select * from user where phoneNum=#{phoneNum} and password=#{password}")
    @Results(id = "userMapper",value = {
            @Result(id = true, property = "id",column = "id"),
            @Result(property = "username",column = "username"),//只是更名而已
            @Result(property = "coin",column = "id",one = @One(
                    select = "dao.CoinDao.findCoinByUid",fetchType = FetchType.LAZY
            )),
            @Result(property = "tasks",column = "id",many = @Many(
                    select = "dao.TaskDao.findTaskByUid",fetchType = FetchType.EAGER
            )),
            @Result(property = "commodities",column = "id",many = @Many(
                    select = "dao.CommodityDao.findCommodityByCid",fetchType = FetchType.EAGER
            )),
    })
    User findUserByPhoneNumAndPassword(User user);
    @Select("select * from user where phoneNum=#{phoneNum} ")
    User checkUserByPhoneNum(String phoneNum);
    @Select("update user set active='Y' where phoneNum=#{phoneNum}")
    void changeUserActive(String phoneNum);
    @Insert("insert into user(" +
            "username,phoneNum,password,uimg," +
            "inviter,buyOrSell,certifyYoN,date) " +
            "values(#{username},#{phoneNum},#{password},#{uimg},#{inviter},#{buyOrSell},#{certifyYoN},#{date})")
    void addUser(User user);
    @Update("update user set password=#{password} where phoneNum=#{phoneNum} ")
    void changePassword(User user);
    @Update("update user set buyOrSell='B',tradeNum=#{tradeNum} where phoneNum=#{phoneNum} and password=#{password}")
    void addBuyer(User buyer);
//    @Update("update user set inviteNum=#{inviteNum} where phoneNum=#{phoneNum}")
//    void changeInviteNum(user user);



    //true为交易成功，false为交易失败
    @Update("update user set certifyYoN='Y'  where phoneNum=#{phoneNum} and certifyYoN='N'")
    @Results(id = "userMapper1",value = {
            @Result(property = "tasks",column = "id",many = @Many(
                    select = "dao.TaskDao.certify",fetchType = FetchType.EAGER
            )),
    })
    void certify(User user);
    @Update("update user set username=#{username},password=#{password},uimg=#{uimg} where phoneNum=#{phoneNum}")
    void updateUserMsg(User user);
    @ResultMap("userMapper")
    @Select("select * from user where id = #{id}")
    User findById(int id);
    @ResultMap("userMapper")
    @Select("select * from user where phoneNum = #{phoneNum}")
    User findByPhoneNum(String phoneNum);


}
