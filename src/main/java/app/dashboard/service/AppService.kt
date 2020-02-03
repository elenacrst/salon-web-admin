package app.dashboard.service

import app.dashboard.db.*
import app.dashboard.db.model.Employee
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder
import org.springframework.stereotype.Service

@Service
class AppService @Autowired
constructor(private val appDao: IAppDAO) : IAppService {

    override fun encodePassword(password: String?): String? {
        val encoder = BCryptPasswordEncoder(10)
        return encoder.encode(password)
    }

    override fun insertEmployee(employee: Employee) {
        appDao.insertEmployee(employee)
    }
}
