import React, { Component } from 'react'
import './CSS/App.css'
import SignupContainer from './Register'
//import Splash from './Splash'

class App extends Component {
  render() {
    return (
      <div className="App">
        {/* <Splash/> */}
        <SignupContainer/>
      </div>
    );
  }
}

export default App;