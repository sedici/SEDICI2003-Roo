// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.unlp.sedici.sedici2003.model;

import java.lang.Integer;
import java.lang.Long;
import java.lang.Short;
import java.lang.String;
import javax.persistence.Column;

privileged aspect MetadatosPartes_Roo_DbManaged {
    
    @Column(name = "es_heredado")
    private Short MetadatosPartes.esHeredado;
    
    @Column(name = "id_documento", length = 100)
    private String MetadatosPartes.idDocumento;
    
    @Column(name = "id_en_tabla")
    private Integer MetadatosPartes.idEnTabla;
    
    @Column(name = "id_jerarquias", length = 100)
    private String MetadatosPartes.idJerarquias;
    
    @Column(name = "id_metadato_documento")
    private Long MetadatosPartes.idMetadatoDocumento;
    
    @Column(name = "id_parte")
    private Long MetadatosPartes.idParte;
    
    @Column(name = "id_tesauro", length = 100)
    private String MetadatosPartes.idTesauro;
    
    @Column(name = "id_tipo_metadatos")
    private Integer MetadatosPartes.idTipoMetadatos;
    
    @Column(name = "nombre_tabla", length = 40)
    private String MetadatosPartes.nombreTabla;
    
    @Column(name = "texto_en", length = 255)
    private String MetadatosPartes.textoEn;
    
    @Column(name = "texto_es", length = 255)
    private String MetadatosPartes.textoEs;
    
    @Column(name = "texto_pt", length = 255)
    private String MetadatosPartes.textoPt;
    
    public Short MetadatosPartes.getEsHeredado() {
        return this.esHeredado;
    }
    
    public void MetadatosPartes.setEsHeredado(Short esHeredado) {
        this.esHeredado = esHeredado;
    }
    
    public String MetadatosPartes.getIdDocumento() {
        return this.idDocumento;
    }
    
    public void MetadatosPartes.setIdDocumento(String idDocumento) {
        this.idDocumento = idDocumento;
    }
    
    public Integer MetadatosPartes.getIdEnTabla() {
        return this.idEnTabla;
    }
    
    public void MetadatosPartes.setIdEnTabla(Integer idEnTabla) {
        this.idEnTabla = idEnTabla;
    }
    
    public String MetadatosPartes.getIdJerarquias() {
        return this.idJerarquias;
    }
    
    public void MetadatosPartes.setIdJerarquias(String idJerarquias) {
        this.idJerarquias = idJerarquias;
    }
    
    public Long MetadatosPartes.getIdMetadatoDocumento() {
        return this.idMetadatoDocumento;
    }
    
    public void MetadatosPartes.setIdMetadatoDocumento(Long idMetadatoDocumento) {
        this.idMetadatoDocumento = idMetadatoDocumento;
    }
    
    public Long MetadatosPartes.getIdParte() {
        return this.idParte;
    }
    
    public void MetadatosPartes.setIdParte(Long idParte) {
        this.idParte = idParte;
    }
    
    public String MetadatosPartes.getIdTesauro() {
        return this.idTesauro;
    }
    
    public void MetadatosPartes.setIdTesauro(String idTesauro) {
        this.idTesauro = idTesauro;
    }
    
    public Integer MetadatosPartes.getIdTipoMetadatos() {
        return this.idTipoMetadatos;
    }
    
    public void MetadatosPartes.setIdTipoMetadatos(Integer idTipoMetadatos) {
        this.idTipoMetadatos = idTipoMetadatos;
    }
    
    public String MetadatosPartes.getNombreTabla() {
        return this.nombreTabla;
    }
    
    public void MetadatosPartes.setNombreTabla(String nombreTabla) {
        this.nombreTabla = nombreTabla;
    }
    
    public String MetadatosPartes.getTextoEn() {
        return this.textoEn;
    }
    
    public void MetadatosPartes.setTextoEn(String textoEn) {
        this.textoEn = textoEn;
    }
    
    public String MetadatosPartes.getTextoEs() {
        return this.textoEs;
    }
    
    public void MetadatosPartes.setTextoEs(String textoEs) {
        this.textoEs = textoEs;
    }
    
    public String MetadatosPartes.getTextoPt() {
        return this.textoPt;
    }
    
    public void MetadatosPartes.setTextoPt(String textoPt) {
        this.textoPt = textoPt;
    }
    
}
