package a592070.pojo;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import org.hibernate.annotations.Immutable;
import utils.StringUtil;

import javax.persistence.*;

@JsonDeserialize(using = AttractionVOJsonDeserializer.class)
@JsonSerialize(using = AttractionVOJsonSerializer.class)
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

    @Override
    public String toString() {
        return "AttractionVO{" +
                "sn=" + sn +
                ", name='" + name + '\'' +
                ", address='" + address + '\'' +
                ", ticketInfo='" + ticketInfo + '\'' +
                ", description='" + description + '\'' +
                '}';
    }
}
