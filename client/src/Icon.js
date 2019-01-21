import React, { Component } from 'react'
import './CSS/icon.css'

class Icon extends Component {
    render() {
        return (
        <div>
            <img className="locationIcon" alt="current location" src="http://placehold.it/50x50/333/333"/>
        </div>
        )
    }
}

export default Icon