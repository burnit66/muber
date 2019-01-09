import React, { Component } from 'react'
//import axios from 'axios'
import './CSS/form.css'

  class SignupContainer extends Component {
    constructor(props) {
      super(props);
      this.state = {
        firstName: '',
        lastName: '',
        eMail: '',
        number: '',
        password: '',
        confirmPassword: ''
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
      if(
        this.state.firstName.length > 0 &&
        this.state.lastName.length > 0 &&
        this.state.eMail.length > 0 &&
        this.state.number.length > 0 &&
        this.state.password.length > 0 &&
        this.state.confirmPassword.length > 0 &&
        this.state.password === this.state.confirmPassword
        ) {

          alert(`Hello ${this.state.firstName} ${this.state.lastName}, your email is ${this.state.eMail}, phone number is ${this.state.number} and password is ${this.state.password}`);
          
          this.setState({
            firstName: '',
            lastName: '',
            eMail: '',
            number: '',
            password: '',
            confirmPassword: ''
          })
        } else {
          alert('Invalid form submission')
        }
    }

    render() {
      return (
        <div className="login-container">
          <div className="title">
           Sign Up
          </div>

          <div className="input-container">
            <input className="input-field" value={this.state.firstName} onChange={this.handleInputChange} type="text" placeholder="First Name" name="firstName" />
            <input className="input-field" value={this.state.lastName} onChange={this.handleInputChange} type="text" placeholder="Last Name" name="lastName" />
            <input className="input-field" value={this.state.eMail} onChange={this.handleInputChange} type="email" placeholder="eMail" name="eMail" />
            <input className="input-field" value={this.state.number} onChange={this.handleInputChange} type="phone" placeholder="Phone Number" name="number" />
            <input className="input-field" value={this.state.password} onChange={this.handleInputChange} type="password" placeholder="Password" name="password" />
            <input className="input-field" value={this.state.confirmPassword} onChange={this.handleInputChange} type="password" placeholder="Confirm Password" name="confirmPassword" />
          </div>

          <button id="loginButton" onClick={this.handleFormSubmit}>Next</button>

          <br/>

          <div className="existingContainer">
            <a href="/login" className="existingAccount">Already have an account?</a>
          </div>

          <div className="termsContainer">
            <p>By pressing "Next", you agree to Mübers <a href="/terms">Terms of use</a> and <a href="/privacy">Privacy Policy</a></p>
          </div>
        </div>
      )
    }
  }

  export default SignupContainer