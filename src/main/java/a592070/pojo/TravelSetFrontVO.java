package a592070.pojo;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.databind.node.ObjectNode;
import utils.CollectionUtils;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.*;

@JsonIgnoreProperties(ignoreUnknown = true)
public class TravelSetFrontVO {
    private Integer sn;
    private String name;
    private String description;
    private String createdUser;

    private Date createdTime;
    private Date updateTime;

    private Map<String, List<TravelSetEleVO>> events;

    public TravelSetFrontVO() {
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCreatedUser() {
        return createdUser;
    }

    public void setCreatedUser(String createdUser) {
        this.createdUser = createdUser;
    }

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }


    public void putEvents(Date date, List<TravelSetEleVO> event){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String format = simpleDateFormat.format(date);
        this.events.put(format, event);
    }
    public void addEvent(Date date, TravelSetEleVO event){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String format = simpleDateFormat.format(date);
        List<TravelSetEleVO> objects = this.events.get(format);
        if(objects == null) objects = new ArrayList<>();
        objects.add(event);

        this.events.put(format, objects);
    }

    public Map<String, List<TravelSetEleVO>> getEvents() {
        return events;
    }

    public void setEvents(Map<String, List<TravelSetEleVO>> events) {
        this.events = events;
    }

    @Override
    public String toString() {
        return "TravelSetFrontVO{" +
                "sn=" + sn +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", createdUser='" + createdUser + '\'' +
                ", createdTime=" + createdTime +
                ", updateTime=" + updateTime +
                '}';
    }
}
