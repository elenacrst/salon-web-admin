package app.dashboard.db;

import app.dashboard.db.model.*;
import org.jetbrains.annotations.NotNull;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;

@Repository
public class AppDAO implements IAppDAO {

    @PersistenceContext
    private EntityManager entityManager;

    @Transactional
    public void insertEmployee(@NotNull Employee employee) {
        Query query = entityManager.createNativeQuery(AppQuery.INSERT_EMPLOYEE);
        query.setParameter("firstName", employee.getFirstName());
        query.setParameter("lastName", employee.getLastName());
        query.setParameter("email", employee.getEmail());
        query.setParameter("phone", employee.getPhone());
        query.setParameter("salonId", 0);
        query.setParameter("password",employee.getPassword());
        System.out.println("insert method for employee "+employee);
        query.executeUpdate();
    }
}
