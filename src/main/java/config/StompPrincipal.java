package config;

import java.security.Principal;

public class StompPrincipal implements Principal {
    private String name;

    public StompPrincipal() {
    }

    public StompPrincipal(String name) {
        this.name = name;
    }

    @Override
    public String getName() {
        return this.name;
    }
}
