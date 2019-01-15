import React, { Component } from 'react'
//import axios from 'axios'
import './CSS/map.css'

  class Map extends Component {

    render() {
      return (
        <div className="mapContainer">
          <iframe width="100%" height="1000px" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://www.openstreetmap.org/export/embed.html?bbox=-81.60833626985551%2C41.509370685509495%2C-81.606083214283%2C41.51082888733878&amp;layer=mapnik&amp;marker=41.510099790529814%2C-81.60720974206924"></iframe>
        </div>
      )
    }
  }

  export default Map