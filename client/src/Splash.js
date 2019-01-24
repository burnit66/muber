import React, { Component } from 'react'
import './CSS/splash.css'

class Splash extends Component {

    login() {
        this.props.auth.login()
    }

    render() {
    const { isAuthenticated } = this.props.auth;

    return (
        <div className="splash-container">

            <img className="logo" src={require('./assets/images/Isomaplogo@3x.png')} alt="logo" />

            <div className="title">
                Welcome to M<span className="colorU">ü</span>ber
            </div>

            <div className="slogan">
                <p>Your on demand friend with a truck</p>
            </div>

            <div className="emailContainer">
                    <button className="emailButton" onClick={this.login.bind(this)}>Log in / Sign up</button>
                </div>

            {
              isAuthenticated() && (
                window.location.href = "/home"
                )
            }

            <div className="termsSignupContainer">
                <p>By pressing "Next", you agree to Mübers <a href="/terms">Terms of use</a> and <a href="/terms">Privacy Policy</a></p>
            </div>

        </div>
    )
  }
}

export default Splash;