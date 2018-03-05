<!doctype html>
<html>
<head>
    <title>Welcome to Grails</title>
</head>
<body>
<div id="formulario">
    <g:select name="sitio" id="idSelect" from="${lista}" optionValue="${{it.name}}" optionKey="${{it.id}}"
               noSelection="${['null':'Seleccione una opcion']}"/>
    <br>
    <label>Ingrese direccion: <g:textField id="idDireccion" name="nmDireccion" value="${myValue}" /></label>
    <br>
    <label>Ingrese distancia: <g:textField id="idDistancia" name="nmDistacia" value="${myValue}" /></label>


</div>

</body>