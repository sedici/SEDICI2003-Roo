// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.unlp.sedici.sedici2003.model;

import java.lang.Integer;
import java.lang.Short;
import java.lang.String;
import javax.persistence.Column;

privileged aspect TesaurosTermino_Roo_DbManaged {
    
    @Column(name = "is_node")
    private Short TesaurosTermino.isNode;
    
    @Column(name = "is_root")
    private Short TesaurosTermino.isRoot;
    
    @Column(name = "max_id_hijo")
    private Integer TesaurosTermino.maxIdHijo;
    
    @Column(name = "nombre_en", length = 80)
    private String TesaurosTermino.nombreEn;
    
    @Column(name = "nombre_es", length = 80)
    private String TesaurosTermino.nombreEs;
    
    @Column(name = "nombre_pt", length = 80)
    private String TesaurosTermino.nombrePt;
    
    @Column(name = "observaciones", length = 255)
    private String TesaurosTermino.observaciones;
    
    @Column(name = "path_root", length = 255)
    private String TesaurosTermino.pathRoot;
    
    @Column(name = "tiene_relaciones")
    private Short TesaurosTermino.tieneRelaciones;
    
    @Column(name = "tipo_termino")
    private Short TesaurosTermino.tipoTermino;
    
    public Short TesaurosTermino.getIsNode() {
        return this.isNode;
    }
    
    public void TesaurosTermino.setIsNode(Short isNode) {
        this.isNode = isNode;
    }
    
    public Short TesaurosTermino.getIsRoot() {
        return this.isRoot;
    }
    
    public void TesaurosTermino.setIsRoot(Short isRoot) {
        this.isRoot = isRoot;
    }
    
    public Integer TesaurosTermino.getMaxIdHijo() {
        return this.maxIdHijo;
    }
    
    public void TesaurosTermino.setMaxIdHijo(Integer maxIdHijo) {
        this.maxIdHijo = maxIdHijo;
    }
    
    public String TesaurosTermino.getNombreEn() {
        return this.nombreEn;
    }
    
    public void TesaurosTermino.setNombreEn(String nombreEn) {
        this.nombreEn = nombreEn;
    }
    
    public String TesaurosTermino.getNombreEs() {
        return this.nombreEs;
    }
    
    public void TesaurosTermino.setNombreEs(String nombreEs) {
        this.nombreEs = nombreEs;
    }
    
    public String TesaurosTermino.getNombrePt() {
        return this.nombrePt;
    }
    
    public void TesaurosTermino.setNombrePt(String nombrePt) {
        this.nombrePt = nombrePt;
    }
    
    public String TesaurosTermino.getObservaciones() {
        return this.observaciones;
    }
    
    public void TesaurosTermino.setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }
    
    public String TesaurosTermino.getPathRoot() {
        return this.pathRoot;
    }
    
    public void TesaurosTermino.setPathRoot(String pathRoot) {
        this.pathRoot = pathRoot;
    }
    
    public Short TesaurosTermino.getTieneRelaciones() {
        return this.tieneRelaciones;
    }
    
    public void TesaurosTermino.setTieneRelaciones(Short tieneRelaciones) {
        this.tieneRelaciones = tieneRelaciones;
    }
    
    public Short TesaurosTermino.getTipoTermino() {
        return this.tipoTermino;
    }
    
    public void TesaurosTermino.setTipoTermino(Short tipoTermino) {
        this.tipoTermino = tipoTermino;
    }
    
}
