import React from 'react'
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";

import NoMatch from "./404";
import SignupContainer from './Register'
import Splash from './Splash'
import Login from './Login'

const App = () => (
  <Router>
    <div>
      <Switch>
        <Route exact path="/" component={Splash} />
        <Route exact path="/signup" component={SignupContainer} />
        <Route exact path="/login" component={Login} />
        {/* <Route exact path="/books/:id" component={Detail} /> */}
        <Route component={NoMatch} />
      </Switch>
    </div>
  </Router>
);

export default App;