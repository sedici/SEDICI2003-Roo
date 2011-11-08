// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.unlp.sedici.sedici2003.model;

import ar.edu.unlp.sedici.sedici2003.model.Contacto;
import java.lang.Integer;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PersistenceContext;
import javax.persistence.Table;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Contacto_Roo_Entity {
    
    declare @type: Contacto: @Entity;
    
    declare @type: Contacto: @Table(name = "contacto");
    
    @PersistenceContext
    transient EntityManager Contacto.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Integer Contacto.id;
    
    public Integer Contacto.getId() {
        return this.id;
    }
    
    public void Contacto.setId(Integer id) {
        this.id = id;
    }
    
    @Transactional
    public void Contacto.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Contacto.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Contacto attached = Contacto.findContacto(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Contacto.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Contacto.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Contacto Contacto.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Contacto merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager Contacto.entityManager() {
        EntityManager em = new Contacto().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Contacto.countContactoes() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Contacto o", Long.class).getSingleResult();
    }
    
    public static List<Contacto> Contacto.findAllContactoes() {
        return entityManager().createQuery("SELECT o FROM Contacto o", Contacto.class).getResultList();
    }
    
    public static Contacto Contacto.findContacto(Integer id) {
        if (id == null) return null;
        return entityManager().find(Contacto.class, id);
    }
    
    public static List<Contacto> Contacto.findContactoEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Contacto o", Contacto.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
