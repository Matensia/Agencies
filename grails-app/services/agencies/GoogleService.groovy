package agencies

import grails.gorm.transactions.Transactional
import groovy.json.JsonSlurper

@Transactional
class GoogleService {

    def getUbicacion(direccion) {

        def encode = URLEncoder.encode(direccion,"UTF-8")
        def url = new URL('https://maps.googleapis.com/maps/api/geocode/json?address='+encode+'&key=AIzaSyCe263vdbnU2mbNI5Dm4SHXCte3U2IJSlA')
        def connection = (HttpURLConnection)url.openConnection()
        connection.setRequestMethod("GET")
        connection.setRequestProperty("Accept", "application/json")
        connection.setRequestProperty("User-Agent", "Mozzilla/5.0")
        JsonSlurper json = new JsonSlurper()

        def respuesta = json.parse(connection.getInputStream())

        def latitud = respuesta
                .results[0]
                .geometry
                .location
                .lat

        def longitud = respuesta
                .results[0]
                .geometry
                .location
                .lng

        def ubicacion = [:]

        ubicacion << [lat:latitud]
        ubicacion << [lng:longitud]

        return ubicacion

    }
}
