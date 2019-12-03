package aop;

import dao.ErrorLogDao;
import domain.ErrorLog;
import domain.Log;
import domain.MyException;
import domain.User;
import dao.LogDao;
import exceptionHandler.MyExceptionResolver;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.UUID;

@Component
@Aspect
public class LogAop {
    @Autowired
    private LogDao logDao;
    @Autowired
    private ErrorLogDao errorLogDao;
    @Autowired
    private HttpServletResponse response;
    @Autowired
    private HttpServletRequest request;
    private Log log = new Log();
    private ErrorLog errorLog = new ErrorLog();
    @Before("execution(* controller.*.*(..))")
    public void before(){
        log.setVisitTime(new Date());
        log.setId(UUID.randomUUID().toString());
        errorLog.setVisitTime(new Date());
        errorLog.setId(UUID.randomUUID().toString());
    }



    @AfterReturning("execution(* controller.*.*(..))")
    public void printLog(JoinPoint joinPoint){
        String uri = request.getRequestURI();
        String username = null;
        if(request.getSession().getAttribute("user") != null){
            username = ((User) (request.getSession().getAttribute("user"))).getUsername();
        }
        log.setUsername(username);
        log.setExecutionTime(new Date().getTime()  - log.getVisitTime().getTime());
        log.setIp(request.getRemoteAddr());
        log.setUrl(uri);
        log.setMethod(joinPoint.getSignature().getName());
        logDao.addLog(log);
    }
    @AfterThrowing("execution(* controller.*.*(..))")
    public void printErrorLog(JoinPoint joinPoint){
        String uri = request.getRequestURI();
        String username = null;
        if(username != null){
            username = ((User) (request.getSession().getAttribute("user"))).getUsername();
        }
        errorLog.setUsername(username);
        MyExceptionResolver resolver = new MyExceptionResolver();
        Exception e = new Exception();
        resolver.resolveException(request,response,new Object(),e);
        MyException exception = (MyException) request.getAttribute("exception");
        if(exception != null){
            errorLog.setCode(exception.getCode());
            errorLog.setMessage(exception.getMessage());
        }
        errorLog.setIp(request.getRemoteAddr());
        errorLog.setUrl(uri);
        errorLog.setMethod(joinPoint.getSignature().getName());
        errorLogDao.addLog(errorLog);
    }


}
