package app.dashboard.db.repositories;

import app.dashboard.db.model.Salon;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ISalonRepository extends JpaRepository<Salon, Long> {
}
