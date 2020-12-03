package a592070.pojo;

import org.hibernate.annotations.Immutable;
import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Date;

@Entity
@Table(name = "TRAVEL_SET_VIEW")
@Immutable
public class TravelSetVO {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer sn;
    @Column(name = "CREATED_USER")
    private String createdUser;
    private String name;
    private String description;
    @Column(name = "CREATED_TIME")
    private Date createdTime;
    @Column(name = "UPDATE_TIME")
    private Date updateTime;
    private Integer priority;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    @Column(name = "STATUS", nullable = false)
    private boolean status;

    public TravelSetVO() {
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

    public Integer getPriority() {
        return priority;
    }

    public void setPriority(Integer priority) {
        this.priority = priority;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}
