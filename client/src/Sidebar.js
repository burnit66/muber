import React, { Component } from 'react'
//import axios from 'axios'
import './CSS/sidebar.css'

class Sidebar extends Component {

    // toggleNav() {
    //     document.getElementsByClassName("main-menu")[0].classList.toggle("openNav");
    //     document.getElementsByClassName("homeContainer")[0].classList.toggle("shiftRight");
    //   }

    render() {
      return (
        <div className="sidebarContainer">
            {/* <div className="navHamburger">
                <i onClick={this.toggleNav} className="fas fa-bars"></i>
            </div> */}
            <nav className="main-menu">
                <ul>
                    <li>
                        <a href="/home">
                            <i className="fa fa-home fa-2x"></i>
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
                            <i className="fa fa-credit-card fa-2x"></i>
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
                        <a href="/logout">
                            <i className="fa fa-power-off fa-2x"></i>
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