import React, { Component } from 'react'
import './CSS/bottombar.css'
import Braintree from './Payment';

class BottomBar extends Component {

  constructor(props) {
    super(props)
    this.state = this.props.map
  }

  service
  truckType

  componentDidMount() {
    const x = document.getElementsByClassName('bottomButtonTop')
    for (let i = 0; i < x.length; i++) {
        x[i].addEventListener("click", function(){
        const selectedEl = document.querySelector(".selectedTop")
        if (selectedEl){
            selectedEl.classList.remove("selectedTop")
        }
        this.classList.add("selectedTop")
        }, false)
    }

    const y = document.getElementsByClassName('bottomButtonBottom')
    for (let j = 0; j < y.length; j++) {
        y[j].addEventListener("click", function(){
        const selectedEl = document.querySelector(".selectedBottom")
        if (selectedEl){
            selectedEl.classList.remove("selectedBottom")
        }
        this.classList.add("selectedBottom")
        }, false)
    }

    document.getElementById('nextBtn').addEventListener('click', () => {
      this.service = document.querySelector(".selectedTop").attributes["data-truckservice"].value
      this.truckType = document.querySelector(".selectedBottom").attributes["data-trucktype"].value
      if (!(this.service && this.truckType)) {
        alert('please choose both options')
      }
    })
    this.props.onRef(this)
  }

  componentWillUnmount() {
    this.props.onRef(undefined)
  }

  toggleBottom = () => {
    document.getElementById("expand").classList.toggle("openBottom")
    document.getElementById("thing").classList.toggle("rotate")
    if (document.getElementById("containers1")) {
      document.getElementById("containers1").classList.toggle("display")
      document.getElementById("containers2").classList.toggle("display")
    }
  }

  formula = () => {
    //trip is in m needs to be mi
    const rawDist = this.props.map.markerdest.totalDistance
    const dist = rawDist * 0.00062137

    //time is in S needs to be min
    const rawTime = this.props.map.markerdest.totalTime
    const time = rawTime / 60

    //BASE COST BASED ON WHICH TRUCK TYPE
    let cap = 0

    //initial service
    let service = 0

    // IF BUTTON = HELP DOUBLE THE COST
    if (this.service === 'help') {
      service = 2
    } else {
      service = 1
    }

    if (this.truckType === 'moving') {
      cap = 45
    } else if (this.truckType === 'pickupPlus') {
      cap = 30
    } else {
      cap = 15
    }

    return (cap + (cap * service) + (.33 * time) + (.83 * dist)).toFixed(2)
  }


  // TOGGLE THE GEOCODER SEARCH ONTO PAGE, VALIDATE SELECTION OPTIONS FROM FOOTER, ASYNC PULL COORDINATES FROM DB
  loadNext = () => {
    document.getElementsByClassName("mapboxgl-control-container")[0].classList.add("openSearch")

    this.toggleBottom()

    const pickup = this.props.map.markerstart.address
    const dropoff = this.props.map.markerdest.address

    console.log(this.formula())

    if (pickup && dropoff) {
      document.getElementsByClassName("loadOptions")[0].classList.toggle("hide")
      document.getElementsByClassName("detailOptions")[0].classList.toggle("hide")

      document.getElementById("startAddress").innerHTML = pickup
      document.getElementById("endAddress").innerHTML = dropoff
      document.getElementById("loadSize").innerHTML = this.truckType
      document.getElementById("driverHelp").innerHTML = this.service
      const finalCost = this.formula()
      document.getElementById("totalCost").innerHTML = finalCost
    } 
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
                  <button className="bottomButtonTop" data-truckservice="truck">
                    <i className="fas fa-truck-pickup"></i>
                    Truck Only
                  </button>
                </div>
                <div>
                  <button className="bottomButtonTop" data-truckservice="help">
                    <i className="fas fa-truck-pickup"></i>
                    Truck with Help
                  </button>
                </div>
                <div>
                  <button className="bottomButtonTop">
                    <i className="fas fa-truck-pickup" data-truckservice="future"></i>
                    Future Move
                  </button>
                </div>
              </div>
            </div>

            <h3 className="loadHeading">Load Size:</h3>
            <div id="containers2" className="bottomOuterContainer">
              <div className="bottomInnercontainer">
                <div>
                <button className="bottomButtonBottom" data-trucktype="pickup">
                    <span className="bold">Small</span>
                    <br/>
                    <span>Pickup Truck</span>
                  </button>
                </div>
                <div>
                  <button className="bottomButtonBottom" data-trucktype="pickupPlus">
                    <span className="bold">Medium</span>
                    <br/>
                    <span>Pickup Truck+</span>
                  </button>
                </div>
                <div>
                  <button className="bottomButtonBottom" data-trucktype="moving">
                    <span className="bold">Large</span>
                    <br/>
                    <span>Moving Truck</span>
                  </button>
                </div>
              </div>
            </div>
            <button id="nextBtn" className="loadNext" onClick={this.loadNext}>Next</button>
          </div>

          <div className="detailOptions hide">
            <p className="detailsConfirm">Start Location: <span id="startAddress"></span></p>
            <p className="detailsConfirm">End Location: <span id="endAddress"></span></p>
            <p className="detailsConfirm">Load Size: <span id="loadSize"></span></p>
            <p className="detailsConfirm">Driver Help: <span id="driverHelp"></span></p>
            <hr className="pinkLine"/>
            <p className="detailsConfirm">ESTIMATED TOTAL: <span id="totalCost"></span></p>

            <Braintree/>

            <button id="nextBrain" className="loadNext" onClick={this.props.map.confirmclick}>Book my Müber</button>
          </div>

          </div>

        </div>
    )
  }
}

export default BottomBar