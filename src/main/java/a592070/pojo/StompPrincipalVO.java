package a592070.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import config.StompPrincipal;

public class StompPrincipalVO {

    private String group;
    private String userName;
    @JsonIgnore
    private StompPrincipal principal;

    public StompPrincipalVO() {
    }

    public String getGroup() {
        return group;
    }

    public void setGroup(String group) {
        this.group = group;
    }

    public String getUserName() {
        return principal.getName();
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public StompPrincipal getPrincipal() {
        return principal;
    }

    public void setPrincipal(StompPrincipal principal) {
        this.principal = principal;
    }

    @Override
    public String toString() {
        return "StompPrincipalVO{" +
                "group='" + group + '\'' +
                ", userName='" + userName + '\'' +
                '}';
    }
}
