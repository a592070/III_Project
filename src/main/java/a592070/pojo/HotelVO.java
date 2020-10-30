package a592070.pojo;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import org.hibernate.annotations.Immutable;
import utils.StringUtil;

import javax.persistence.*;
import java.math.BigDecimal;

@JsonDeserialize(using = HotelVOJsonDeserializer.class)
@Entity
@Table(name = "HotelView")
@Immutable
public class HotelVO {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer sn;
    private String name;
    private String address;
    private int doubleRoomPrice;
    private int quadrupleRoomPrice;
    private BigDecimal rating;
    private String description;

    public HotelVO() {
    }

    public Integer getSn() {
        return sn;
    }

    public void setSn(Integer sn) {
        this.sn = sn;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getDoubleRoomPrice() {
        return doubleRoomPrice;
    }

    public void setDoubleRoomPrice(int doubleRoomPrice) {
        this.doubleRoomPrice = doubleRoomPrice;
    }

    public int getQuadrupleRoomPrice() {
        return quadrupleRoomPrice;
    }

    public void setQuadrupleRoomPrice(int quadrupleRoomPrice) {
        this.quadrupleRoomPrice = quadrupleRoomPrice;
    }

    public BigDecimal getRating() {
        return rating;
    }

    public void setRating(BigDecimal rating) {
        this.rating = rating;
    }

    public String getDescription() {
        if(StringUtil.isEmpty(description)) description="暫時不提供資訊";
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "HotelVO{" +
                "sn=" + sn +
                ", name='" + name + '\'' +
                ", address='" + address + '\'' +
                ", doubleRoomPrice=" + doubleRoomPrice +
                ", quadrupleRoomPrice=" + quadrupleRoomPrice +
                ", rating=" + rating +
                '}';
    }
}
