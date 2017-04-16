package session;

import entity.OrderedProduct;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author olli
 */
@Stateless
public class OrderedProductFacade extends AbstractFacade<OrderedProduct> {

    @PersistenceContext(unitName = "shopPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public OrderedProductFacade() {
        super(OrderedProduct.class);
    }
    
     public List<OrderedProduct> findByOrderId(Object id) {
        return em.createNamedQuery("OrderedProduct.findByCustomerOrderId").setParameter("customerOrderId", id).getResultList();
    }
    
}
