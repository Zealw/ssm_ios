package service;

import domain.Commodity;
import domain.Page;
import domain.QueryVO;
import dao.CommodityDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CommodityService {
    @Autowired
    private CommodityDao commodityDao;
    public  List<Commodity> showAllCommodities(){
        List<Commodity> commodities = commodityDao.showAllCommodities();
        return commodities;
    }
    public  Page<Commodity> pageAllCommodities(int pageNum, int pageSize, Commodity commodity){

        if(pageNum == 0){
            pageNum = 1;
        }
        if(pageSize == 0){
            pageSize = 4;
        }

        QueryVO queryVO = new QueryVO();
        queryVO.setStartIndex((pageNum - 1) * pageSize);
        queryVO.setSize(pageSize);
        queryVO.setCommodity(commodity);
        List<Commodity> list = commodityDao.pageAllCommodities(queryVO);
        int dataCount = commodityDao.findNum(commodity);
        Page<Commodity> page = new Page<Commodity>();
        page.setList(list);
        page.setDataCount(dataCount);
        page.setPageNum(pageNum);
        page.setPageSize(pageSize);
            page.setPageCount(dataCount % pageSize == 0 ? dataCount / pageSize : dataCount / pageSize + 1);
        return page;

    }
    public  Commodity findCommodityById(String id){
        Commodity commodity = commodityDao.findCommodityById(id);
        return commodity;
    }

}
