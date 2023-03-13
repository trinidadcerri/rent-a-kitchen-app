import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    marker: Object
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/outdoors-v12"
    })
    this.#addMarkerToMap()
    this.#fitMapToMarker()

    this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl }))
  }
  #addMarkerToMap() {
    const marker = this.markerValue;
    const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)

    const customMarker = document.createElement("div")
    customMarker.innerHTML = marker.marker_html

    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(this.map)
  }
  #fitMapToMarker() {
    const marker = this.markerValue; // assuming markersValue is a single marker object
    const bounds = new mapboxgl.LngLatBounds().extend([ marker.lng, marker.lat ]);
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  }
}
