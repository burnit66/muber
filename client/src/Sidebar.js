import React, { Component } from 'react'
//import axios from 'axios'
import './CSS/sidebar.css'
const FBAPI = window.logOutFB;

class Sidebar extends Component {

    render() {
      return (
        <div className="sidebarContainer">
            <nav className="main-menu">

                <div class="profile-pic-container">
                    <a href="/profile">
                        <img class="profile-pic" src="https://s3.amazonaws.com/uifaces/faces/twitter/nuraika/128.jpg" alt="" />
                        <div class="rating-container"><span className="rating"><i class="fas fa-star"></i>4.5</span></div>
                    </a>
                </div>

                <ul>
                    <li>
                        <a href="/home">
                            <i className="fas fa-home fa-2x"></i>
                                <span className="nav-text">Home</span>
                        </a>
                    </li>
                    <li>
                        <a href="/history">
                        <i className="fas fa-history fa-2x"></i>
                                <span className="nav-text">Müber History</span>
                        </a>

                    </li>
                    <li>
                        <a href="/billing">
                            <i className="fas fa-credit-card fa-2x"></i>
                                <span className="nav-text">Billing Info</span>
                        </a>

                    </li>
                    <li>
                        <a href="/future-mubers">
                        <i className="fas fa-clock fa-2x"></i>
                                <span className="nav-text">Future Mübers</span>
                        </a>
                    </li>
                    <li>
                        <a href="/account">
                        <i className="fas fa-user-circle fa-2x"></i>
                                <span className="nav-text">Account Info</span>
                        </a>
                    </li>
                </ul>

                <ul className="logout">
                    <li>
                        <a>
                            <i className="fas fa-power-off fa-2x" onClick={ FBAPI }></i>
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