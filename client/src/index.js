import React from 'react';
import ReactDOM from 'react-dom';
import './CSS/index.css';
import App from './App';
import Auth from './Auth'

const auth = new Auth()

let state = {}
window.setState = (changes) => {
    state = Object.assign({}, state, changes)

    ReactDOM.render(<App {...state} />, document.getElementById('root'));
}

let initialState = {
    name: "Joe",
    auth
}

window.setState(initialState)