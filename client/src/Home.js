import React, { Component } from 'react'
//import axios from 'axios'
import './CSS/home.css'
import Sidebar from './Sidebar'
import WhereTo from './Whereto'
import BottomBar from './Bottombar'
import CurrentLocation from './CurrentLocation'
import Map from './Map'

  class Home extends Component {
    constructor(props) {
      super(props);
      this.state = {
        home: true,
        login: true
      }
    }

    render() {
      return (
        <div className="homeContainer">
          <WhereTo/>
          <Sidebar/>
          <Map/>
          <CurrentLocation/>
          <BottomBar/>
        </div>
      )
    }
  }

  export default Home