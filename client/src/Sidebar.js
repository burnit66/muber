import React, { Component } from 'react'

import './CSS/sidebar.css'

class Sidebar extends Component {

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

    logout() {
        this.props.auth.logout()
    }

    render() {
      const { profile } = this.state;

      return (
        <div className="sidebarContainer">
            <nav className="main-menu">

                <div class="profile-pic-container">
                    <a onClick={() => window.location.href = '/profile'}>
                        <img class="profile-pic" src={profile.picture} alt="Profile Pic" />
                        <div class="rating-container"><span className="rating">4.5</span></div>
                    </a>
                </div>

                <ul>
                    <li>
                        <a onClick={() => window.location.href = '/home'}>
                            <i className="fas fa-home fa-2x"></i>
                                <span className="nav-text">Home</span>
                        </a>
                    </li>
                    <li>
                        <a onClick={() => window.location.href = '/history'}>
                            <i className="fas fa-history fa-2x"></i>
                            <span className="nav-text">Müber History</span>
                        </a>

                    </li>
                    <li>
                        <a onClick={() => window.location.href = '/billing'}>
                            <i className="fas fa-credit-card fa-2x"></i>
                            <span className="nav-text">Billing Info</span>
                        </a>

                    </li>
                    <li>
                        <a onClick={() => window.location.href = '/future-mubers'}>
                        <i className="fas fa-clock fa-2x"></i>
                        <span className="nav-text">Future Mübers</span>
                        </a>
                    </li>
                    <li>
                        <a onClick={() => window.location.href = '/profile'}>
                        <i className="fas fa-user-circle fa-2x"></i>
                        <span className="nav-text">Account Info</span>
                        </a>
                    </li>
                </ul>

                <ul className="logout">
                    <li>
                        <a onClick={this.logout.bind(this)}>
                            <i className="fas fa-power-off fa-2x"></i>
                            <span className="nav-text">Logout</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    )
    }
}

export default Sidebar