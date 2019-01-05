import React, { Component } from 'react'
//axios to communicate with express api
//import axios from 'axios'

class FormField extends Component {
    constructor(props) {
      super(props);
      this.state = {
        focused: false,
        value: ""
      }
    }
    focusField() {
      const { focused } = this.state;
      this.setState({
        focused: !focused
      })
    }
    handleChange(event) {
      const { target } = event
      const { value } = target
      this.setState({
        value: value
      })
    }
    render() {
      const { type, style, id, placeholder } = this.props
      const { focused, value } = this.state
      
      let inputClass = "fluid-input"
      if (focused) {
        inputClass += " fluid-input--focus"
      } else if (value !== "") {
        inputClass += " fluid-input--open"
      }
      
      return (
        <div className={inputClass} style={style}>
          <div className="form-container">
            <input 
              className="form-field"
              type={type}
              id={id}
              placeholder={placeholder}
              onFocus={this.focusField.bind(this)}
              onBlur={this.focusField.bind(this)}
              onChange={this.handleChange.bind(this)}
              autocomplete="off"
            />
            <label className="form-field-label" forHtml={id}></label>
          </div>
        </div>
      )
    }
  }
  

  class Button extends Component {

    handleSubmit(event) {
      alert("I was clicked");
    }

    render() {
      return (
        <div className={`button ${this.props.buttonClass}`} onClick={this.handleSubmit} >
          {this.props.buttonText}
        </div>
      )
    }
  }
  

  class LoginContainer extends Component {
    render() {
      const style = {
        margin: "15px 0"
      }
    
      return (
        <div className="login-container">
          <div className="title">
           Sign Up
          </div>
          <FormField type="text" placeholder="First Name" id="firstName" style={style} />
          <FormField type="text" placeholder="Last Name" id="lastName" style={style} />
          <FormField type="email" placeholder="eMail" id="email" style={style} />
          <FormField type="phone" placeholder="Phone Number" id="phone" style={style} />
          <FormField type="password" placeholder="Password" id="password" style={style} />
          <FormField type="password" placeholder="Verify Password" id="verifyPassword" style={style} />
          <Button buttonText="Next" buttonClass="login-button" />

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

  export default LoginContainer