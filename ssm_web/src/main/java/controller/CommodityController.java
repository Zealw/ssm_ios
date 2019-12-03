package controller;

import domain.Commodity;
import domain.Page;
import domain.QueryVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import service.CommodityService;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/commodity")
@SessionAttributes({"callback","pageCom"})
public class CommodityController {
    @Autowired
    private CommodityService commodityService;
    @RequestMapping("/showAllStoreCom")
    public ModelAndView showAllStoreCom(HttpServletRequest request, QueryVO queryVO){
        Page<Commodity> pageCom = commodityService.pageAllCommodities(queryVO.getStartIndex(),queryVO.getSize() ,queryVO.getCommodity());
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.getModelMap().addAttribute("pageCom",pageCom);
        modelAndView.getModelMap().addAttribute("callback",queryVO.getCommodity());
        modelAndView.setViewName("store");
        return modelAndView;
    }
}
