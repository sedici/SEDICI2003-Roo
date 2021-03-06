// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.unlp.sedici.sedici2003.model;

import java.lang.Integer;
import java.lang.String;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;

privileged aspect Contacto_Roo_DbManaged {
    
    @Column(name = "apellido", length = 70)
    private String Contacto.apellido;
    
    @Column(name = "descripcion", length = 255)
    private String Contacto.descripcion;
    
    @Column(name = "email", length = 70)
    private String Contacto.email;
    
    @Column(name = "evento")
    private Integer Contacto.evento;
    
    @Column(name = "fecha_hora_envio")
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date Contacto.fechaHoraEnvio;
    
    @Column(name = "id_dependencia")
    private Integer Contacto.idDependencia;
    
    @Column(name = "id_institucion")
    private Integer Contacto.idInstitucion;
    
    @Column(name = "id_pais")
    private Integer Contacto.idPais;
    
    @Column(name = "id_tipo_documento")
    private Integer Contacto.idTipoDocumento;
    
    @Column(name = "id_unidad")
    private Integer Contacto.idUnidad;
    
    @Column(name = "nombre", length = 70)
    private String Contacto.nombre;
    
    @Column(name = "otro_dependencia", length = 100)
    private String Contacto.otroDependencia;
    
    @Column(name = "otro_institucion", length = 100)
    private String Contacto.otroInstitucion;
    
    @Column(name = "otro_pais", length = 100)
    private String Contacto.otroPais;
    
    @Column(name = "otro_unidad", length = 100)
    private String Contacto.otroUnidad;
    
    public String Contacto.getApellido() {
        return this.apellido;
    }
    
    public void Contacto.setApellido(String apellido) {
        this.apellido = apellido;
    }
    
    public String Contacto.getDescripcion() {
        return this.descripcion;
    }
    
    public void Contacto.setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    public String Contacto.getEmail() {
        return this.email;
    }
    
    public void Contacto.setEmail(String email) {
        this.email = email;
    }
    
    public Integer Contacto.getEvento() {
        return this.evento;
    }
    
    public void Contacto.setEvento(Integer evento) {
        this.evento = evento;
    }
    
    public Date Contacto.getFechaHoraEnvio() {
        return this.fechaHoraEnvio;
    }
    
    public void Contacto.setFechaHoraEnvio(Date fechaHoraEnvio) {
        this.fechaHoraEnvio = fechaHoraEnvio;
    }
    
    public Integer Contacto.getIdDependencia() {
        return this.idDependencia;
    }
    
    public void Contacto.setIdDependencia(Integer idDependencia) {
        this.idDependencia = idDependencia;
    }
    
    public Integer Contacto.getIdInstitucion() {
        return this.idInstitucion;
    }
    
    public void Contacto.setIdInstitucion(Integer idInstitucion) {
        this.idInstitucion = idInstitucion;
    }
    
    public Integer Contacto.getIdPais() {
        return this.idPais;
    }
    
    public void Contacto.setIdPais(Integer idPais) {
        this.idPais = idPais;
    }
    
    public Integer Contacto.getIdTipoDocumento() {
        return this.idTipoDocumento;
    }
    
    public void Contacto.setIdTipoDocumento(Integer idTipoDocumento) {
        this.idTipoDocumento = idTipoDocumento;
    }
    
    public Integer Contacto.getIdUnidad() {
        return this.idUnidad;
    }
    
    public void Contacto.setIdUnidad(Integer idUnidad) {
        this.idUnidad = idUnidad;
    }
    
    public String Contacto.getNombre() {
        return this.nombre;
    }
    
    public void Contacto.setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public String Contacto.getOtroDependencia() {
        return this.otroDependencia;
    }
    
    public void Contacto.setOtroDependencia(String otroDependencia) {
        this.otroDependencia = otroDependencia;
    }
    
    public String Contacto.getOtroInstitucion() {
        return this.otroInstitucion;
    }
    
    public void Contacto.setOtroInstitucion(String otroInstitucion) {
        this.otroInstitucion = otroInstitucion;
    }
    
    public String Contacto.getOtroPais() {
        return this.otroPais;
    }
    
    public void Contacto.setOtroPais(String otroPais) {
        this.otroPais = otroPais;
    }
    
    public String Contacto.getOtroUnidad() {
        return this.otroUnidad;
    }
    
    public void Contacto.setOtroUnidad(String otroUnidad) {
        this.otroUnidad = otroUnidad;
    }
    
}
