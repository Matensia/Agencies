var map;
var limites;
var marcadores = [];
var jUtils = {

    getModal : function(descripcion, pais, ciudad, direccion, codigo_agencia) {

        $("#idDatosSpan").text("Datos de "+descripcion);
        $("#idPaisSpan").text("Pais: "+pais);
        $("#idCiudadSpan").text("Ciudad: "+ciudad);
        $("#idDireccionSpan").text("Direccion: "+direccion);
        $("#idCodigoSpan").text("Codigo de agencia: "+codigo_agencia);

    },



    dibujarMarcadores : function(posicion, nombre) {
        var posArray = posicion.split(",");
        var lati = parseFloat(posArray[0]);
        var lngu = parseFloat(posArray[1]);
        var uluru = {lat: lati, lng: lngu};
        var marker = new google.maps.Marker({
            position: uluru,
            title: nombre
        });
        marker.setMap(map);
        marcadores.push(marker);
        limites.extend(marker.position);
        map.fitBounds(limites);
    },


}



function initMap() {
    map = new google.maps.Map(document.getElementById('map'), {
        zoom: 4,
        center: {lat:-34.0000000, lng:-64.0000000}
    });
    limites = new google.maps.LatLngBounds();
}