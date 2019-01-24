import React, { Component } from 'react'
import './CSS/icon.css'

class Icon extends Component {
    
    componentWillMount() {
        this.setState({
            profile: {}
        })

        const { userProfile, getProfile } = this.props.auth;

        if (!userProfile) {
            getProfile((err, profile) => {
                this.setState({
                    profile
                })
            })
        } else {
            this.setState({
                profile: userProfile
            })
        }
    }

    render() {
        const { profile } = this.state;

        return (
        <div>
            <img className="locationIcon" alt="" src={profile.picture}/>
        </div>
        )
    }
}

export default Icon