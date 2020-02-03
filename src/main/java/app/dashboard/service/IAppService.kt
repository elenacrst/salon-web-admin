package app.dashboard.service

import app.dashboard.db.model.Employee

interface IAppService {
    fun encodePassword(password: String?): String?
    fun insertEmployee(employee: Employee)
}