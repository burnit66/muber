import React from "react"
import DropIn from "braintree-web-drop-in-react"

class Braintree extends React.Component {
  instance

  state = {
    clientToken: null
  }

  async componentDidMount() {
    const response = await fetch("server/client_token")
    const clientToken = await response.json()

    this.setState({
      clientToken
    })
  }

  async buy() {
    const { nonce } = await this.instance.requestPaymentMethod()
    await fetch(`server/purchase/${nonce}`)
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
          {/* <button className="buyButton" onClick={this.buy.bind(this)}>Buy</button> */}
        </div>
      )
    }
  }
}

export default Braintree