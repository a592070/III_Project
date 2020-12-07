package a592070.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.junit.Ignore;

import javax.persistence.*;
import java.sql.Timestamp;
@JsonIgnoreProperties(ignoreUnknown = true)
@Entity
@Table(name = "TRAVEL_ELE_R")
public class TravelEleRestaurantDO {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer sn;

    private Timestamp time;

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "R_ID", referencedColumnName = "SN")
    private RestaurantVO restaurant;

    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "TRAVEL_ID", referencedColumnName = "SN")
    private TravelSetDO travelSetDO;

    public TravelEleRestaurantDO() {
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
