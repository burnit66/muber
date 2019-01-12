import React, {Component} from 'react'
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";

import NoMatch from "./404";
import SignupContainer from './Register'
import Splash from './Splash'
import Login from './Login'
import Home from './Home'
import MFA from './MFA'
import Billing from './Billing'
import Terms from './Terms'
import Callback from './Callback'

class App extends Component {
  render() {
    return (
      <Router>
        <div>
          {/* <h1>Hello, {this.props.name}</h1> */}
          <Switch>
            <Route exact path="/" render={(props) => <Splash {...this.props} />} />
            <Route exact path="/signup" component={SignupContainer} />
            <Route exact path='/callback' component={Callback} />
            <Route exact path="/mfa" component={MFA} />
            <Route exact path="/billing" component={Billing} />
            <Route exact path="/terms" component={Terms} />
            <Route exact path="/login" component={Login} />
            <Route exact path="/home" component={Home} />
            {/* <Route exact path="/books/:id" component={Detail} /> */}
            <Route component={NoMatch} />
          </Switch>
        </div>
      </Router>
    )
  }
}

export default App;