import React from "react"
import DropIn from "braintree-web-drop-in-react"

class Store extends React.Component {
  instance

  state = {
    clientToken: null
  }

  async componentDidMount() {
    // Get a client token for authorization from your server
    const response = await fetch("http://localhost:3001/server/client_token")
    console.log(response)
    const clientToken = await response.json() // If returned as JSON string
    console.log(clientToken)

    this.setState({
      clientToken
    })
  }

  async buy() {
    // Send the nonce to your server
    const { nonce } = await this.instance.requestPaymentMethod()
    await fetch(`http://localhost:3001/server/purchase/${nonce}`)
  }

  render() {
    if (!this.state.clientToken) {
      return (
        <div>
          <h1>Loading...</h1>
        </div>
      )
    } else {
      return (
        <div>
          <DropIn
            options={{ authorization: this.state.clientToken }}
            onInstance={instance => (this.instance = instance)}
          />
          <button onClick={this.buy.bind(this)}>Buy</button>
        </div>
      )
    }
  }
}

export default Store