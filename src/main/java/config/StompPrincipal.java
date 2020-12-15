package config;

import com.fasterxml.jackson.annotation.JsonIgnore;

import java.security.Principal;

public class StompPrincipal implements Principal {
    @JsonIgnore
    public static final String GROUP_USER = "user";
    @JsonIgnore
    public static final String GROUP_GUEST = "guest";

    private String name;

    private String group;

    public StompPrincipal() {
    }

    public StompPrincipal(String name) {
        this.name = name;
    }

    public StompPrincipal(String name, String group) {
        this.name = name;
        this.group = group;
    }



    public String getGroup() {
        return group;
    }

    public void setGroup(String group) {
        this.group = group;
    }

    @Override
    public String getName() {
        return this.name;
    }
    public void setName(String name) {
        this.name = name;
    }
}
