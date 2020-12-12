package global.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class NotifyVO implements Serializable {
    @JsonIgnore
    private static final long serialVersionUID = 1L;
    @JsonIgnore
    private static final String DATA_FORMAT = "yyyy MMM dd  HH:mm:ss";

    @JsonIgnore
    public static final String STATUS_SUCCESS = "success";
    @JsonIgnore
    public static final String STATUS_WARNING = "warning";
    @JsonIgnore
    public static final String STATUS_ERROR = "error";
    @JsonIgnore
    public static final String STATUS_OTHER = "other";

    @JsonIgnore
    private DateFormat dateFormat = new SimpleDateFormat(DATA_FORMAT);

    private String dateFormatted = this.dateFormat.format(this.date);

    private String status;
    private String title;
    private String content;
    @JsonIgnore
    private Date date = new Date();

    public NotifyVO() {
    }

    public NotifyVO(String status, String title, String content) {
        this.status = status;
        this.title = title;
        this.content = content;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "NotifyVO{" +
                "status='" + status + '\'' +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", date=" + date +
                '}';
    }
}
