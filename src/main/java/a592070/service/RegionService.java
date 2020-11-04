package a592070.service;

import a592070.dao.RegionDAO;
import a592070.pojo.RegionDO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import java.util.List;

public class RegionService {
    @Autowired@Qualifier("regionDao")
    private RegionDAO regionDAO;

    public List<RegionDO> list(){
        return regionDAO.listRegion();
    }
}
