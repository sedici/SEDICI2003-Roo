// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.unlp.sedici.sedici2003.model;

import java.lang.String;

privileged aspect Ip_Roo_ToString {
    
    public String Ip.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Id: ").append(getId());
        return sb.toString();
    }
    
}
