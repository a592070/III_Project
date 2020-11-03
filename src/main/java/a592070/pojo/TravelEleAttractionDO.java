package a592070.pojo;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "TRAVEL_ELE_A")
public class TravelEleAttractionDO {
    @Id@GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer sn;

    private Timestamp time;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "A_ID", referencedColumnName = "SN")
    private AttractionVO attraction;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "TRAVEL_ID", referencedColumnName = "SN")
    private TravelSetDO travelSetDO;

    public TravelEleAttractionDO() {
    }

    public Integer getSn() {
        return sn;
    }

    public void setSn(Integer sn) {
        this.sn = sn;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public AttractionVO getAttraction() {
        return attraction;
    }

    public void setAttraction(AttractionVO attraction) {
        this.attraction = attraction;
    }

    public TravelSetDO getTravelSetDO() {
        return travelSetDO;
    }


    public void setTravelSetDO(TravelSetDO travelSetDO) {
        this.travelSetDO = travelSetDO;
    }

    @Override
    public String toString() {
        return "TravelEleAttractionDO{" +
                "sn=" + sn +
                ", time=" + time +
                ", attraction=" + attraction +
                '}';
    }
}
