package dao;

import domain.Log;
import org.apache.ibatis.annotations.Insert;
import org.springframework.stereotype.Repository;

@Repository
public interface LogDao {
    @Insert("insert into front_log values(#{id},#{url},#{username},#{ip},#{executionTime},#{method},#{visitTime})")
    void addLog(Log log);

}
