import React, { Component } from 'react'
//import axios from 'axios'
import './CSS/form.css'

  class Login extends Component {
    constructor(props) {
      super(props);
      this.state = {
        eMail: '',
        password: ''
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
        this.state.eMail.length > 0 &&
        this.state.password.length > 0
        ) {

          alert(`Hello ${this.state.eMail} your password is ${this.state.password}`);
          
          this.setState({
            eMail: '',
            password: '',
          })
        } else {
          alert('Invalid form submission')
        }
    }

    render() {
      return (
        <div className="login-container">
          <div className="title">
           Log In
          </div>

          <div className="input-container">
            <input className="input-field" value={this.state.eMail} onChange={this.handleInputChange} type="email" placeholder="eMail" name="eMail" />
            <input className="input-field" value={this.state.password} onChange={this.handleInputChange} type="password" placeholder="Password" name="password" />
          </div>

          <button id="loginButton" onClick={this.handleFormSubmit}>Next</button>

        </div>
      )
    }
  }

  export default Login