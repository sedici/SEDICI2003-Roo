// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.unlp.sedici.sedici2003.model;

import java.lang.String;

privileged aspect Personas_Roo_ToString {
    
    public String Personas.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Apellido: ").append(getApellido()).append(", ");
        sb.append("CantVisitas: ").append(getCantVisitas()).append(", ");
        sb.append("Cargo: ").append(getCargo()).append(", ");
        sb.append("Categoria: ").append(getCategoria()).append(", ");
        sb.append("Dni: ").append(getDni()).append(", ");
        sb.append("Email: ").append(getEmail()).append(", ");
        sb.append("Email1: ").append(getEmail1()).append(", ");
        sb.append("Email2: ").append(getEmail2()).append(", ");
        sb.append("FechaInscripcion: ").append(getFechaInscripcion()).append(", ");
        sb.append("HorarioDeContacto: ").append(getHorarioDeContacto()).append(", ");
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("IdDependencia: ").append(getIdDependencia()).append(", ");
        sb.append("IdGrado: ").append(getIdGrado()).append(", ");
        sb.append("IdIdioma: ").append(getIdIdioma()).append(", ");
        sb.append("IdInstitucion: ").append(getIdInstitucion()).append(", ");
        sb.append("IdPais: ").append(getIdPais()).append(", ");
        sb.append("IdUnidad: ").append(getIdUnidad()).append(", ");
        sb.append("Login: ").append(getLogin()).append(", ");
        sb.append("LugarDeTrabajo: ").append(getLugarDeTrabajo()).append(", ");
        sb.append("Mailvisible: ").append(getMailvisible()).append(", ");
        sb.append("Mailvisible1: ").append(getMailvisible1()).append(", ");
        sb.append("Mailvisible2: ").append(getMailvisible2()).append(", ");
        sb.append("Nombre: ").append(getNombre()).append(", ");
        sb.append("Observaciones: ").append(getObservaciones()).append(", ");
        sb.append("OtroDependencia: ").append(getOtroDependencia()).append(", ");
        sb.append("OtroInstitucion: ").append(getOtroInstitucion()).append(", ");
        sb.append("OtroPais: ").append(getOtroPais()).append(", ");
        sb.append("OtroUnidad: ").append(getOtroUnidad()).append(", ");
        sb.append("Password: ").append(getPassword()).append(", ");
        sb.append("Perfil: ").append(getPerfil()).append(", ");
        sb.append("Recinf: ").append(getRecinf()).append(", ");
        sb.append("Recinf1: ").append(getRecinf1()).append(", ");
        sb.append("Recinf2: ").append(getRecinf2()).append(", ");
        sb.append("Siteweb: ").append(getSiteweb()).append(", ");
        sb.append("Telefono: ").append(getTelefono());
        return sb.toString();
    }
    
}
