package agencies

import grails.test.hibernate.HibernateSpec
import grails.testing.services.ServiceUnitTest
import spock.lang.Specification


class MeliServiceSpec extends HibernateSpec implements ServiceUnitTest<MeliService>{

    def setup() {
    }

    def cleanup() {
    }

    void "test something"() {
        expect:"fix me"
            true == false
    }

    void "crearServicioMedioDePagoValido"() {
        when:
        def lista = service.getMediosDePago()
        then:
        lista.size() > 0
    }





}
