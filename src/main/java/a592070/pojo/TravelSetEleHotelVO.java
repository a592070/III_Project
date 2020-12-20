package a592070.pojo;


import java.util.Date;

public class TravelSetEleHotelVO extends TravelSetEleVO{
    private HotelVO hotel;

    @Override
    public Integer getSn() {
        return this.sn;
    }

    @Override
    public void setSn(Integer sn) {
        this.sn = sn;
    }

    @Override
    public Date getTime() {
        return this.time;
    }

    @Override
    public void setTime(Date time) {
        this.time = time;
    }

    @Override
    public Integer getType() {
        return this.type;
    }

    @Override
    public void setType(Integer type) {
        this.type = type;
    }

    public HotelVO getHotel() {
        return hotel;
    }

    public void setHotel(HotelVO hotel) {
        this.hotel = hotel;
    }
}
