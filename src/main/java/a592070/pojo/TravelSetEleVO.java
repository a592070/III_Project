package a592070.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.Date;

import static global.Constant.TRAVEL_SET_TYPE_ATTRACTION;

public abstract class TravelSetEleVO {
    protected Integer sn;
    protected Date time;
    protected Integer type;

    public abstract Integer getSn();

    public abstract void setSn(Integer sn);

    public abstract Date getTime();

    public abstract void setTime(Date time);

    public abstract Integer getType();

    public abstract void setType(Integer type);
}
