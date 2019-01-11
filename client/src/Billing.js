import React, {Component} from 'react'
//import axios from 'axios'
import './CSS/billing.css'

class Billing extends Component {
    constructor() {
        super();
        this.state = {
            card: '',
            expires: '',
            name: '',
            cvc: ''
        }
        this.onChange = this.onChange.bind(this)
    }

    onChange(e) {
        const re = /^[0-9\b]+$/;
        if (e.target.value === '' || re.test(e.target.value)) {
            this.setState({
                card: e.target.value
            })
        }
    }

    handleInputChange = event => {
        const {
            name,
            value
        } = event.target
        this.setState({
            [name]: value
        })
    }

    previousPage() {
        window.location.href = '/mfa'
    }

    handleFormSubmit = event => {
        event.preventDefault()
        if (
            this.state.card.length > 0 &&
            this.state.expires.length > 0 &&
            this.state.name.length > 0 &&
            this.state.cvc.length > 0
        ) {

            alert(`Your billing info is: \n${this.state.card} \n${this.state.expires} \n${this.state.name} \n${this.state.cvc}`);

            this.setState({
                card: '',
                expires: '',
                name: '',
                cvc: ''
            })
            window.location.href = '/terms'
        } else {
            alert('Invalid form submission')
        }
    }

    numberGiven() {
        return '440-289-8769'
    }

    render() {
        return (
            <div className="billingContainer">
                <div className="title">
                    Billing Info
                </div>
                <div className="billingCodeContainer">
                    <p className="billingBlurb">Müber is a cashless service. Please enter your credit card info:</p>
                    <input className="longer billingCodeInput" value={this.state.card} onChange={this.onChange} type="text" placeholder="Card Number" name="card" />
                    <input className="billingCodeInput" value={this.state.expires} onChange={this.handleInputChange} type="text" placeholder="Expires" name="expires" />
                    <br/>
                    <input className="longer billingCodeInput" value={this.state.name} onChange={this.handleInputChange} type="text" placeholder="Name" name="name" />
                    <input className="billingCodeInput" value={this.state.cvc} onChange={this.handleInputChange} type="text" placeholder="CVC" maxlength="4" name="cvc" />
                    <br/>
                </div>
                <div className="billingButtonContainer">
                    <button className="billingPrev" onClick={this.previousPage}>Cancel</button>
                    <button className="billingNext" onClick={this.handleFormSubmit}>Join</button>
                </div>
            </div>
        )
    }
}

export default Billing