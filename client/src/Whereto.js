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

        </div>
      )
    }
  }

  export default WhereTo