import React, { Component } from 'react'
import './CSS/splash.css'

class Splash extends Component {
  responseFacebook(response) {
    console.log(response)
  }

  render() {
    return (
    <div className="splash-container">

        <div id="status">
        </div>

        <h1>Hello, {this.props.name}</h1>

        <img className="logo" src={require('./assets/images/Isomaplogo@3x.png')} alt="logo" />

        <div className="title">
            Welcome to M<span className="colorU">ü</span>ber
        </div>

        <div className="slogan">
            <p>Your on demand friend with a truck</p>
        </div>

        <div className="emailContainer">
            <button className="emailButton" onClick={this.props.auth.login}>Log In</button>
        </div>

    </div>
    )
  }
}

export default Splash;