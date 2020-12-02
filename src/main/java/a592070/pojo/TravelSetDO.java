package a592070.pojo;

import org.hibernate.annotations.*;
import utils.StringUtil;

import javax.persistence.*;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "TRAVEL_SET")
@DynamicInsert@DynamicUpdate
public class TravelSetDO {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer sn;
    @Column(name = "CREATED")
    private String createdUser;
    private String description;
    private Integer priority;
    @Column(name = "CREATED_TIME")
    private Timestamp createdTime;
    @Column(name = "UPDATE_TIME")
    private Timestamp updateTime;
    private String name;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    @Column(name = "available", nullable = false)
    private boolean available;

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

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "travelSetDO", cascade = CascadeType.ALL, orphanRemoval = true)
    @Fetch(FetchMode.SUBSELECT)
    private List<TravelEleCarDO> travelCars = new ArrayList<>();
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "travelSetDO", cascade = CascadeType.ALL, orphanRemoval = true)
    @Fetch(FetchMode.SUBSELECT)
    private List<TravelEleHotelDO> travelHotels = new ArrayList<>();
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "travelSetDO", cascade = CascadeType.ALL, orphanRemoval = true)
    @Fetch(FetchMode.SUBSELECT)
    private List<TravelEleRestaurantDO> travelRestaurants = new ArrayList<>();
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

    public Timestamp getCreatedTime() {
        if(createdTime == null) return new Timestamp(System.currentTimeMillis());
        return createdTime;
    }

    public void setCreatedTime(Timestamp createdTime) {
//        if(createdTime == null) this.createdTime = new Timestamp(System.currentTimeMillis());
        this.createdTime = createdTime;
    }

    public Timestamp getUpdateTime() {
        if(updateTime == null) return new Timestamp(System.currentTimeMillis());
        return updateTime;
    }

    public void setUpdateTime(Timestamp updateTime) {
        this.updateTime = updateTime;
    }

    public boolean getAvailable() {
        return available;
    }

    public void setAvailable(boolean available) {
        this.available = available;
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


    public void addTravelCars(TravelEleCarDO travelEleCarDO){
        this.travelCars.add(travelEleCarDO);
    }
    public List<TravelEleCarDO> getTravelCars() {
        return travelCars;
    }
    public void setTravelCars(List<TravelEleCarDO> travelCars) {
        this.travelCars = travelCars;
    }


    public void addTravelHotels(TravelEleHotelDO travelEleHotelDO){
        this.travelHotels.add(travelEleHotelDO);
    }
    public List<TravelEleHotelDO> getTravelHotels() {
        return travelHotels;
    }
    public void setTravelHotels(List<TravelEleHotelDO> travelHotels) {
        this.travelHotels = travelHotels;
    }


    public void addTravelRestaurants(TravelEleRestaurantDO travelEleRestaurantDO){
        this.travelRestaurants.add(travelEleRestaurantDO);
    }
    public List<TravelEleRestaurantDO> getTravelRestaurants() {
        return travelRestaurants;
    }
    public void setTravelRestaurants(List<TravelEleRestaurantDO> travelRestaurants) {
        this.travelRestaurants = travelRestaurants;
    }


    public void addTravelAttractions(TravelEleAttractionDO travelEleAttractionDO){
        this.travelAttractions.add(travelEleAttractionDO);
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
                ", description='" + description + '\'' +
                ", priority=" + priority +
                ", createdTime=" + createdTime +
                ", updateTime=" + updateTime +
                ", name='" + name + '\'' +
                ", available=" + available +
                '}';
    }
}
