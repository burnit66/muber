import React, { Component } from 'react'
import FacebookLogin from 'react-facebook-login';
import './CSS/splash.css'

class Email extends Component {
    render() {
        return (
            <div className="emailContainer">
                <button className="emailButton" onClick={() => window.location.href = '/signup'}>Email</button>
            </div>
        )
    }
}

class Splash extends Component {
  responseFacebook(response) {
    console.log(response)
  }

  render() {
    return (
    <div className="splash-container">

<div id="status">
</div>

        <img className="logo" src={require('./assets/images/Isomaplogo@3x.png')} alt="logo" />

        <div className="title">
            Welcome to M<span className="colorU">ü</span>ber
        </div>

        <div className="slogan">
            <p>Your on demand friend with a truck</p>
        </div>

        <Email />

        <FacebookLogin
            appId="550339805465689"
            autoLoad={false}
            fields="name,email,picture"
            callback={this.responseFacebook}
            cssClass="fb-button"
            icon="fa-facebook"
        />

        <div className="existingContainer">
            <a href="/login" className="existingAccount">Login</a>
        </div>
    </div>
    )
  }
}

export default Splash;