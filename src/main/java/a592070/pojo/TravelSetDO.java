package a592070.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.hibernate.annotations.*;
import rambo0021.pojo.AccountBean;
import utils.StringUtil;

import javax.persistence.*;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.sql.Timestamp;
import java.util.*;

@JsonIgnoreProperties(ignoreUnknown = true)
@Entity
@Table(name = "TRAVEL_SET")
@DynamicInsert@DynamicUpdate
public class TravelSetDO {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer sn;

//    @OneToOne(fetch = FetchType.LAZY)
//    @JoinColumn(name = "CREATED", referencedColumnName = "USERNAME")
//    private AccountBean createdUser;
    @Column(name="CREATED")
    private String createdUser;

    private String name;
    private String description;

    @Column(columnDefinition = "int default 0")
    private Integer priority;
    @Column(name = "CREATED_TIME", insertable = false, updatable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdTime;

    @UpdateTimestamp
    @Column(name = "UPDATE_TIME")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updateTime;

    @Type(type = "org.hibernate.type.NumericBooleanType")
    @Column(name = "available", nullable = false)
    private boolean status;

//    @OneToMany(fetch = FetchType.LAZY, mappedBy = "travelSetDO", cascade = CascadeType.ALL, orphanRemoval = true)
//    @Fetch(FetchMode.SUBSELECT)
//    private Set<TravelEleCarDO> travelCars2 = new LinkedHashSet<>();
//    @OneToMany(fetch = FetchType.LAZY, mappedBy = "travelSetDO", cascade = CascadeType.ALL, orphanRemoval = true)
//    @Fetch(FetchMode.SUBSELECT)
//    private Set<TravelEleHotelDO> travelHotels2 = new LinkedHashSet<>();
//    @OneToMany(fetch = FetchType.LAZY, mappedBy = "travelSetDO", cascade = CascadeType.ALL, orphanRemoval = true)
//    @Fetch(FetchMode.SUBSELECT)
//    private Set<TravelEleRestaurantDO> travelRestaurants2 = new LinkedHashSet<>();
//    @OneToMany(fetch = FetchType.LAZY, mappedBy = "travelSetDO", cascade = CascadeType.ALL, orphanRemoval = true)
//    @Fetch(FetchMode.SUBSELECT)
//    private Set<TravelEleAttractionDO> travelAttractions2 = new LinkedHashSet<>();


//    @JsonIgnore
//    @OneToMany(fetch = FetchType.LAZY, mappedBy = "travelSetDO", cascade = CascadeType.ALL, orphanRemoval = true)
//    @Fetch(FetchMode.SUBSELECT)
//    private List<TravelEleCarDO> travelCars = new ArrayList<>();

    @JsonIgnore
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "travelSetDO", cascade = CascadeType.ALL, orphanRemoval = true)
    @Fetch(FetchMode.SUBSELECT)
    private List<TravelEleHotelDO> travelHotels = new ArrayList<>();

    @JsonIgnore
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "travelSetDO", cascade = CascadeType.ALL, orphanRemoval = true)
    @Fetch(FetchMode.SUBSELECT)
    private List<TravelEleRestaurantDO> travelRestaurants = new ArrayList<>();

    @JsonIgnore
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "travelSetDO", cascade = CascadeType.ALL, orphanRemoval = true)
    @Fetch(FetchMode.SUBSELECT)
    private List<TravelEleAttractionDO> travelAttractions = new ArrayList<>();


    public TravelSetDO() {
    }

    public Integer getSn() {
        return sn;
    }

    public void setSn(Integer sn) {
        this.sn = sn;
    }

    public String getName() {
//        if(StringUtil.isEmpty(name)) return "我的旅程";
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

//    public AccountBean getCreatedUser() {
//        return createdUser;
//    }
//    public void setCreatedUser(AccountBean createdUser) {
//        this.createdUser = createdUser;
//    }


    public String getCreatedUser() {
        return createdUser;
    }
    public void setCreatedUser(String createdUser) {
        this.createdUser = createdUser;
    }

    public String getDescription() {
//        if(StringUtil.isEmpty(description)) return "...";
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getPriority() {
        return priority;
    }

    public void setPriority(Integer priority) {
        this.priority = priority;
    }

    public Date getCreatedTime() {
//        if(createdTime == null) return new Timestamp(System.currentTimeMillis());
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
//        if(createdTime == null) this.createdTime = new Timestamp(System.currentTimeMillis());
        this.createdTime = createdTime;
    }

    public Date getUpdateTime() {
//        if(updateTime == null) return new Timestamp(System.currentTimeMillis());
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

//    public Set<TravelEleCarDO> getTravelCars2() {
//        return travelCars2;
//    }
//
//    public void setTravelCars2(Set<TravelEleCarDO> travelCars2) {
//        this.travelCars2 = travelCars2;
//    }
//
//    public Set<TravelEleHotelDO> getTravelHotels2() {
//        return travelHotels2;
//    }
//
//    public void setTravelHotels2(Set<TravelEleHotelDO> travelHotels2) {
//        this.travelHotels2 = travelHotels2;
//    }
//
//    public Set<TravelEleRestaurantDO> getTravelRestaurants2() {
//        return travelRestaurants2;
//    }
//
//    public void setTravelRestaurants2(Set<TravelEleRestaurantDO> travelRestaurants2) {
//        this.travelRestaurants2 = travelRestaurants2;
//    }
//
//    public Set<TravelEleAttractionDO> getTravelAttractions2() {
//        return travelAttractions2;
//    }
//
//    public void setTravelAttractions2(Set<TravelEleAttractionDO> travelAttractions2) {
//        this.travelAttractions2 = travelAttractions2;
//    }


//    public void addTravelCars(TravelEleCarDO travelEleCarDO){
//        travelEleCarDO.setTravelSetDO(this);
//        this.travelCars.add(travelEleCarDO);
//    }
//    public void addTravelCars(Integer carID){
//        CarVO carVO = new CarVO();
//        carVO.setSn(carID);
//        TravelEleCarDO travelEleDO = new TravelEleCarDO();
//        travelEleDO.setCar(carVO);
//        travelEleDO.setTravelSetDO(this);
//        this.travelCars.add(travelEleDO);
//    }
//    public List<TravelEleCarDO> getTravelCars() {
//        return travelCars;
//    }
//    public void setTravelCars(List<TravelEleCarDO> travelCars) {
//        this.travelCars = travelCars;
//    }


    public void addTravelHotels(TravelEleHotelDO travelEleHotelDO){
        travelEleHotelDO.setTravelSetDO(this);
        this.travelHotels.add(travelEleHotelDO);
    }
    public void addTravelHotels(Integer hotelID){
        HotelVO hotelVO = new HotelVO();
        hotelVO.setSn(hotelID);
        TravelEleHotelDO travelEleDO = new TravelEleHotelDO();
        travelEleDO.setHotel(hotelVO);
        travelEleDO.setTravelSetDO(this);
        this.travelHotels.add(travelEleDO);
    }
    public List<TravelEleHotelDO> getTravelHotels() {
        return travelHotels;
    }
    public void setTravelHotels(List<TravelEleHotelDO> travelHotels) {
        this.travelHotels = travelHotels;
    }


    public void addTravelRestaurants(TravelEleRestaurantDO travelEleRestaurantDO){
        travelEleRestaurantDO.setTravelSetDO(this);
        this.travelRestaurants.add(travelEleRestaurantDO);
    }
    public void addTravelRestaurants(Integer restaurantID){
        RestaurantVO restaurantVO = new RestaurantVO();
        restaurantVO.setSn(restaurantID);
        TravelEleRestaurantDO travelEleDO = new TravelEleRestaurantDO();
        travelEleDO.setRestaurant(restaurantVO);
        travelEleDO.setTravelSetDO(this);
        this.travelRestaurants.add(travelEleDO);
    }
    public List<TravelEleRestaurantDO> getTravelRestaurants() {
        return travelRestaurants;
    }
    public void setTravelRestaurants(List<TravelEleRestaurantDO> travelRestaurants) {
        this.travelRestaurants = travelRestaurants;
    }


    public void addTravelAttractions(TravelEleAttractionDO travelEleAttractionDO){
        travelEleAttractionDO.setTravelSetDO(this);
        this.travelAttractions.add(travelEleAttractionDO);
    }
    public void addTravelAttractions(Integer attractionID){
        AttractionVO attractionVO = new AttractionVO();
        attractionVO.setSn(attractionID);
        TravelEleAttractionDO travelEleDO = new TravelEleAttractionDO();
        travelEleDO.setAttraction(attractionVO);
        travelEleDO.setTravelSetDO(this);
        this.travelAttractions.add(travelEleDO);
    }
    public List<TravelEleAttractionDO> getTravelAttractions() {
        return travelAttractions;
    }
    public void setTravelAttractions(List<TravelEleAttractionDO> travelAttractions) {
        this.travelAttractions = travelAttractions;
    }

    @Override
    public String toString() {
        return "TravelSetDO{" +
                "sn=" + sn +
                ", createdUser='" + createdUser + '\'' +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", priority=" + priority +
                ", createdTime=" + createdTime +
                ", updateTime=" + updateTime +
                ", status=" + status +
                '}';
    }
}
