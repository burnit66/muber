import React, { Component}  from 'react'
import MapGL, { Marker } from 'react-map-gl'
import Geocoder from 'react-map-gl-geocoder'
import DeckGL, { GeoJsonLayer } from 'deck.gl'
import { Link } from "react-router-dom";
import WebMercatorViewport from 'viewport-mercator-project'
import Icon from './Icon'
import './CSS/map.css'
import './CSS/currentlocation.css'
import './CSS/whereto.css'
import { runInThisContext } from 'vm';

const vheight = window.innerHeight
const vwidth = window.innerWidth
const KEY = ""

class MapDriver extends Component {
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
    },
    marker: {
      latitude: 41.4993,
      longitude: -81.6994,
    },
    markerdest: {
      latitude: 0,
      longitude:0 
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
    intervalNum: 0,
    userrequests: [{id: 0, longitude: 0, latitude: 0, longitude: 0, latitude: 0, pickup: "", dropoff: ""}],
  };

  mapRef = React.createRef()
  geocoderContainerRef= React.createRef()
  
  componentDidMount() {
    this.callApi()
      .then(response => {
        this.setState({
          userrequests: response.locations
        })
        console.log(this.state.userrequests)
    })
    const success = (position) => {
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

  callApi = async () => {
    const response = await fetch('/api/locations');
    const body = await response.json();
    if (response.status !== 200) throw Error(body.message);
    return body;
  };

  postLocations = async (long, lat) => {
    const response = await fetch('/api/locations', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ longitude: long, latitude: lat })
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
  
  confirmclick = () => {
    const interval = setInterval(this.setPosition, 3000)
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
    this.postLocations(this.state.markerstart.longitude, this.state.markerstart.latitude)
    this.postLocations(this.state.markerdest.longitude, this.state.markerdest.latitude)
  }

  endrouteclick = () => {
    const success = (position) => {
      this.setState({
        viewport: {
          width: vwidth,
          height: vheight,
          latitude: position.coords.latitude,
          longitude: position.coords.longitude,
          zoom: 14,
          pitch: 0,
          bearing: 0,
          transitionDuration: 1700
        },
        marker: {
          latitude: position.coords.latitude,
          longitude: position.coords.longitude,
        },
        markerstart: {
          latitude: position.coords.latitude,
          longitude: position.coords.longitude,
        },
        linelayerstuff: {
          id: 'GeoJsonLayer', 
          data: {
            "type": "LineString",
            "coordinates": [[0,0], [0,0]]
          },
          getLineWidth: 0,
          getLineColor: [255,20,147]
        },
        haveUsersLocation: true,
        haveDestination: false, 
        selectVal: ""
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
  handleChange = (event) => {
    const lonp = this.state.userrequests[event.target.value].lonp
    const latp = this.state.userrequests[event.target.value].latp
    const lond = this.state.userrequests[event.target.value].lond
    const latd = this.state.userrequests[event.target.value].latd

    const directions = [[lonp, latp]]
    const plainDirections = []
    fetch('https://api.mapbox.com/directions/v5/mapbox/driving/' + lonp + ',' + latp + ';' + lond + ',' + latd + '?steps=true&geometries=geojson&access_token=' + KEY)
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
          const newViewport = viewport.fitBounds([[lonp, latp], [lond, latd]], {
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
              latitude: latd,
              longitude: lond
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
  };

  render() {
    const auth = this.props.auth               
    return (
      <div className="mapContainer">
        <Link to={"/home"}>
            <p className="link">User side</p>
        </Link>
        <select className="userlist" onChange={this.handleChange}>
            <option value="-1">User Requests</option>
            {this.state.userrequests.map((x, i) => (
              <option className="options" value={i} key={x.id}>ID: {x.id} PICKUP: {x.pickup} DROPOFF: {x.dropoff}</option>
            ))}
        </select>
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

            {/* STARTING ICON AFTER ACCEPT DISAPPEARS AFTER ACCEPT */}
            {this.state.confirmshow && 
              <Marker latitude={this.state.markerstart.latitude} longitude={this.state.markerstart.longitude} offsetLeft={-25} offsetTop={-20}>
                <img className = "treasureimg" alt='' src ='http://placehold.it/20x20/000/000' />
              </Marker>
            }

            {/* DESTINATION BEFORE ACCEPT */}
            {this.state.confirmshow && 
              <Marker latitude={this.state.markerdest.latitude} longitude={this.state.markerdest.longitude} offsetLeft={-25} offsetTop={-10}>
                <img className = "treasureimg" alt='' src ='http://placehold.it/20x20/b4da55/b4da55' />
              </Marker>
            } 

            {/* DESTINATION AFTER ACCEPT */}
            {this.state.haveDestination && 
              <Marker latitude={this.state.markerdest.latitude} longitude={this.state.markerdest.longitude} offsetLeft={-25} offsetTop={-10}>
                <img className = "truckimg" alt='' src ='https://i.imgur.com/3dgA0sR.png' />
              </Marker>
            }
          </MapGL>

          <div className="currentLocationContainer" onClick={this.goToCurrentLocation}>
            <i className="fas fa-location-arrow fa-2x fa-vc"></i>
          </div>
        </div>
      </div>
    )
  }
}

export default MapDriver