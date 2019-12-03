package service;


import dao.CoinBuyerDao;
import dao.CoinDao;
import dao.OrderDao;
import domain.*;
import dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import util.Md5Util;
import util.UpdateUtil;

import java.io.IOException;
import java.util.*;
//import java.util.Random;

//ctrl + alt + o 整理导包
//ctrl + shift + inter 光标下一行
// alt + 方向键 跳转方法
//ctrl + m 光标居中
@Service
@Transactional
public class UserService {
    @Autowired
    private UserDao userDao;
    @Autowired
    private CoinDao coinDao;
    @Autowired
    private CoinBuyerDao coinBuyerDao;
    @Autowired
    private OrderDao orderDao;

    public Map<User, Result> login(User user) {
        Result result = new Result();
        String password = user.getPassword();

        try {
            password = Md5Util.encodeByMd5(password);
            user.setPassword(password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (userDao.findUserByPhoneNumAndPassword(user) != null) {
            //此user是用户输入的数据组成的user，而不是数据库中的user
            user = userDao.findUserByPhoneNumAndPassword(user);
            result.setResult(true);

        } else {
            result.setResult(false);
            result.setMessage("帐号或密码错误，请重新<a href='http://localhost:8081/index.jsp'>登录</a>");
        }
        Map<User, Result> map = new HashMap<>();
        map.put(user, result);
        return map;
    }

    public Result checkPhoneNum(String phoneNum) {
        User user = userDao.checkUserByPhoneNum(phoneNum);
        Result result = new Result();
        if (user == null) {
            result.setResult(true);
            result.setMessage("该用户尚未注册");
        } else {
            result.setResult(false);
            result.setMessage("用户名已存在");
        }
        return result;
    }

    public User findUserByPhoneNum(String phoneNum) {
        User user = userDao.checkUserByPhoneNum(phoneNum);
        return user;
    }

    public Result register(User user, String checkCode, String checkCode1) throws MyException {
        Result Result = new Result();
        if (!checkCode1.equalsIgnoreCase(checkCode)) {
            Result.setResult(false);
            Result.setMessage("验证码错误，请重新<a href='http://localhost:8081/register.jsp'>注册</a>");
        } else {
            String password = user.getPassword();
            if (password.length() < 6) {
                throw new MyException("注册密码不符合规范", "33005");
            }
            try {
                password = Md5Util.encodeByMd5(password);
                user.setPassword(password);
            } catch (Exception e) {
                e.printStackTrace();
            }
            //无重复手机号
            if (userDao.checkUserByPhoneNum(user.getPhoneNum()) == null) {
                user.setBuyOrSell("S");
                user.setCertifyYoN("N");
                user.setUimg("/img/market/user_img.png");
                user.setUsername("趣友" + user.getPhoneNum());
                Result.setResult(true);
                Result.setMessage("注册成功，请<a href='http://localhost:8081/index.jsp'>登录</a>！");
                userDao.addUser(user);
            } else {
                Result.setResult(false);
                Result.setMessage("手机号已注册，请重新<a href='http://localhost:8081/register.jsp'>注册</a>或<a href='http://localhost:8081/index.jsp'>登录</a>");
            }
        }
        return Result;
    }

    public Result changePassword(User user, String checkCode, String checkCode1) {
        Result Result = new Result();
        if (!checkCode1.equalsIgnoreCase(checkCode)) {
            Result.setResult(false);
            Result.setMessage("验证码错误，请重新<a href='http://localhost:8081/forgetPassword.jsp'>重置</a>");
        } else {
            String password = user.getPassword();
            try {
                password = Md5Util.encodeByMd5(password);
                user.setPassword(password);
                userDao.changePassword(user);
            } catch (Exception e) {
                e.printStackTrace();
            }
            Result.setResult(true);
            Result.setMessage("密码重置成功，请<a href='http://localhost:8081/index.jsp'>登录</a>");
        }
        return Result;
    }

    public void addBuyer(User buyer) {
        String password = buyer.getPassword();
        try {
            password = Md5Util.encodeByMd5(password);
            buyer.setPassword(password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        userDao.addBuyer(buyer);
    }

    public void addSeller(User buyer) {
        userDao.addBuyer(buyer);
    }

    public boolean tradePre(CoinBuyer coinBuyer, User seller) {
        if (seller.getCoin().getCoinNum() < coinBuyer.getTradeNum()){
            return false;
        }
        Order order = new Order();
        order.setId(UUID.randomUUID().toString());
        order.setOrderStatus(0);
        order.setOrderTime(new Date());
        order.setTradeNum(coinBuyer.getTradeNum());
        order.setTradePrice(coinBuyer.getTradePrice());
        User buyer = new User();
        if (coinBuyer.getUser() != null) {
            buyer = userDao.findByPhoneNum(coinBuyer.getUser().getPhoneNum());
        }
        order.setBuyerId(buyer.getId());
        order.setSellerId(seller.getId());
        order.setCoinBuyerId(coinBuyer.getIid());
        orderDao.add(order);
        return true;
    }

    public void trade(Order order) {
        User buyer = userDao.findById(order.getBuyerId());
        User seller = userDao.findById(order.getSellerId());
        if (buyer.getCoin() != null) {
            buyer.getCoin().setCoinNum(buyer.getCoin().getCoinNum() + order.getTradeNum());
        }
        if (seller.getCoin() != null) {
            seller.getCoin().setCoinNum(seller.getCoin().getCoinNum() - order.getTradeNum());
        }

        coinDao.updateCoinNum(buyer.getCoin());
        coinDao.updateCoinNum(seller.getCoin());
        coinBuyerDao.del(order.getCoinBuyerId());

    }

    public void answer(User user) {
        List<Task> tasks = user.getTasks();
        for (Task task : tasks) {
            task.getTaskLevel();
        }


        //userDao.changeCoin(user, coin);


    }

    //    public static void checkIn(user user) {
//        Random rd = new Random();
//        double coin = rd.nextInt(50) * 0.001;
//        userDao.changeCoin(user, coin);
//    }
//
//    public  user release(user user) {
//        if (!"".equals(user)) {
//            double coin = user.getInviteNum() * 0.4 * 0.02;
//            user =  userDao.changeCoinAndRelease(user, coin);
//        }
//        return user;
//    }
//
//    public void buyTask(user user) {
//        if (!"".equals(user)) {
//            double coin = -10;
//            userDao.changeCoinAndTask(user, coin);
//        }
//    }
//    public  Result buyCom(user user, double user) {
//        Result result = new Result();
//        if (!"".equals(user)) {
//            result.setResult(true);
//            result.setMessage("购买成功，返回<a href='http://localhost:8081/do/showAllCom'>首页</a>");
//            userDao.changeCoin(user, user);
//        }
//        return result;
//    }
//
    public Result certify(User user) {
        Result result = new Result();
        if (!"".equals(user)) {
            if ("Y".equals(user.getCertifyYoN())) {
                result.setResult(false);
                result.setMessage("您已实名！请勿重新实名");
            } else {
                userDao.certify(user);
                result.setResult(true);
                result.setMessage("实名认证成功！");
            }
        }
        return result;
    }

    //    public static int findInviteNum(user user) {
//        int inviteNum = userDao.findInviteNum(user);
//        return inviteNum;
//    }
//
    public void changeInviteNum(User user) {
        //userDao.changeInviteNum(user);
    }

    public void updateUserMsg(User user) {
        String password = user.getPassword();
        try {
            password = Md5Util.encodeByMd5(password);
            user.setPassword(password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        user.setPassword(password);
        userDao.updateUserMsg(user);
    }

    public Result updateUimg(MultipartFile file) {
        String path = "http://localhost:81/upload/";
        //获取文件名
        String fileName = file.getOriginalFilename();
        fileName = UUID.randomUUID() + fileName;
        try {
            UpdateUtil.uploadToService(file, path + fileName);
        } catch (IOException e) {
            e.printStackTrace();
        }
        Result result = new Result(path + fileName, true);
        return result;
    }

}
