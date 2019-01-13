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

    toggleBottom () {
      document.getElementById("expand").classList[0].toggle("openBottom")      
      document.getElementById("thing").classList[0].toggle("rotate")
      document.getElementById("containers").classList[0].toggle("display")
      // console.log(document.getElementById("expand").classList[0])
    }
    

    // handleInputChange = event => {
    //     const { name, value } = event.target
    //       this.setState({
    //       [name]: value
    //     })
    //   }

    render() {
      return (
        <div id="expand" className="bottomContainer">
          <div className="outerContianer">

            <div className="opening" onClick={() => {this.toggleBottom()}}>
              <i id="thing" className="fa fa-angle-up fa-3x"></i>
              <div className="middle">
                <h3>Book a Muber</h3>
                <span>Friends with trucks</span>
              </div>
            </div>

            <div id="containers" className="bottomOuterContainer">
              <div className="bottomInnercontainer">
                <div>
                  <button className="bottomButton">Thing</button>
                </div>
                <div>
                  <button className="bottomButton">Thing</button>
                </div>
                <div>
                  <button className="bottomButton">Thing</button>
                </div>
                <div>
                  <button className="bottomButton">Thing</button>
                </div>
                <div>
                  <button className="bottomButton">Thing</button>
                </div>
                <div>
                  <button className="bottomButton">Thing</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      )
    }
  }

  export default BottomBar