// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.unlp.sedici.sedici2003.model;

import java.lang.Integer;
import java.lang.Short;
import java.lang.String;
import javax.persistence.Column;

privileged aspect Metadatos_Roo_DbManaged {
    
    @Column(name = "es_heredado")
    private Short Metadatos.esHeredado;
    
    @Column(name = "id_documento", length = 100)
    private String Metadatos.idDocumento;
    
    @Column(name = "id_en_tabla")
    private Integer Metadatos.idEnTabla;
    
    @Column(name = "id_jerarquias", length = 100)
    private String Metadatos.idJerarquias;
    
    @Column(name = "id_tesauro", length = 100)
    private String Metadatos.idTesauro;
    
    @Column(name = "id_tipo_metadatos")
    private Integer Metadatos.idTipoMetadatos;
    
    @Column(name = "nombre_tabla", length = 40)
    private String Metadatos.nombreTabla;
    
    @Column(name = "texto_en", length = 255)
    private String Metadatos.textoEn;
    
    @Column(name = "texto_es", length = 255)
    private String Metadatos.textoEs;
    
    @Column(name = "texto_pt", length = 255)
    private String Metadatos.textoPt;
    
    public Short Metadatos.getEsHeredado() {
        return this.esHeredado;
    }
    
    public void Metadatos.setEsHeredado(Short esHeredado) {
        this.esHeredado = esHeredado;
    }
    
    public String Metadatos.getIdDocumento() {
        return this.idDocumento;
    }
    
    public void Metadatos.setIdDocumento(String idDocumento) {
        this.idDocumento = idDocumento;
    }
    
    public Integer Metadatos.getIdEnTabla() {
        return this.idEnTabla;
    }
    
    public void Metadatos.setIdEnTabla(Integer idEnTabla) {
        this.idEnTabla = idEnTabla;
    }
    
    public String Metadatos.getIdJerarquias() {
        return this.idJerarquias;
    }
    
    public void Metadatos.setIdJerarquias(String idJerarquias) {
        this.idJerarquias = idJerarquias;
    }
    
    public String Metadatos.getIdTesauro() {
        return this.idTesauro;
    }
    
    public void Metadatos.setIdTesauro(String idTesauro) {
        this.idTesauro = idTesauro;
    }
    
    public Integer Metadatos.getIdTipoMetadatos() {
        return this.idTipoMetadatos;
    }
    
    public void Metadatos.setIdTipoMetadatos(Integer idTipoMetadatos) {
        this.idTipoMetadatos = idTipoMetadatos;
    }
    
    public String Metadatos.getNombreTabla() {
        return this.nombreTabla;
    }
    
    public void Metadatos.setNombreTabla(String nombreTabla) {
        this.nombreTabla = nombreTabla;
    }
    
    public String Metadatos.getTextoEn() {
        return this.textoEn;
    }
    
    public void Metadatos.setTextoEn(String textoEn) {
        this.textoEn = textoEn;
    }
    
    public String Metadatos.getTextoEs() {
        return this.textoEs;
    }
    
    public void Metadatos.setTextoEs(String textoEs) {
        this.textoEs = textoEs;
    }
    
    public String Metadatos.getTextoPt() {
        return this.textoPt;
    }
    
    public void Metadatos.setTextoPt(String textoPt) {
        this.textoPt = textoPt;
    }
    
}
