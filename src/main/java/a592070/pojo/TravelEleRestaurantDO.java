package a592070.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.junit.Ignore;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Date;

import static global.Constant.TRAVEL_SET_TYPE_ATTRACTION;
import static global.Constant.TRAVEL_SET_TYPE_RESTAURANT;

@JsonIgnoreProperties(ignoreUnknown = true)
@Entity
@Table(name = "TRAVEL_ELE_R")
public class TravelEleRestaurantDO {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer sn;

//    private Timestamp time;
    @Column(name = "time")@Temporal(TemporalType.TIMESTAMP)
    private Date time;

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "R_ID", referencedColumnName = "SN")
    private RestaurantVO restaurant;

    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.MERGE)
    @JoinColumn(name = "TRAVEL_ID", referencedColumnName = "SN")
    private TravelSetDO travelSetDO;

    @Transient
    private Integer type = TRAVEL_SET_TYPE_RESTAURANT;

    public TravelEleRestaurantDO() {
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

    public RestaurantVO getRestaurant() {
        return restaurant;
    }

    public void setRestaurant(RestaurantVO restaurant) {
        this.restaurant = restaurant;
    }

    public TravelSetDO getTravelSetDO() {
        return travelSetDO;
    }

    public void setTravelSetDO(TravelSetDO travelSetDO) {
        this.travelSetDO = travelSetDO;
    }

    @Override
    public String toString() {
        return "TravelEleRestaurantDO{" +
                "sn=" + sn +
                ", time=" + time +
                ", restaurant=" + restaurant +
                '}';
    }
}
