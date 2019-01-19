import React, { Component } from 'react'
import './CSS/home.css'
import Sidebar from './Sidebar'
import WhereTo from './Whereto'
import BottomBar from './Bottombar'
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
          <BottomBar/>
        </div>
      )
    }
  }

  export default Home