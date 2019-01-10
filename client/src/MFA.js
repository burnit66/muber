import React, { Component } from 'react'
//import axios from 'axios'
import './CSS/mfa.css'

  class MFA extends Component {
    constructor(props) {
      super(props);
      this.state = {
        code: ''
      }
      this.onChange = this.onChange.bind(this)
    }

    onlyNum(event){
        const re = /^[0-9\b]+$/;
        if (event.target.value === '' || re.test(event.target.value)) {
           this.setState({value: event.target.value})
        }
     }

    handleInputChange(event) {
        const { name, value } = event.target
          this.setState({
          [name]: value
        })
      }

      onChange(e) {
        this.onlyNum(e)
        this.handleInputChange(e)
      }
    
      handleFormSubmit = event => {
        event.preventDefault()
        if (
          this.state.code.length > 0
          ) {
  
            alert(`Your code is ${this.state.code}`);
            
            this.setState({
              location: ''
            })
          } else {
            alert('Invalid form submission')
          }
      }

      numberGiven(){
          return '440-289-8769'
      }

    render() {
      return (
        <div className="mfaContainer">
            <div className="title">
                Enter Code
            </div>
            <p className="mfaBlurb">We sent a code to {this.numberGiven()}. Please enter it here:</p>
            <input className="mfaCodeInput" value={this.state.code} onChange={this.onChange} type="text" placeholder="Code sent to mobile" name="code" />
            <button className="mfaNext" onClick={this.handleFormSubmit}>Next</button>
        </div>
      )
    }
  }

  export default MFA