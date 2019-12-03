package service;

import dao.CoinBuyerDao;
import dao.UserDao;
import domain.CoinBuyer;
import domain.Result;
import domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import util.Md5Util;

import java.util.List;
import java.util.UUID;

@Service
public class CoinBuyerService {
    @Autowired
    private CoinBuyerDao coinBuyerDao;
    @Autowired
    private UserDao userDao;
    public List<CoinBuyer> findAll(){
        return coinBuyerDao.findAll();
    }
    public Result add(CoinBuyer coinBuyer){
        Result result = new Result();
        User user = userDao.findByPhoneNum(coinBuyer.getUser().getPhoneNum());
        String password = coinBuyer.getUser().getPassword();
        try {
            password = Md5Util.encodeByMd5(password);
            user.setPassword(password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(!(password == user.getPassword())){
            result.setResult(false);
            result.setMessage("密码错误");
            return result;
        }
        coinBuyer.setUser(user);
        coinBuyer.setIid(UUID.randomUUID().toString());
        coinBuyer.setUser(userDao.checkUserByPhoneNum(coinBuyer.getUser().getPhoneNum()));
        coinBuyer.setUid(coinBuyer.getUser().getId());
        coinBuyerDao.add(coinBuyer);
        result.setResult(true);
        return result;
    }
    public List<CoinBuyer> findByUid(int uid){
        return coinBuyerDao.findByUid(uid);
    }
}
