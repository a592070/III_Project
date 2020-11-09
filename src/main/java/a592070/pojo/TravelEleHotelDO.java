package a592070.pojo;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "TRAVEL_ELE_H")
public class TravelEleHotelDO {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer sn;

    private Timestamp time;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "H_ID", referencedColumnName = "SN")
    private HotelVO hotel;

    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
    @JoinColumn(name = "TRAVEL_ID", referencedColumnName = "SN")
    private TravelSetDO travelSetDO;

    public TravelEleHotelDO() {
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
