import React, { Component } from 'react'
//import axios from 'axios'
import './CSS/map.css'

  class Map extends Component {

    render() {
      return (
        <div className="mapContainer">
          <img className="map" alt="map" src="https://www.uwgb.edu/UWGBCMS/media/Maps/images/map-icon.jpg"/>
        </div>
      )
    }
  }

  export default Map