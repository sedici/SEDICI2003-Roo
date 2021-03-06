// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.unlp.sedici.sedici2003.model;

import ar.edu.unlp.sedici.sedici2003.model.DsiNotificacion;
import ar.edu.unlp.sedici.sedici2003.model.DsiNotificacionPK;
import java.util.List;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Table;
import org.springframework.transaction.annotation.Transactional;

privileged aspect DsiNotificacion_Roo_Entity {
    
    declare @type: DsiNotificacion: @Entity;
    
    declare @type: DsiNotificacion: @Table(name = "dsi_notificacion");
    
    @PersistenceContext
    transient EntityManager DsiNotificacion.entityManager;
    
    @EmbeddedId
    private DsiNotificacionPK DsiNotificacion.id;
    
    public DsiNotificacionPK DsiNotificacion.getId() {
        return this.id;
    }
    
    public void DsiNotificacion.setId(DsiNotificacionPK id) {
        this.id = id;
    }
    
    @Transactional
    public void DsiNotificacion.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void DsiNotificacion.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            DsiNotificacion attached = DsiNotificacion.findDsiNotificacion(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void DsiNotificacion.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void DsiNotificacion.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public DsiNotificacion DsiNotificacion.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        DsiNotificacion merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager DsiNotificacion.entityManager() {
        EntityManager em = new DsiNotificacion().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long DsiNotificacion.countDsiNotificacions() {
        return entityManager().createQuery("SELECT COUNT(o) FROM DsiNotificacion o", Long.class).getSingleResult();
    }
    
    public static List<DsiNotificacion> DsiNotificacion.findAllDsiNotificacions() {
        return entityManager().createQuery("SELECT o FROM DsiNotificacion o", DsiNotificacion.class).getResultList();
    }
    
    public static DsiNotificacion DsiNotificacion.findDsiNotificacion(DsiNotificacionPK id) {
        if (id == null) return null;
        return entityManager().find(DsiNotificacion.class, id);
    }
    
    public static List<DsiNotificacion> DsiNotificacion.findDsiNotificacionEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM DsiNotificacion o", DsiNotificacion.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
