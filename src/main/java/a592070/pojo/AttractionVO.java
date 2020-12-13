package a592070.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import global.Constant;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.Immutable;
import org.hibernate.annotations.Type;
import utils.StringUtil;

import javax.persistence.*;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

//@JsonDeserialize(using = AttractionVOJsonDeserializer.class)
//@JsonSerialize(using = AttractionVOJsonSerializer.class)
@Entity
@Table(name = "AttractionView")
@Immutable
public class AttractionVO {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer sn;
    private String name;
    private String address;
    private String ticketInfo;
    private String description;
    private double rating;

    @Type(type = "org.hibernate.type.NumericBooleanType")
    @Column(name = "status", nullable = false)
    private boolean status;

    @JsonProperty
    @OneToMany(fetch = FetchType.EAGER)
    @Fetch(FetchMode.SUBSELECT)
    @JoinColumn(name = "ATTRACTION_ID")
    private List<AttractionPictureDO> attractionPic = new ArrayList<>();

    @Transient
    private List<String> images = new ArrayList<>();

    public AttractionVO() {
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
//        if(StringUtil.isEmpty(address)) return "暫時不提供資訊";
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getTicketInfo() {
//        if(StringUtil.isEmpty(ticketInfo)) return "暫時不提供資訊";
        return ticketInfo;
    }

    public void setTicketInfo(String ticketInfo) {
        this.ticketInfo = ticketInfo;
    }

    public String getDescription() {
//        if(StringUtil.isEmpty(description)) description="暫時不提供資訊";
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public List<AttractionPictureDO> getAttractionPic() {
        return attractionPic;
    }

    public void setAttractionPic(List<AttractionPictureDO> attractionPic) {
        this.attractionPic = attractionPic;
    }

    public List<String> getImages() {
        String destPrefix = Constant.ATTRACTION_PIC_URL + File.separator +sn + File.separator;
        images = attractionPic.stream().map(ele -> destPrefix + ele.getPicFileName()).collect(Collectors.toList());
        return images;
    }

    public void setImages(List<String> images) {
        this.images = images;
    }

    @Override
    public String toString() {
        return "AttractionVO{" +
                "sn=" + sn +
                ", name='" + name + '\'' +
                ", address='" + address + '\'' +
                ", ticketInfo='" + ticketInfo + '\'' +
                ", description='" + description + '\'' +
                ", status=" + status +
                '}';
    }
}
