import React, { Component } from 'react'
//import axios from 'axios'
import './CSS/whereto.css'
import CodeInput from 'react-native-confirmation-code-input'

  class MFA extends Component {
    constructor(props) {
      super(props);
      this.state = {
        code: ''
      }
    }

    handleInputChange = event => {
        const { name, value } = event.target
          this.setState({
          [name]: value
        })
      }

    handlerOnFulfill = code => console.log(code);

    render() {
      return (
        <div className="mfaContainer">
          <CodeInput onFulfill={this.handlerOnFulfill} />
        </div>
      )
    }
  }

  export default MFA