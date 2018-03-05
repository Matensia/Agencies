package agencies

import grails.converters.JSON
import groovy.json.JsonSlurper

class MediosDePagoController {



    def index() {

        MeliService meliService = new MeliService()
        return  meliService.getMediosDePago()

    }

    def getUrl(){

        GoogleService googleService = new GoogleService()
        def lista = [:]
        lista = googleService.getUbicacion(params.direccion)

        MeliService meliService = new MeliService()

        render  meliService.getAgencias(params.pago,params.radio,lista.lat,lista.lng)

    }


}
