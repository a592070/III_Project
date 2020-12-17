package a592070.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import global.Constant;
import org.hibernate.annotations.Immutable;
import org.hibernate.annotations.Type;
import utils.StringUtil;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Arrays;
import java.util.List;

//@JsonDeserialize(using = RestaurantVOJsonDeserializer.class)
@Entity
@Table(name = "TRAVEL_SET_RESTAURANTVIEW")
@Immutable
public class RestaurantVO {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer sn;
    private String name;
    private String type;
    private String address;
    private String description;
    private BigDecimal rating;
    private String region;

    @JsonIgnore
    @Column(name = "pic")
    private byte[] image;

    @Transient
    private List<String> images;

    @Type(type = "org.hibernate.type.NumericBooleanType")
    @Column(name = "status", nullable = false)
    private boolean status;

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

    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }

    public List<String> getImages() {
        return Arrays.asList(Constant.TRAVEL_SET_RESTAURANT_PIC +this.sn);
    }

    public void setImages(List<String> images) {
        this.images = images;
    }

    @Override
    public String toString() {
        return "RestaurantVO{" +
                "sn=" + sn +
                ", name='" + name + '\'' +
                ", type='" + type + '\'' +
                ", address='" + address + '\'' +
                ", description='" + description + '\'' +
                ", rating=" + rating +
                ", region='" + region + '\'' +
                ", status=" + status +
                '}';
    }
}
