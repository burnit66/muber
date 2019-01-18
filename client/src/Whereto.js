import React, { Component } from 'react'
import './CSS/whereto.css'

  class WhereTo extends Component {
    constructor(props) {
      super(props)
      this.state = {
        locationFrom: '',
        locationTo: ''
      }
    }

    handleInputChange = event => {
        const { name, value } = event.target
          this.setState({
          [name]: value
        })
      }
    
      handleFormSubmit = event => {
        event.preventDefault()
        if (
          this.state.locationTo.length > 0 &&
          this.state.locationFrom.length > 0
          ) {
  
            alert(`You are headed from ${this.state.locationFrom} to ${this.state.locationTo}`);
            
            this.setState({
              locationFrom: '',
              locationTo: ''
            })
          } else {
            alert('Invalid form submission')
          }
      }

      handleKeyPress = (e) => {
        if (e.key === 'Enter') {
            this.handleFormSubmit(e)
        }
      }

      toggleNav() {
        document.getElementsByClassName("main-menu")[0].classList.toggle("openNav")
        document.getElementsByClassName("homeContainer")[0].classList.toggle("shiftRight")
      }

      toggleSearch() {
        document.getElementsByClassName("navContainer")[0].classList.toggle("openSearch")
        document.getElementById("expand").classList.add("openBottom")
        document.getElementById("thing").classList.add("rotate")
        document.getElementById("containers").classList.add("display")
      }

    render() {
      return (
        <div className="whereTo">

          <div className="navHamburger" onClick={this.toggleNav}>
            <div className="toggle-icon">
              <span className="bar"></span>
              <span className="bar"></span>
              <span className="bar"></span>
            </div>
          </div>

          <div className="searchContainer" onClick={this.toggleSearch}>
            <i className="fas fa-search"></i>
          </div>

          {/* <div className="navContainer">
            <div className="side">
              <span className="internalImage1">&#9679;</span>
              <span className="internalImage2">&#9679;</span>
              <span className="internalImage2">&#9679;</span>
              <span className="internalImage2">&#9679;</span>
              <span className="internalImage2">&#9679;</span>
              <span className="internalImage1">&#9679;</span>
            </div>
            
            <div className="inputContainer">
              <label for="from">From</label>
              <input id="from" className="whereTo-field" value={this.state.locationFrom} onChange={this.handleInputChange} onKeyPress={this.handleKeyPress} type="text" placeholder="My Location" name="locationFrom" />
            
              <hr/>

              <label for="to">To</label>
              <input id="to" className="whereTo-field" value={this.state.locationTo} onChange={this.handleInputChange} onKeyPress={this.handleKeyPress} type="text" placeholder="My Home" name="locationTo" />
            </div>
          </div> */}

        </div>
      )
    }
  }

  export default WhereTo