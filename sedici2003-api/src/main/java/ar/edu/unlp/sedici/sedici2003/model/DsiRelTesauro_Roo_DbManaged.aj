// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.unlp.sedici.sedici2003.model;

import java.lang.Integer;
import java.lang.String;
import javax.persistence.Column;

privileged aspect DsiRelTesauro_Roo_DbManaged {
    
    @Column(name = "id_persona_perfil", unique = true)
    private Integer DsiRelTesauro.idPersonaPerfil;
    
    @Column(name = "id_tesauro", length = 100, unique = true)
    private String DsiRelTesauro.idTesauro;
    
    public Integer DsiRelTesauro.getIdPersonaPerfil() {
        return this.idPersonaPerfil;
    }
    
    public void DsiRelTesauro.setIdPersonaPerfil(Integer idPersonaPerfil) {
        this.idPersonaPerfil = idPersonaPerfil;
    }
    
    public String DsiRelTesauro.getIdTesauro() {
        return this.idTesauro;
    }
    
    public void DsiRelTesauro.setIdTesauro(String idTesauro) {
        this.idTesauro = idTesauro;
    }
    
}
