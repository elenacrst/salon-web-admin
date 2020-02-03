package app.dashboard.controller

import app.dashboard.db.repositories.ISalonRepository
import app.dashboard.service.IAppService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod

@Controller
class SalonsController @Autowired constructor(private val appService: IAppService, private val salonRepository: ISalonRepository) {
    @RequestMapping(value = ["/index", "/salons"], method = [RequestMethod.GET])
    fun displayLogin(model: Model): String? {

        model.addAttribute("salons", salonRepository.findAll())
        return "salons"
    }
}