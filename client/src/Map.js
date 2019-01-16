import React, { Component } from 'react'
//import axios from 'axios'
import './CSS/map.css'

  class Map extends Component {

    render() {
      return (
        <div className="mapContainer">
          <iframe title="map" width="100%" height="1000px" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://www.openstreetmap.org/export/embed.html?bbox=-81.61008238792421%2C41.50106071849423%2C-81.60557627677919%2C41.50397746363138&amp;layer=mapnik&amp;marker=41.502519107485014%2C-81.60782933235168"></iframe>
        </div>
      )
    }
  }

  export default Map