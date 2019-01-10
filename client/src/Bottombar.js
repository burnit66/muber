import React, { Component } from 'react'
//import axios from 'axios'
import './CSS/bottombar.css'

  class BottomBar extends Component {
    constructor(props) {
      super(props);
      this.state = {
        expanded: false
      }
    }

    // handleInputChange = event => {
    //     const { name, value } = event.target
    //       this.setState({
    //       [name]: value
    //     })
    //   }

    render() {
      return (
        <div className="bottomContainer">
          <p>&nbsp;</p>
        </div>
      )
    }
  }

  export default BottomBar