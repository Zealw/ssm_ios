package dao;

import domain.ErrorLog;
import domain.Log;
import org.apache.ibatis.annotations.Insert;
import org.springframework.stereotype.Repository;

@Repository
public interface ErrorLogDao {
    @Insert("insert into front_errorlog values(#{id},#{visitTime},#{username},#{ip},#{url},#{code},#{method},#{message})")
    void addLog(ErrorLog errorLog);

}
