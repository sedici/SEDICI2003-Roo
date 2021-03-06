// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.unlp.sedici.sedici2003.model;

import ar.edu.unlp.sedici.sedici2003.model.Personas;
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

privileged aspect Personas_Roo_Entity {
    
    declare @type: Personas: @Entity;
    
    declare @type: Personas: @Table(name = "personas");
    
    @PersistenceContext
    transient EntityManager Personas.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Integer Personas.id;
    
    public Integer Personas.getId() {
        return this.id;
    }
    
    public void Personas.setId(Integer id) {
        this.id = id;
    }
    
    @Transactional
    public void Personas.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Personas.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Personas attached = Personas.findPersonas(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Personas.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Personas.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Personas Personas.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Personas merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager Personas.entityManager() {
        EntityManager em = new Personas().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Personas.countPersonases() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Personas o", Long.class).getSingleResult();
    }
    
    public static List<Personas> Personas.findAllPersonases() {
        return entityManager().createQuery("SELECT o FROM Personas o", Personas.class).getResultList();
    }
    
    public static Personas Personas.findPersonas(Integer id) {
        if (id == null) return null;
        return entityManager().find(Personas.class, id);
    }
    
    public static List<Personas> Personas.findPersonasEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Personas o", Personas.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
