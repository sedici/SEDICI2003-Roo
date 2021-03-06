// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.unlp.sedici.sedici2003.model;

import ar.edu.unlp.sedici.sedici2003.model.IpOai;
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

privileged aspect IpOai_Roo_Entity {
    
    declare @type: IpOai: @Entity;
    
    declare @type: IpOai: @Table(name = "ip_oai");
    
    @PersistenceContext
    transient EntityManager IpOai.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Integer IpOai.id;
    
    public Integer IpOai.getId() {
        return this.id;
    }
    
    public void IpOai.setId(Integer id) {
        this.id = id;
    }
    
    @Transactional
    public void IpOai.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void IpOai.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            IpOai attached = IpOai.findIpOai(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void IpOai.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void IpOai.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public IpOai IpOai.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        IpOai merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager IpOai.entityManager() {
        EntityManager em = new IpOai().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long IpOai.countIpOais() {
        return entityManager().createQuery("SELECT COUNT(o) FROM IpOai o", Long.class).getSingleResult();
    }
    
    public static List<IpOai> IpOai.findAllIpOais() {
        return entityManager().createQuery("SELECT o FROM IpOai o", IpOai.class).getResultList();
    }
    
    public static IpOai IpOai.findIpOai(Integer id) {
        if (id == null) return null;
        return entityManager().find(IpOai.class, id);
    }
    
    public static List<IpOai> IpOai.findIpOaiEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM IpOai o", IpOai.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
