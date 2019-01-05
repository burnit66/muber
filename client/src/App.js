import React, { Component } from 'react';
import './CSS/App.css'
import LoginContainer from './Register'

class App extends Component {
  render() {
    return (
      <div className="App">
        <LoginContainer/>
      </div>
    );
  }
}

export default App;