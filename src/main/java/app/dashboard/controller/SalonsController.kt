package app.dashboard.controller

import app.dashboard.db.model.Salon
import app.dashboard.db.repositories.ISalonRepository
import app.dashboard.service.IAppService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.ModelMap
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod

@Controller
class SalonsController @Autowired constructor(private val appService: IAppService, private val salonRepository: ISalonRepository) {
    @RequestMapping(value = ["/index", "/salons"], method = [RequestMethod.GET])
    fun displaySalons(model: Model): String? {

        model.addAttribute("salons", salonRepository.findAll())
        model.addAttribute("salon", Salon())
        return "salons"
    }

    @RequestMapping(value = ["/editSalon"], method = [RequestMethod.POST])
    fun editSalon(@RequestBody t: Salon, model: ModelMap): String {
        salonRepository.save(t)

        model.addAttribute("salons", salonRepository.findAll())
        model.addAttribute("salon", Salon())


        return "redirect:/salons"
    }

    @RequestMapping(value = ["/deleteSalon/{id}"], method = [RequestMethod.DELETE])
    @org.springframework.web.bind.annotation.ResponseBody
    fun deleteSalon(@PathVariable("id") id: Long) {
        val t = salonRepository.findById(id).get()
        salonRepository.delete(t)
    }

    @RequestMapping(value = ["/addSalon"], method = [RequestMethod.POST])
    fun addClass(@RequestBody a: Salon, model: ModelMap): String {
        appService.insertSalon(a)
        return "salons"
    }
}