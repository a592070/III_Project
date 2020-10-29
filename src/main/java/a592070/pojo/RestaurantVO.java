package a592070.pojo;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import org.hibernate.annotations.Immutable;
import utils.StringUtil;

import javax.persistence.*;
import java.math.BigDecimal;

@JsonDeserialize(using = RestaurantVOJsonDeserializer.class)
@Entity
@Table(name = "RestaurantView")
@Immutable
public class RestaurantVO {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer sn;
    private String name;
    private String type;
    private String picture;
    private String address;
    private String description;
    private BigDecimal rating;
    private String region;

    public RestaurantVO() {
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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDescription() {
        if(StringUtil.isEmpty(description)) description="暫時不提供資訊";
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public BigDecimal getRating() {
        return rating;
    }

    public void setRating(BigDecimal rating) {
        this.rating = rating;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    @Override
    public String toString() {
        return "RestaurantVO{" +
                "sn=" + sn +
                ", name='" + name + '\'' +
                ", type='" + type + '\'' +
                ", picture='" + picture + '\'' +
                ", address='" + address + '\'' +
                ", description='" + description + '\'' +
                ", rating=" + rating +
                '}';
    }
}
