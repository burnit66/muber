import React, { Component } from 'react'
import './CSS/home.css'
import Sidebar from './Sidebar'
import WhereTo from './Whereto'
import MapUser from './MapUser' 
import NoMatch from "./404"

class Home extends Component {
  constructor(props) {
    super(props);
    this.state = {
      home: true,
      login: true
    }
  }

  render() {
    const auth = this.props.auth
    const { isAuthenticated } = this.props.auth

    return (
      <div>
      {
        isAuthenticated() && (
          <div className="homeContainer">
            <WhereTo/>
            <Sidebar auth={auth}/>
            <MapUser auth={auth}/>
          </div>
        )
      }

      {
        !isAuthenticated() && (
          <div className="homeContainer">
            <NoMatch/>
          </div>
        )
      }
      </div>
    )
  }
}

export default Home