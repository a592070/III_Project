package a592070.pojo;

import utils.StringUtil;

import javax.persistence.*;

@Entity
@Table(name = "REGION")
public class RegionDO {
    @Id@Column(name = "REGION_ID")@GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "REGION_NAME", nullable = false)
    private String region;
    private String area;

    public RegionDO() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        if(!StringUtil.isEmpty(region)) this.region = region;
    }
}
