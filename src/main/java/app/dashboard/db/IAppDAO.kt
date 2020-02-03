package app.dashboard.db

import app.dashboard.db.model.Employee

interface IAppDAO {
    fun insertEmployee(employee: Employee)
}