package a592070.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Date;

import static global.Constant.TRAVEL_SET_TYPE_ATTRACTION;

@JsonIgnoreProperties(ignoreUnknown = true)
@Entity
@Table(name = "TRAVEL_ELE_A")
public class TravelEleAttractionDO {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer sn;

//    private Timestamp time;
    @Column(name = "time")@Temporal(TemporalType.TIMESTAMP)
    private Date time;


    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "A_ID", referencedColumnName = "SN")
    private AttractionVO attraction;

    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "TRAVEL_ID", referencedColumnName = "SN")
    private TravelSetDO travelSetDO;

    @Transient
    private Integer type = TRAVEL_SET_TYPE_ATTRACTION;

    public TravelEleAttractionDO() {
    }

    public Integer getSn() {
        return sn;
    }

    public void setSn(Integer sn) {
        this.sn = sn;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
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
