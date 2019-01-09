import React, { Component } from 'react'
//import axios from 'axios'
import './CSS/home.css'
import Sidebar from './Sidebar'

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
          <h1>Home</h1>
          <Sidebar/>
        </div>
      )
    }
  }

  export default Home