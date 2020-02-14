package app.dashboard.service

import app.dashboard.db.model.Employee
import app.dashboard.db.model.Salon

interface IAppService {
    fun encodePassword(password: String?): String?
    fun insertEmployee(employee: Employee)
    fun insertSalon(salon: Salon)
}