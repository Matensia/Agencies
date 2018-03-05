package agencies

import grails.converters.JSON
import grails.gorm.transactions.Transactional
import groovy.json.JsonSlurper

@Transactional
class MeliService {

    def getMediosDePago() {

        def url = new URL('https://api.mercadolibre.com/sites/MLA/payment_methods')
        def connection = (HttpURLConnection)url.openConnection()
        connection.setRequestMethod("GET")
        connection.setRequestProperty("Accept", "application/json")
        connection.setRequestProperty("User-Agent", "Mozzilla/5.0")
        JsonSlurper json = new JsonSlurper()

        [lista: json.parse(connection.getInputStream()).findAll{x -> x.payment_type_id == "ticket"}]

    }

    def getAgencias(pago,radio,latitud,longitud) {
        def url2 = new URL('https://api.mercadolibre.com/sites/MLA/payment_methods/'+pago+'/agencies?near_to='+latitud+','+longitud+','+radio+'')
        def connection2 = (HttpURLConnection)url2.openConnection()
        connection2.setRequestMethod("GET")
        connection2.setRequestProperty("Accept", "application/json")
        connection2.setRequestProperty("User-Agent", "Mozzilla/5.0")
        JsonSlurper json2 = new JsonSlurper()

        return json2.parse(connection2.getInputStream()) as JSON
    }

}
