// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.unlp.sedici.sedici2003.model;

import ar.edu.unlp.sedici.sedici2003.model.Estado;
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

privileged aspect Estado_Roo_Entity {
    
    declare @type: Estado: @Entity;
    
    declare @type: Estado: @Table(name = "estado");
    
    @PersistenceContext
    transient EntityManager Estado.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Integer Estado.id;
    
    public Integer Estado.getId() {
        return this.id;
    }
    
    public void Estado.setId(Integer id) {
        this.id = id;
    }
    
    @Transactional
    public void Estado.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Estado.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Estado attached = Estado.findEstado(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Estado.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Estado.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Estado Estado.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Estado merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager Estado.entityManager() {
        EntityManager em = new Estado().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Estado.countEstadoes() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Estado o", Long.class).getSingleResult();
    }
    
    public static List<Estado> Estado.findAllEstadoes() {
        return entityManager().createQuery("SELECT o FROM Estado o", Estado.class).getResultList();
    }
    
    public static Estado Estado.findEstado(Integer id) {
        if (id == null) return null;
        return entityManager().find(Estado.class, id);
    }
    
    public static List<Estado> Estado.findEstadoEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Estado o", Estado.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
