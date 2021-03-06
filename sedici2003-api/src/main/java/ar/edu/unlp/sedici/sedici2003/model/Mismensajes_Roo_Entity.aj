// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.unlp.sedici.sedici2003.model;

import ar.edu.unlp.sedici.sedici2003.model.Mismensajes;
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

privileged aspect Mismensajes_Roo_Entity {
    
    declare @type: Mismensajes: @Entity;
    
    declare @type: Mismensajes: @Table(name = "mismensajes");
    
    @PersistenceContext
    transient EntityManager Mismensajes.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Integer Mismensajes.id;
    
    public Integer Mismensajes.getId() {
        return this.id;
    }
    
    public void Mismensajes.setId(Integer id) {
        this.id = id;
    }
    
    @Transactional
    public void Mismensajes.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Mismensajes.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Mismensajes attached = Mismensajes.findMismensajes(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Mismensajes.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Mismensajes.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Mismensajes Mismensajes.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Mismensajes merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager Mismensajes.entityManager() {
        EntityManager em = new Mismensajes().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Mismensajes.countMismensajeses() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Mismensajes o", Long.class).getSingleResult();
    }
    
    public static List<Mismensajes> Mismensajes.findAllMismensajeses() {
        return entityManager().createQuery("SELECT o FROM Mismensajes o", Mismensajes.class).getResultList();
    }
    
    public static Mismensajes Mismensajes.findMismensajes(Integer id) {
        if (id == null) return null;
        return entityManager().find(Mismensajes.class, id);
    }
    
    public static List<Mismensajes> Mismensajes.findMismensajesEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Mismensajes o", Mismensajes.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
