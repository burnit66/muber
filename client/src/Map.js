import React, { Component}  from 'react';
import MapGL, { Marker, Popup } from 'react-map-gl';
import Geocoder from 'react-map-gl-geocoder'
import DeckGL, { GeoJsonLayer } from 'deck.gl';
import WebMercatorViewport from 'viewport-mercator-project'
import './CSS/map.css'


class Map extends Component {

  state = {
    viewport: {
      width: 800,
      height: 600,
      latitude: 41.4993,
      longitude: -81.6994,
      zoom: 14,
      pitch: 0,
      bearing: 0
    },
    marker: {
      latitude: 41.4993,
      longitude: -81.6994,
    },
    markerdest: {
      latitude: 0,
      longitude:0 
    },
    haveDestination: false,
    haveUsersLocation: false,
    map: '',
    linelayerstuff: {
      id: 'GeoJsonLayer', 
      data: {
        "type": "LineString",
        "coordinates": [[0, 0], [0, 0]]
      },
      getLineWidth: 12,
      getLineColor: [255,20,147]
    }
  };

  mapRef = React.createRef()

  componentDidMount() {
    const success = (position) => {
      this.setState({
        viewport: {
          width: 800,
          height: 600,
          latitude: position.coords.latitude,
          longitude: position.coords.longitude,
          zoom: 14,
          pitch: 0,
          bearing: 0
        },
        marker: {
          latitude: position.coords.latitude,
          longitude: position.coords.longitude,
        },
        markerdest: {
          latitude: 41.0814,
          longitude: -81.5190,
        },
        haveUsersLocation: true
      })
    }
    const error = (err) => {
      console.log(err)
    }
    const options = {
      enableHighAccuracy: true
    }
    navigator.geolocation.getCurrentPosition(success, error, options) 
  }
  
  handleViewportChange = (viewport) => {
    this.setState({
      viewport: { ...this.state.viewport, ...viewport }
    })
  }

  handleGeocoderViewportChange = (viewport) => {
    const geocoderDefaultOverrides = { transitionDuration: 1000 }


    return this.handleViewportChange({
      ...viewport,
      ...geocoderDefaultOverrides
    })
  }

  resultFunction = (result) => {
    const directions = [[this.state.marker.longitude, this.state.marker.latitude]]
    fetch('https://api.mapbox.com/directions/v5/mapbox/driving/' + this.state.marker.longitude + ',' + this.state.marker.latitude + ';' +
      result.result.center[0] + ',' + result.result.center[1] + '?geometries=geojson&access_token=' + process.env.REACT_APP_MAP_API)
      .then(response => {
        response.json().then(data => {
          const dir = data.routes[0].geometry.coordinates
          for(let i=0;i<dir.length;i++) {
            directions.push(dir[i])
          }
      });
      }).catch(function(error) {
          console.log('Fetch Error:', error);
    });
    console.log(directions)
    const viewport = new WebMercatorViewport(this.state.viewport)
    const newViewport = viewport.fitBounds([[this.state.marker.longitude, this.state.marker.latitude], [result.result.center[0], result.result.center[1]]], {
      padding: 20,
      offset: [0, -100]
    })
    this.setState({
      viewport: {
        width: 800,
        height: 600,
        latitude: newViewport.latitude,
        longitude: newViewport.longitude,
        zoom: newViewport.zoom,
        pitch: 0,
        bearing: 0,
        transitionDuration: 1700
      },
      markerdest: {
        latitude: result.result.center[1],
        longitude: result.result.center[0]
      },
      haveDestination: true,
      linelayerstuff: {
        id: 'GeoJsonLayer', 
        data: {
          "type": "LineString",
          "coordinates": [directions[0], directions[1], [-81.4412, 41.3898]]
        },
        getLineWidth: 100,
        getLineColor: [255,20,147]
      }
    })
  }

  render() {
    return (
      <div>
          <MapGL
            ref={this.mapRef}
            {...this.state.viewport}
            mapboxApiAccessToken={process.env.REACT_APP_MAP_API}
            mapStyle="mapbox://styles/mapbox/streets-v10"
            onViewportChange={(viewport) => this.setState({viewport})}
          >
          <DeckGL
              {...this.state.viewport}
              layers={[
                new GeoJsonLayer(this.state.linelayerstuff)
              ]}
          />
            <Marker latitude={this.state.marker.latitude} longitude={this.state.marker.longitude} offsetLeft={-25} offsetTop={-10}>
              <img className = "truckimg" alt='' src ='https://purepng.com/public/uploads/large/purepng.com-pickup-truckpickup-trucktruckspickup-vehiclesautomobilesford-truck-1701527595836tou4y.png' />
            </Marker>
            <Popup latitude={this.state.marker.latitude} longitude={this.state.marker.longitude} closeButton={true} closeOnClick={false} anchor="bottom" offsetTop={-10}>
              <div>You are here!</div>
            </Popup>
            {this.state.haveDestination && <Marker latitude={this.state.markerdest.latitude} longitude={this.state.markerdest.longitude} offsetLeft={-25} offsetTop={-10}>
              <img className = "treasureimg" alt='' src ='https://pngimg.com/uploads/treasure_chest/treasure_chest_PNG154.png' />
            </Marker>}
            {this.state.haveDestination && <Popup latitude={this.state.markerdest.latitude} longitude={this.state.markerdest.longitude} closeButton={true} closeOnClick={false} anchor="bottom" offsetTop={-10}>
              <div>Destination!</div>
            </Popup>}  
            
            <Geocoder
              mapRef={this.mapRef}
              onViewportChange={this.handleGeocoderViewportChange}
              mapboxApiAccessToken={process.env.REACT_APP_MAP_API}
              onResult={this.resultFunction}
              zoom={14}
            />
          </MapGL>
      </div>
    );
  }
}

export default Map;