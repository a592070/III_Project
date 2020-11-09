package a592070.pojo;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import utils.StringUtil;

import javax.persistence.*;
import java.math.BigDecimal;

@JsonDeserialize(using = AttractionJsonDeserializer.class)
@JsonSerialize(using = AttractionJsonSerializer.class)
@JsonIgnoreProperties(ignoreUnknown = true)
@Entity
@Table(name = "ATTRACTION")
@DynamicInsert
@DynamicUpdate
public class AttractionDO {
    @Id
    @Column(name = "A_SN")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer sn;
    private String name;
    private String toldescribe;
    private String description;
    private String tel;
    private String address;
    private BigDecimal px;
    private BigDecimal py;
    @Column(name = "OPENTIME")
    private String openTime;
    @Column(name = "PICTURE_URL")
    private String pictureUrl;
    private byte[] picture;
    @Column(name = "TICKETINFO")
    private String ticketInfo;
    @Column(name = "TRAVELLINGINFO")
    private String travellingInfo;
    private String keywords;
    private String remarks;
    private BigDecimal rating;
    private String region;


    public AttractionDO() {
    }

    @Override
    public String toString() {
        return "AttractionDO{" +
                "sn='" + sn + '\'' +
                ", name='" + name + '\'' +
                ", toldescribe='" + toldescribe + '\'' +
                ", description='" + description + '\'' +
                ", tel='" + tel + '\'' +
                ", address='" + address + '\'' +
                ", px=" + px +
                ", py=" + py +
                ", openTime='" + openTime + '\'' +
                ", ticketInfo='" + ticketInfo + '\'' +
                ", travelingInfo='" + travellingInfo + '\'' +
                ", keywords='" + keywords + '\'' +
                ", remarks='" + remarks + '\'' +
                ", rating=" + rating +
                ", region='" + region + '\'' +
                '}';
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

    public String getToldescribe() {
        return toldescribe;
    }

    public void setToldescribe(String toldescribe) {
//        if(StringUtil.isEmpty(toldescribe)) toldescribe="暫時不提供資訊";
        this.toldescribe = toldescribe;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
//        if(StringUtil.isEmpty(description)) description="暫時不提供資訊";
        this.description = description;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
//        if(StringUtil.isEmpty(tel)) tel="暫時不提供資訊";
        this.tel = tel;
    }

    public String getAddress() {
//        if(StringUtil.isEmpty(address)) return "暫時不提供資訊";
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public BigDecimal getPx() {
        return px;
    }

    public void setPx(BigDecimal px) {
        this.px = px;
    }

    public BigDecimal getPy() {
        return py;
    }

    public void setPy(BigDecimal py) {
        this.py = py;
    }

    public String getOpenTime() {
//        if(StringUtil.isEmpty(openTime)) return "暫時不提供資訊";
        return openTime;
    }

    public void setOpenTime(String openTime) {
        this.openTime = openTime;
    }

    public String getTicketInfo() {
//        if(StringUtil.isEmpty(ticketInfo)) return "暫時不提供資訊";
        return ticketInfo;
    }

    public void setTicketInfo(String ticketInfo) {
        this.ticketInfo = ticketInfo;
    }

    public String getTravellingInfo() {
//        if(StringUtil.isEmpty(travellingInfo)) return "暫時不提供資訊";
        return travellingInfo;
    }

    public void setTravellingInfo(String travellingInfo) {
        this.travellingInfo = travellingInfo;
    }

    public String getKeywords() {
//        if(StringUtil.isEmpty(keywords)) return "暫時不提供資訊";
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public String getRemarks() {
//        if(StringUtil.isEmpty(remarks)) return "暫時不提供資訊";
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public BigDecimal getRating() {
        return rating;
    }

    public void setRating(BigDecimal rating) {
        this.rating = rating;
    }

    public String getRegion() {
//        if(StringUtil.isEmpty(region)) return "暫時不提供資訊";
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public String getPictureUrl() {
        return pictureUrl;
    }

    public void setPictureUrl(String picture_url) {
        this.pictureUrl = picture_url;
    }

    public byte[] getPicture() {
        return picture;
    }

    public void setPicture(byte[] picture) {
        this.picture = picture;
    }
}
