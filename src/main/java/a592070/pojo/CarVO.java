package a592070.pojo;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import org.hibernate.annotations.Immutable;

import javax.persistence.*;

//@JsonSerialize(using = CarVOJsonSerializer.class)
//@JsonDeserialize(using = CarVOJsonDeserializer.class)
@Entity
@Table(name = "TRAVEL_SET_CARVIEW")
@Immutable
public class CarVO {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer sn;
    private String carType;
    private int price;
    private String company;

    public CarVO() {
    }

    public Integer getSn() {
        return sn;
    }

    public void setSn(Integer sn) {
        this.sn = sn;
    }

    public String getCarType() {
        return carType;
    }

    public void setCarType(String carType) {
        this.carType = carType;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    @Override
    public String toString() {
        return "CarVO{" +
                "sn=" + sn +
                ", carType='" + carType + '\'' +
                ", price=" + price +
                ", company='" + company + '\'' +
                '}';
    }
}
