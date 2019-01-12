import React, { Component } from 'react'
import Auth from './Auth'

class Callback extends Component {
  
    componentDidMount() {
        const auth = new Auth()
        auth.handleAuthentication()
    }

  render() {
    return (
    <div className="callbackContainer">
        loading...
    </div>
    )
  }
}

export default Callback;