<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Maps.aspx.cs" Inherits="FYP_EATERYINFO.Maps" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset ="UTF-8" />
    <meta name="viewport"
    content="width=device-width,
    initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible"
    content="ie-edge" />
    <title>Add Map</title>
    <style>
        #map{
            height:400px;
            width:100%;
        }
    </style>
    <!--<link rel="stylesheet" type="text/css" href="./style.css" />-->
    <!--<script src="./index.js"></script>-->

  </head>

    <!--Longtitude = 'Select Longtitude from user_auth where _EateryID = EateryID';

    (Latitude,Longtitude)-->

  <body>
    <%--<form id="form1 runat="server">
        <div>
            <div id="dvMap" runat="server" style="width:auto;height:400px"></div>
            <script type="text/javascript">
                var marker[
                    <asp: Repeater ID="rptMarkers" runat="server">
                        <ItemTemplate>
                            "Lat": '<%# Eval("") %>'
                            "Lng": '<%# Eval("") %>'
                            "Description": '<%# Eval("") %>'
                        </ItemTemplate>
                        <SeperatorTemplate>
                            ,
                        </SeperatorTemplate>
                    </asp: Repeater>
                ];
            </script>

            <script type="text/javascript">
                window.onload = function () {
                    var mapOptions = {
                        center: new google.maps.LatLng(markers[0].lat, markets[0].lng),
                        zoom: 10,
                        mapTypeId: google.maps.MapTypeId.ROADMAP
                    };
                    var infoWindow = new google.maps.InfoWindow();
                    var map = new google.maps.Map(document.getElementById("dvMap"), mapOptions);
                    for (i = 0; i < markets.length; i++) {
                        var data = markers[i]
                        var myLatLng = new google.maps.LatLng(data.lat, data.lng);
                        var marker = new google.maps.Marker({
                            position: LatLng,
                            map: map,
                            title: data.title
                        });
                        (function (marker, data) {
                            google.maps.event.addListener(marker, "click", function (e) {
                                infoWindow.setContent(data.description);
                                infoWindow.open(map, marker);
                            });
                        })(marker, data);
                    }
                }
            </script>

        </div>
    </form>--%>
    <h3>My Google Maps</h3>
    <!--The div element for the map -->
    <div id="map"></div>
    <script>
        // Initialize and add the map
        // Map options
        function initMap(){
            var options = {
                zoom: 8,
                center: {lat:1.2931,lng:103.8520}
            }
            //new map
            var map = new google.maps.Map(document.getElementById('map'), options);
            
            /*// add marker
            var marker = new google.maps.Marker({
                position:{lat:1.2940,lng:103.8531},
                map:map,
            });
            var infoWindow = new google.maps.InfoWindow({
                content: '<h1>Eatery A</h1>'
            });

            marker.addListener('click', function () {
                infoWindow.open(map, marker);
            });
            */
            
            //Array of markers
            var markers = [
                {
                    coords: {lat:1.354027,lng:103.8878279},
                    content: '<h1>DeliSnacks</h1>'
                },
                {
                    coords: {lat:1.3329058,lng: 103.8484755},
                    content: '<h1>Tiong Bahru Pau</h1>'
                },
                {
                    coords: {lat: 1.3250353,lng:103.9282762},
                    content: '<h1>Bedok Chwee Kueh</h1>'
                }
            ];

            //Loop through markers
            for(var i = 0; i < markers.length; i++) {
                addMarker(markers[i]);
            }
            
            //Add Marker function
            function addMarker(props) {
                var marker = new google.maps.Marker({
                    position: props.coords,
                    map: map
                });

                // Check content
                if (props.content) {
                    var infoWindow = new google.maps.InfoWindow({
                        content: props.content
                    });

                    marker.addListener('click', function () {
                        infoWindow.open(map, marker);
                    });
                }
                
            }

        }
    </script>
    <!-- Async script executes immediately and must be after any DOM elements used in callback. -->
   <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDBz0U7UfQ-9GhrPBu2wCE6Jt1i8gqi-6g&callback=initMap&v=weekly"
      async
    ></script>
  </body>
</html>
</asp:Content>
