package a592070.pojo;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

@JsonDeserialize(using = AttractionPictureJsonDeserializer.class)
@JsonSerialize(using = AttractionPictureJsonSerializer.class)
@JsonIgnoreProperties(ignoreUnknown = true)
@Entity
@Table(name = "ATTRACTION_PIC")
@DynamicInsert
@DynamicUpdate
public class AttractionPictureDO {
    @Id@GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "pic_url")
    private String picUrl;
    private byte[] picture;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ATTRACTION_ID", referencedColumnName = "A_SN")
    private AttractionDO attraction;

    public AttractionPictureDO() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPicUrl() {
        return picUrl;
    }

    public void setPicUrl(String picUrl) {
        this.picUrl = picUrl;
    }

    public byte[] getPicture() {
        return picture;
    }

    public void setPicture(byte[] picture) {
        this.picture = picture;
    }

    public AttractionDO getAttraction() {
        return attraction;
    }

    public void setAttraction(AttractionDO attraction) {
        this.attraction = attraction;
    }
}
