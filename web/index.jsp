

<%@page import="issPosition.lonlat"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <style>
            #map {
                height: 600px;
                width: 100%;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="https://cdn4.iconfinder.com/data/icons/REALVISTA/networking/png/48/satellite.png" />
        <title>ISS Position</title>
    </head>

    <body>
        
        <%lonlat position = new lonlat();%>
        <div id="latitude"><h3>Position of ISS</h3>
            Latitude: <%= String.format("%.3f", position.getLatitude())%>
            Longitude: <%=String.format("%.3f", position.getLongitude())%></div>
        <div id="map"></div>
        <script>setTimeout(function () {
                window.location.reload(1);
            }, 8000);</script>
        <script>
            function initMap() {
                var uluru = {lat: <%= String.format("%.3f", position.getLatitude())%>, lng: <%=String.format("%.3f", position.getLongitude())%>};
                var map = new google.maps.Map(document.getElementById('map'), {
                    zoom: 6,
                    center: uluru
                });
                var image = 'https://cdn4.iconfinder.com/data/icons/REALVISTA/networking/png/48/satellite.png';
                function AddMarker() {
                    var marker = new google.maps.Marker({
                        position: new google.maps.LatLng(<%= String.format("%.3f", position.getLatitude())%>,<%=String.format("%.3f", position.getLongitude())%>),
                        map: map,
                        icon: image
                    });
                }
                AddMarker();
            }
        </script>
        <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAymgz0AXCj6ipuLijePEpi72_QcUga23Q&callback=initMap">
        </script>
    </body>
</html>
