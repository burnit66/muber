import React from 'react'
//import axios from 'axios'
import './CSS/sidebar.css'

const Sidebar = () => (
    <div className="sidebarContainer">
        <nav class="main-menu">
            <ul>
                <li>
                    <a href="/home">
                        <i class="fa fa-home fa-2x"></i>
                            <span class="nav-text">Home</span>
                    </a>

                </li>
                <li>
                    <a href="/history">
                    <i class="fas fa-history fa-2x"></i>
                            <span class="nav-text">Müber History</span>
                    </a>

                </li>
                <li>
                    <a href="/billing">
                        <i class="fa fa-credit-card fa-2x"></i>
                            <span class="nav-text">Billing Info</span>
                    </a>

                </li>
                <li>
                    <a href="/future-mubers">
                    <i class="fas fa-clock fa-2x"></i>
                            <span class="nav-text">Future Mübers</span>
                    </a>
                </li>
                <li>
                    <a href="/account">
                    <i class="fas fa-user-circle fa-2x"></i>
                            <span class="nav-text">Account Info</span>
                    </a>
                </li>
            </ul>

            <ul class="logout">
                <li>
                    <a href="/logout">
                        <i class="fa fa-power-off fa-2x"></i>
                            <span class="nav-text">Logout</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
)

export default Sidebar