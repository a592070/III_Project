package a592070.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Date;

import static global.Constant.TRAVEL_SET_TYPE_ATTRACTION;
import static global.Constant.TRAVEL_SET_TYPE_HOTEL;

@JsonIgnoreProperties(ignoreUnknown = true)
@Entity
@Table(name = "TRAVEL_ELE_H")
public class TravelEleHotelDO {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer sn;

//    private Timestamp time;
    @Column(name = "time")@Temporal(TemporalType.TIMESTAMP)
    private Date time;

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "H_ID", referencedColumnName = "SN")
    private HotelVO hotel;

    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
    @JoinColumn(name = "TRAVEL_ID", referencedColumnName = "SN")
    private TravelSetDO travelSetDO;

    @Transient
    private Integer type = TRAVEL_SET_TYPE_HOTEL;

    public TravelEleHotelDO() {
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

    public HotelVO getHotel() {
        return hotel;
    }

    public void setHotel(HotelVO hotel) {
        this.hotel = hotel;
    }

    public TravelSetDO getTravelSetDO() {
        return travelSetDO;
    }

    public void setTravelSetDO(TravelSetDO travelSetDO) {
        this.travelSetDO = travelSetDO;
    }

    @Override
    public String toString() {
        return "TravelEleHotelDO{" +
                "sn=" + sn +
                ", time=" + time +
                ", hotel=" + hotel +
                '}';
    }
}
