import React from 'react'
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";

import NoMatch from "./404";
import SignupContainer from './Register'
import Splash from './Splash'
import Login from './Login'
import Home from './Home'
import MFA from './MFA'

const App = () => (
  <Router>
    <div>
      <Switch>
        <Route exact path="/" component={Splash} />
        <Route exact path="/signup" component={SignupContainer} />
        <Route exact path="/mfa" component={MFA} />
        <Route exact path="/login" component={Login} />
        <Route exact path="/home" component={Home} />
        {/* <Route exact path="/books/:id" component={Detail} /> */}
        <Route component={NoMatch} />
      </Switch>
    </div>
  </Router>
);

export default App;