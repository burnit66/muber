import React, { Component } from 'react'
//import axios from 'axios'
import './CSS/currentlocation.css'

  class CurrentLocation extends Component {

    handleEvent = event => {
        alert("I was clicked");
    };

    render() {
      return (
        <div className="currentLocationContainer" onClick={this.handleEvent}>
            <i class="fas fa-location-arrow fa-2x fa-vc"></i>
        </div>
      )
    }
  }

export default CurrentLocation;