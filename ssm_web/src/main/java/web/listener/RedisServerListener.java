package web.listener;

import util.RedisServerUtil;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

//@WebListener
public class RedisServerListener implements ServletContextListener {

    @Override
    public  void contextInitialized(ServletContextEvent sce) {
        RedisServerUtil.startRedis();
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        RedisServerUtil.stopRedis();
    }
}
