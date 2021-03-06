// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.unlp.sedici.sedici2003.model;

import ar.edu.unlp.sedici.sedici2003.model.Carpetas;
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

privileged aspect Carpetas_Roo_Entity {
    
    declare @type: Carpetas: @Entity;
    
    declare @type: Carpetas: @Table(name = "carpetas");
    
    @PersistenceContext
    transient EntityManager Carpetas.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Integer Carpetas.id;
    
    public Integer Carpetas.getId() {
        return this.id;
    }
    
    public void Carpetas.setId(Integer id) {
        this.id = id;
    }
    
    @Transactional
    public void Carpetas.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Carpetas.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Carpetas attached = Carpetas.findCarpetas(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Carpetas.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Carpetas.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Carpetas Carpetas.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Carpetas merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager Carpetas.entityManager() {
        EntityManager em = new Carpetas().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Carpetas.countCarpetases() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Carpetas o", Long.class).getSingleResult();
    }
    
    public static List<Carpetas> Carpetas.findAllCarpetases() {
        return entityManager().createQuery("SELECT o FROM Carpetas o", Carpetas.class).getResultList();
    }
    
    public static Carpetas Carpetas.findCarpetas(Integer id) {
        if (id == null) return null;
        return entityManager().find(Carpetas.class, id);
    }
    
    public static List<Carpetas> Carpetas.findCarpetasEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Carpetas o", Carpetas.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
