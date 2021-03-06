// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.unlp.sedici.sedici2003.model;

import ar.edu.unlp.sedici.sedici2003.model.Logg;
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

privileged aspect Logg_Roo_Entity {
    
    declare @type: Logg: @Entity;
    
    declare @type: Logg: @Table(name = "logg");
    
    @PersistenceContext
    transient EntityManager Logg.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Integer Logg.id;
    
    public Integer Logg.getId() {
        return this.id;
    }
    
    public void Logg.setId(Integer id) {
        this.id = id;
    }
    
    @Transactional
    public void Logg.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Logg.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Logg attached = Logg.findLogg(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Logg.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Logg.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Logg Logg.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Logg merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager Logg.entityManager() {
        EntityManager em = new Logg().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Logg.countLoggs() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Logg o", Long.class).getSingleResult();
    }
    
    public static List<Logg> Logg.findAllLoggs() {
        return entityManager().createQuery("SELECT o FROM Logg o", Logg.class).getResultList();
    }
    
    public static Logg Logg.findLogg(Integer id) {
        if (id == null) return null;
        return entityManager().find(Logg.class, id);
    }
    
    public static List<Logg> Logg.findLoggEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Logg o", Logg.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
