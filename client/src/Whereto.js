import React, { Component } from 'react'
//import axios from 'axios'
import './CSS/whereto.css'

  class WhereTo extends Component {
    constructor(props) {
      super(props);
      this.state = {
        location: ''
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
          this.state.location.length > 0
          ) {
  
            alert(`You are headed to ${this.state.location}`);
            
            this.setState({
              location: ''
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
        document.getElementsByClassName("main-menu")[0].classList.toggle("openNav");
        document.getElementsByClassName("homeContainer")[0].classList.toggle("shiftRight");
      }

    render() {
      return (
        <div className="whereTo">
          <div className="navHamburger">
              <i onClick={this.toggleNav} className="fas fa-bars"></i>
          </div>
          <input className="whereTo-field" value={this.state.location} onChange={this.handleInputChange} onKeyPress={this.handleKeyPress} type="text" placeholder="Where to?" name="location" />
        </div>
      )
    }
  }

  export default WhereTo