import React, { Component } from 'react'
import './CSS/bottombar.css'
import Braintree from './Payment';

  class BottomBar extends Component {

    constructor(props) {
      super(props)
      this.state = this.props.map
    }

    componentDidMount() {
      var x = document.getElementsByClassName('bottomButtonTop')
      for (var i = 0; i < x.length; i++) {
          x[i].addEventListener("click", function(){
              
          var selectedEl = document.querySelector(".selectedTop");
          if(selectedEl){
              selectedEl.classList.remove("selectedTop");
          }
          this.classList.add("selectedTop");
              
          }, false);
      }

      var y = document.getElementsByClassName('bottomButtonBottom')
      for (var j = 0; j < y.length; j++) {
          y[j].addEventListener("click", function(){
              
          var selectedEl = document.querySelector(".selectedBottom");
          if(selectedEl){
              selectedEl.classList.remove("selectedBottom");
          }
          this.classList.add("selectedBottom");
              
          }, false);
      }
    }

    // document.getElementById('nextBtn').addEventListener('click', function(){
        //     var selectedElTop = document.querySelector(".selectedTop");
        //     var selectedElBottom = document.querySelector(".selectedBottom");
        //     if(selectedElTop && selectedElBottom)
      //         alert('working');
      //     else
      //         alert('please choose an option')
      // })

    toggleBottom = () => {
      document.getElementById("expand").classList.toggle("openBottom")
      document.getElementById("thing").classList.toggle("rotate")
      document.getElementById("containers1").classList.toggle("display")
      document.getElementById("containers2").classList.toggle("display")
    }

    longitude

    latitude

    pullLocation = async () => {
      const response = await fetch('api/locations')
      const body = await response.json()
      if (response.status !== 200) throw Error(body.message)
      this.longitude = body.locations.slice(-1).pop().longitude
      this.latitude = body.locations.slice(-1).pop().latitude
    }

    // TOGGLE THE GEOCODER SEARCH ONTO PAGE, VALIDATE SELECTION OPTIONS FROM FOOTER, ASYNC PULL COORDINATES FROM DB
    loadNext = () => {
      document.getElementsByClassName("mapboxgl-control-container")[0].classList.add("openSearch")
      // this.pullLocation()
      this.toggleBottom()
      alert(this.state.markerstart.address)
      alert(this.state.markerdest.address)
      console.log(this.state)
    }

    render() {
      return (
        <div id="expand" className="bottomContainer">
          <div className="outerContianer">

            <div className="opening" onClick={() => {this.toggleBottom()}}>
              <i id="thing" className="fas fa-angle-up fa-3x"></i>
              <div className="middle">
                <h3>Book a Müber</h3>
                <span>Select your details</span>
              </div>
            </div>

            <div className="loadOptions">
              <div id="containers1" className="bottomOuterContainer">
                <div className="bottomInnercontainer">
                  <div>
                    <button className="bottomButtonTop">
                      <i className="fas fa-truck-pickup"></i>
                      Truck Only
                    </button>
                  </div>
                  <div>
                    <button className="bottomButtonTop">
                      <i className="fas fa-truck-pickup"></i>
                      Truck with Help
                    </button>
                  </div>
                  <div>
                    <button className="bottomButtonTop">
                      <i className="fas fa-truck-pickup"></i>
                      Future Move
                    </button>
                  </div>
                </div>
              </div>

              <h3 className="loadHeading">Load Size:</h3>
              <div id="containers2" className="bottomOuterContainer">
                <div className="bottomInnercontainer">
                  <div>
                  <button className="bottomButtonBottom">
                      <span className="bold">Small</span>
                      <br/>
                      <span>Pickup Truck</span>
                    </button>
                  </div>
                  <div>
                    <button className="bottomButtonBottom">
                      <span className="bold">Medium</span>
                      <br/>
                      <span>Pickup Truck+</span>
                    </button>
                  </div>
                  <div>
                    <button className="bottomButtonBottom">
                      <span className="bold">Large</span>
                      <br/>
                      <span>Moving Truck</span>
                    </button>
                  </div>
                </div>
              </div>
              <button id="nextBtn" className="loadNext" onClick={this.loadNext}>Next</button>
            </div>

              {/* <Braintree/> */}

            </div>

          </div>
      )
    }
  }

  export default BottomBar