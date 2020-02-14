package app.dashboard.controller

import app.dashboard.db.model.Employee
import app.dashboard.db.repositories.IEmployeeRepository
import app.dashboard.service.IAppService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.ModelMap
import org.springframework.validation.BindingResult
import org.springframework.web.bind.annotation.ModelAttribute
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.servlet.ModelAndView

@Controller
class EmployeeController @Autowired constructor(private val appService: IAppService, private val employeeRepository: IEmployeeRepository) {
    @RequestMapping(value = ["/", "/login"], method = [RequestMethod.GET])
    fun displayLogin(model: Model): String? {
        model.addAttribute("employee", Employee())
        return "login"
    }

    @RequestMapping(value = ["/register"], method = [RequestMethod.GET])
    fun register(model: Model): ModelAndView {
        val modelAndView = ModelAndView()
        modelAndView.viewName = "register"
        model.addAttribute("employee", Employee()) //required in register.jsp
        return modelAndView
    }

    @RequestMapping(value = ["/addEmployee"], method = [RequestMethod.POST])
    fun addEmployee(@ModelAttribute("employee") employee: Employee,
                    result: BindingResult?, model: ModelMap?): String {
        println("add employee called $employee")
        employee.password = appService.encodePassword(employee.password)
        appService.insertEmployee(employee)

        return "login"
    }
}