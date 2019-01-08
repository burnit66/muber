import React, { Component } from 'react'
import './CSS/App.css'
// import LoginContainer from './Register'
import Splash from './Splash'

class App extends Component {
  render() {
    return (
      <div className="App">
        <Splash/>
        {/* <LoginContainer/> */}
      </div>
    );
  }
}

export default App;