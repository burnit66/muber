import React, { Component}  from 'react'
import MapGL, { Marker } from 'react-map-gl'
import Geocoder from 'react-map-gl-geocoder'
import DeckGL, { GeoJsonLayer } from 'deck.gl'
import WebMercatorViewport from 'viewport-mercator-project'
import Icon from './Icon'
import { Link } from "react-router-dom";
import './CSS/map.css'
import './CSS/currentlocation.css'
import './CSS/whereto.css'

const vheight = window.innerHeight
const vwidth = window.innerWidth
const KEY = 

class MapUser extends Component {
  state = {
    viewport: {
      width: vwidth,
      height: vheight,
      latitude: 41.4993,
      longitude: -81.6994,
      zoom: 0,
      pitch: 0,
      bearing: 0
    },
    markerstart: {
      latitude: 41.4993,
      longitude: -81.6994,
      address: ""
    },
    marker: {
      latitude: 41.4993,
      longitude: -81.6994,
    },
    markerdest: {
      latitude: 0,
      longitude:0,
      address: "",
      totaldistance: 0,
      totaltime: 0
    },
    confirmshow: false,
    haveDestination: false,
    haveUsersLocation: false,
    linelayerstuff: {
      id: 'GeoJsonLayer', 
      data: {
        "type": "LineString",
        "coordinates": [[0, 0], [0, 0]]
      },
      getLineWidth: 8,
      getLineColor: [255,20,147]
    },
    directions: [],
    directionnum: 0,
    intervalNum: 0
  };

  mapRef = React.createRef()
  geocoderContainerRef= React.createRef()
  
  componentDidMount() {
    const success = (position) => {
      fetch("https://api.mapbox.com/geocoding/v5/mapbox.places/"+ position.coords.longitude + "," + position.coords.latitude + ".json?access_token=" + KEY)
      .then(this.handleErrors)
      .then(response => {
        response.json().then(data => {
          this.setState({
            viewport: {
              width: vwidth,
              height: vheight,
              latitude: position.coords.latitude,
              longitude: position.coords.longitude,
              zoom: 17,
              pitch: 0,
              bearing: 0
            },
            marker: {
              latitude: position.coords.latitude,
              longitude: position.coords.longitude,
            },
            markerstart: {
              latitude: position.coords.latitude,
              longitude: position.coords.longitude,
              address: data.features[0].place_name
            },
    
            haveUsersLocation: true
          })
      })
      }).catch(error => {
          console.log(error)
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

  callApi = async () => {
    const response = await fetch('/api/locations');
    const body = await response.json();
    if (response.status !== 200) throw Error(body.message);
    return body;
  };

  postLocations = async (lon1, lat1, lon2, lat2, pick, drop) => {
    const response = await fetch('/api/locations', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ lonp: lon1, latp: lat1, lond: lon2, latd: lat2, pickup: pick, dropoff: drop })
    });
  };

  truncateApi = async () => {
    const response = await fetch('/api/locations', {
      method: 'DELETE'
    });
  };

  setPosition = () => {
    const success = (position) => {
      this.setState({
        marker: {
          latitude: position.coords.latitude,
          longitude: position.coords.longitude,
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
      viewport: { ...this.state.viewport, ...viewport }, 
    })
    
  }

  handleGeocoderViewportChange = (viewport) => {
    const geocoderDefaultOverrides = { transitionDuration: 1700 }

    return this.handleViewportChange({
      ...viewport,
      ...geocoderDefaultOverrides
    })
  }

  lineWidth = dist => {
    if(dist>3082328) {
      return 4000
    }
    if(dist>2000000) {
      return 3000
    }
    if(dist>600000) {
      return 2000
    }
    if(dist>180770) {
      return 1000
    }
    if(dist>81770) {
      return 400
    }
    if(dist>30770) {
      return 300
    }
    if(dist>10770) {
      return 200
    }
    return 80
  }

  handleErrors = (response) => {
    if (!response.ok) {
        throw Error(response.statusText);
    }
    return response;
  }

  startFunction = (result) => {
    this.setState({
      markerstart: {
        latitude: result.result.center[1],
        longitude: result.result.center[0],
        address: result.result.place_name
      }
    })
  }

  resultFunction = (result) => {
    console.log(result)
    const directions = [[this.state.markerstart.longitude, this.state.markerstart.latitude]]
    const plainDirections = []
    fetch('https://api.mapbox.com/directions/v5/mapbox/driving/' + this.state.markerstart.longitude + ',' + this.state.markerstart.latitude + ';' +
      result.result.center[0] + ',' + result.result.center[1] + '?steps=true&geometries=geojson&access_token=' + KEY)
      .then(this.handleErrors)
      .then(response => {
        response.json().then(data => {
          if(data.code === "NoRoute"){
            console.log(data.code)
            return
          }
          const dir = data.routes[0].geometry.coordinates
          const pdir = data.routes[0].legs[0].steps
          for(let i=0;i<dir.length;i++) {
            directions.push(dir[i])
          }
          for(let i=0;i<pdir.length;i++) {
            plainDirections.push(pdir[i].maneuver.instruction)
          }
          const viewport = new WebMercatorViewport(this.state.viewport)
          const newViewport = viewport.fitBounds([[this.state.markerstart.longitude, this.state.markerstart.latitude], [result.result.center[0], result.result.center[1]]], {
            padding: 30,
            offset: [-100, -100]
          })
          this.setState({
            viewport: {
              width: vwidth,
              height: vheight,
              latitude: newViewport.latitude,
              longitude: newViewport.longitude,
              zoom: newViewport.zoom,
              pitch: 0,
              bearing: 0,
              transitionDuration: 1700
            },
            markerdest: {
              latitude: result.result.center[1],
              longitude: result.result.center[0],
              address: result.result.place_name
            },
            confirmshow: true,
            linelayerstuff: {
              id: 'GeoJsonLayer', 
              data: {
                "type": "LineString",
                "coordinates": directions
              },
              getLineWidth: this.lineWidth(data.routes[0].distance),
              getLineColor: [255,20,147]
            },
            directions: plainDirections
          })
      })
      }).catch(error => {
          console.log(error)
    })
  }
  
  confirmclick = () => {
    const interval = setInterval(this.setPosition, 3000)
    this.postLocations(this.state.markerstart.longitude, this.state.markerstart.latitude,
                       this.state.markerdest.longitude, this.state.markerdest.latitude,
                       this.state.markerstart.address, this.state.markerdest.address)
    this.setState({
      confirmshow: false,
      haveDestination: true,
      linelayerstuff: {
        id: 'GeoJsonLayer', 
        data: {
          "type": "LineString",
          "coordinates": this.state.linelayerstuff.data.coordinates
        },
        getLineWidth: this.state.linelayerstuff.getLineWidth,
        getLineColor: [255,20,147]
      },
      intervalNum: interval
    })
  }

  endrouteclick = () => {
    const success = (position) => {
      fetch("https://api.mapbox.com/geocoding/v5/mapbox.places/"+ position.coords.longitude + "," + position.coords.latitude + ".json?access_token=" + KEY)
      .then(this.handleErrors)
      .then(response => {
        response.json().then(data => {
          this.setState({
            viewport: {
              width: vwidth,
              height: vheight,
              latitude: position.coords.latitude,
              longitude: position.coords.longitude,
              zoom: 17,
              pitch: 0,
              bearing: 0
            },
            marker: {
              latitude: position.coords.latitude,
              longitude: position.coords.longitude,
            },
            markerstart: {
              latitude: position.coords.latitude,
              longitude: position.coords.longitude,
              address: data.features[0].place_name
            },
    
            haveUsersLocation: true
          })
      })
      }).catch(error => {
          console.log(error)
      })
    }
    const error = (err) => {
      console.log(err)
    }
    const options = {
      enableHighAccuracy: true
    }
    navigator.geolocation.getCurrentPosition(success, error, options) 
    clearInterval(this.state.intervalNum)
  }

  goToCurrentLocation = () => {
    this.setState({
      viewport: {
        width: vwidth,
        height: vheight,
        latitude: this.state.markerstart.latitude,
        longitude: this.state.markerstart.longitude,
        zoom: 17,
        pitch: 0,
        bearing: 0,
        transitionDuration: 1700
      }
    })
  }

  render() {
    const auth = this.props.auth
        
    return (
      <div className="mapContainer">

        {/* <Link to={"/driver"}>
              <p className="link">Driver side</p>
        </Link> */}

        <div>
          <MapGL
              ref={this.mapRef} 
              {...this.state.viewport}
              mapboxApiAccessToken={KEY}
              mapStyle="mapbox://styles/mapbox/streets-v10"
              onViewportChange={(viewport) => {
                this.setState({viewport})}}
          >

            <DeckGL
                {...this.state.viewport}
                layers={[
                  new GeoJsonLayer(this.state.linelayerstuff)
                ]}
            />

            {/* CURRENT LOCATION ALWAYS AND START ICON AFTER ACCEPT */}
            <Marker latitude={this.state.markerstart.latitude} longitude={this.state.markerstart.longitude} offsetLeft={-25} offsetTop={-20}>
              <Icon auth={auth}/>
            </Marker>

            {/* DESTINATION BEFORE ACCEPT */}
            {this.state.confirmshow && 
              <Marker latitude={this.state.markerdest.latitude} longitude={this.state.markerdest.longitude} offsetLeft={-25} offsetTop={-10}>
                <img className = "driveimg" alt='' src ='https://pngimg.com/uploads/treasure_chest/treasure_chest_PNG154.png' />
              </Marker>
            } 

            {/* DESTINATION AFTER ACCEPT */}
            {this.state.haveDestination && 
              <Marker latitude={this.state.markerdest.latitude} longitude={this.state.markerdest.longitude} offsetLeft={-25} offsetTop={-10}>
                <img className = "driveimg" alt='' src ='https://pngimg.com/uploads/treasure_chest/treasure_chest_PNG154.png' />
              </Marker>
            }
            
            {!this.state.haveDestination && 
              <Geocoder
              mapRef={this.mapRef}
              containerRef={this.geocoderContainerRef}
              onViewportChange={this.handleGeocoderViewportChange}
              mapboxApiAccessToken={KEY}
              onResult={this.startFunction}
              placeholder="Pickup location"
            />}

            {!this.state.haveDestination && 
              <Geocoder
              mapRef={this.mapRef}
              containerRef={this.geocoderContainerRef}
              onViewportChange={this.handleGeocoderViewportChange}
              mapboxApiAccessToken={KEY}
              onResult={this.resultFunction}
              placeholder="Drop off destination"
            />}
          </MapGL>

          <div className="currentLocationContainer" onClick={this.goToCurrentLocation}>
            <i className="fas fa-location-arrow fa-2x fa-vc"></i>
          </div>

          <div className="overmap">
            {this.state.haveDestination && 
              <p className="directionp">
                Request Submitted! Waiting for driver.
              </p>
            }

            {this.state.confirmshow && 
              <button id="ConfirmBtn" onClick={this.confirmclick} className="confirmbtn">Go!</button>
            }
          </div>


        </div>
      </div>
    )
  }
}

export default MapUser