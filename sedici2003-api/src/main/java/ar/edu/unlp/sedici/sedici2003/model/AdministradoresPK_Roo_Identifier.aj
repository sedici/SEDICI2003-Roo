// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.unlp.sedici.sedici2003.model;

import java.lang.Integer;
import java.lang.Object;
import java.lang.Short;
import java.lang.String;
import javax.persistence.Column;
import javax.persistence.Embeddable;

privileged aspect AdministradoresPK_Roo_Identifier {
    
    declare @type: AdministradoresPK: @Embeddable;
    
    @Column(name = "id", nullable = false)
    private Integer AdministradoresPK.id;
    
    @Column(name = "nombre", nullable = false, length = 200)
    private String AdministradoresPK.nombre;
    
    @Column(name = "mail", nullable = false, length = 200)
    private String AdministradoresPK.mail;
    
    @Column(name = "derechos", nullable = false)
    private Short AdministradoresPK.derechos;
    
    @Column(name = "idioma", nullable = false)
    private Short AdministradoresPK.idioma;
    
    @Column(name = "login", nullable = false, length = 10)
    private String AdministradoresPK.login;
    
    @Column(name = "password", nullable = false, length = 12)
    private String AdministradoresPK.password;
    
    public AdministradoresPK.new(Integer id, String nombre, String mail, Short derechos, Short idioma, String login, String password) {
        super();
        this.id = id;
        this.nombre = nombre;
        this.mail = mail;
        this.derechos = derechos;
        this.idioma = idioma;
        this.login = login;
        this.password = password;
    }

    private AdministradoresPK.new() {
        super();
    }

    public Integer AdministradoresPK.getId() {
        return this.id;
    }
    
    public String AdministradoresPK.getNombre() {
        return this.nombre;
    }
    
    public String AdministradoresPK.getMail() {
        return this.mail;
    }
    
    public Short AdministradoresPK.getDerechos() {
        return this.derechos;
    }
    
    public Short AdministradoresPK.getIdioma() {
        return this.idioma;
    }
    
    public String AdministradoresPK.getLogin() {
        return this.login;
    }
    
    public String AdministradoresPK.getPassword() {
        return this.password;
    }
    
    public boolean AdministradoresPK.equals(Object obj) {
        if (this == obj) return true;
        if (obj == null) return false;
        if (!(obj instanceof AdministradoresPK)) return false;
        AdministradoresPK other = (AdministradoresPK) obj;
        if (id == null) {
            if (other.id != null) return false;
        } else if (!id.equals(other.id)) return false;
        if (nombre == null) {
            if (other.nombre != null) return false;
        } else if (!nombre.equals(other.nombre)) return false;
        if (mail == null) {
            if (other.mail != null) return false;
        } else if (!mail.equals(other.mail)) return false;
        if (derechos == null) {
            if (other.derechos != null) return false;
        } else if (!derechos.equals(other.derechos)) return false;
        if (idioma == null) {
            if (other.idioma != null) return false;
        } else if (!idioma.equals(other.idioma)) return false;
        if (login == null) {
            if (other.login != null) return false;
        } else if (!login.equals(other.login)) return false;
        if (password == null) {
            if (other.password != null) return false;
        } else if (!password.equals(other.password)) return false;
        return true;
    }
    
    public int AdministradoresPK.hashCode() {
        final int prime = 31;
        int result = 17;
        result = prime * result + (id == null ? 0 : id.hashCode());
        result = prime * result + (nombre == null ? 0 : nombre.hashCode());
        result = prime * result + (mail == null ? 0 : mail.hashCode());
        result = prime * result + (derechos == null ? 0 : derechos.hashCode());
        result = prime * result + (idioma == null ? 0 : idioma.hashCode());
        result = prime * result + (login == null ? 0 : login.hashCode());
        result = prime * result + (password == null ? 0 : password.hashCode());
        return result;
    }
    
}
