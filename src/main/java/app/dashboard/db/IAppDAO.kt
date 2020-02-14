package app.dashboard.db

import app.dashboard.db.model.Employee
import app.dashboard.db.model.Salon

interface IAppDAO {
    fun insertEmployee(employee: Employee)
    fun insertSalon(salon: Salon)
}