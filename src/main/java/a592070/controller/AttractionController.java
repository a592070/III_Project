package a592070.controller;

import a592070.fieldenum.AttractionFiledName;
import a592070.pojo.AttractionDO;
import a592070.service.AttractionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import utils.PageSupport;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@RestController
public class AttractionController {
    private static final int PAGE_SIZE = 10;

    @Autowired@Qualifier("attractionService")
    private AttractionService service;
    @RequestMapping("/admin/attraction")
    public void attractionMain(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/a592070/admin.jsp").forward(request, response);
    }

    @PostMapping("/admin/attraction/${page}")
    public void attractionList(@PathVariable int page){
        PageSupport pageSupport = new PageSupport();
        pageSupport.setPageSize(PAGE_SIZE);
        pageSupport.setTotalCount(service.getSize());
        pageSupport.setCurrentPage(page);

        List<AttractionDO> list = service.list(pageSupport.getCurrentPage(), pageSupport.getPageSize(), AttractionFiledName.ATTRACTION_ID);

    }
}
