// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.unlp.sedici.sedici2003.model;

import java.lang.String;

privileged aspect DsiPersonasPerfil_Roo_ToString {
    
    public String DsiPersonasPerfil.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("AnioPublicacion: ").append(getAnioPublicacion()).append(", ");
        sb.append("AnioPublicacion2: ").append(getAnioPublicacion2()).append(", ");
        sb.append("Disponible: ").append(getDisponible()).append(", ");
        sb.append("FechaHora: ").append(getFechaHora()).append(", ");
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("IdPersona: ").append(getIdPersona()).append(", ");
        sb.append("NombrePerfil: ").append(getNombrePerfil()).append(", ");
        sb.append("RecibirPorMail: ").append(getRecibirPorMail());
        return sb.toString();
    }
    
}
