<!doctype html>
<html>
<head>


    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="../../assets/myStyle.css"/>
    <script src="../../assets/jquery-3.3.1.min.js" type="application/javascript"></script>
    <script src="../../assets/exe.js" type="application/javascript"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script>
    <!--Modal-->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script async defer
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCe263vdbnU2mbNI5Dm4SHXCte3U2IJSlA&callback=initMap">
    </script>
    <title>Welcome to Grails</title>
    <style>
        .formula{
            max-width: 400px;
            margin: 20px auto;
        }
    </style>

</head>
<body>

<div id="idFomr" class="col-sm-4">
    <label>Medio de pago: </label>
    <g:select name="sitio" id="idSelect" from="${lista}" optionValue="${{it.name}}" optionKey="${{it.id}}"
               noSelection="${['null':'Seleccione una opcion']}"/>
    <br>
    <br>
    <label>Ingrese Direccion: <g:textField name="nmDireccion" id="idDireccion" value="${myValue}" /></label>
    <br>
    <br>
    <label>Ingrese radio en metros: <g:textField name="nmRadio" id="idRadio" value="${myValue}" /></label>
    <br><br>
    <input class="myButton" type="Submit" id="idSubmit" value="Enviar" onclick="getRadio()"/>
</div>
<div class="col-sm-8">
    <div id="map" ></div>
</div>

<div id="idDivAgencias" class="col-md-12"></div>
<br>



<script>
    function getRadio() {

        var pago = $("#idSelect").val();
        var direccion = $("#idDireccion").val();
        var radio = $("#idRadio").val();

        $.ajax({
            type: "POST",
            url: '${createLink( controller:'MediosDePago', action:'getUrl')}',
            data: {
                pago: pago, direccion: direccion, radio: radio
            },
            success: function (resp) {

                $("#idDivAgencias").append("<table id=\"example\" class=\"table table-striped table-bordered\" cellspacing=\"0\" width=\"100%\">" +
                    "<thead>" +
                    "<tr>" +
                    "<th>Nombre de la agencia</th>"+
                    "<th>Detalles de agencias</th>"+
                    "</tr>"+
                    "</thead>"+
                    "<tbody id=\"tbody\">");


                $.each(resp.results, function (i, item) {

                    $("#tbody").append("<tr><td>"+item.description+"</td><td><button  data-toggle=\"modal\" data-target=\"#myModal\"  onclick=\"jUtils.getModal('"+item.description+"','"+item.address.country+"','"+item.address.city+"','"+item.address.address_line+"','"+item.agency_code+"')\"> <span class=\"glyphicon glyphicon-search\"></span></button> </td></tr>");

                    jUtils.dibujarMarcadores(item.address.location, item.description);
                });
                $("#idDivAgencias").append("</tbody> </table>");
                $("#example").DataTable();


            }
        });

    }
</script>

<div id="myModal" class="modal fade" role="dialog">
<div class="modal-dialog">


     <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal">&times;</button>
               <h4 class="modal-title">Datos de agencia</h4>
           </div>
           <div class="modal-body">
            <span id="idDatosSpan"></span><br><br>
            <span id="idPaisSpan"></span><br>
            <span id="idCiudadSpan"></span><br>
            <span id="idDireccionSpan"></span><br>
            <span id="idCodigoSpan"></span>

           </div>
           <div class="modal-footer">
               <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
           </div>
       </div>

    </div>
</div>
</body>