// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.unlp.sedici.sedici2003.model;

import java.lang.Integer;
import java.lang.String;
import javax.persistence.Column;

privileged aspect Instituciones_Roo_DbManaged {
    
    @Column(name = "Abreviatura", length = 5)
    private String Instituciones.abreviatura;
    
    @Column(name = "Comentarios", length = 255)
    private String Instituciones.comentarios;
    
    @Column(name = "Direccion", length = 100)
    private String Instituciones.direccion;
    
    @Column(name = "id_pais", unique = true)
    private Integer Instituciones.idPais;
    
    @Column(name = "Nombre", length = 100, unique = true)
    private String Instituciones.nombre;
    
    @Column(name = "Sitio_Web", length = 100)
    private String Instituciones.sitioWeb;
    
    @Column(name = "Telefono", length = 100)
    private String Instituciones.telefono;
    
    public String Instituciones.getAbreviatura() {
        return this.abreviatura;
    }
    
    public void Instituciones.setAbreviatura(String abreviatura) {
        this.abreviatura = abreviatura;
    }
    
    public String Instituciones.getComentarios() {
        return this.comentarios;
    }
    
    public void Instituciones.setComentarios(String comentarios) {
        this.comentarios = comentarios;
    }
    
    public String Instituciones.getDireccion() {
        return this.direccion;
    }
    
    public void Instituciones.setDireccion(String direccion) {
        this.direccion = direccion;
    }
    
    public Integer Instituciones.getIdPais() {
        return this.idPais;
    }
    
    public void Instituciones.setIdPais(Integer idPais) {
        this.idPais = idPais;
    }
    
    public String Instituciones.getNombre() {
        return this.nombre;
    }
    
    public void Instituciones.setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public String Instituciones.getSitioWeb() {
        return this.sitioWeb;
    }
    
    public void Instituciones.setSitioWeb(String sitioWeb) {
        this.sitioWeb = sitioWeb;
    }
    
    public String Instituciones.getTelefono() {
        return this.telefono;
    }
    
    public void Instituciones.setTelefono(String telefono) {
        this.telefono = telefono;
    }
    
}
