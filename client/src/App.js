import React from 'react'
import { BrowserRouter as Redirect, Router, Route, Switch } from "react-router-dom"
import NoMatch from "./404"
// import SignupContainer from './Register'
import Splash from './Splash'
// import Login from './Login'
import Home from './Home'
import MFA from './MFA'
import Billing from './Billing'
import Terms from './Terms'

import Auth from './Auth/Auth'
import history from './history'
import Callback from './Callback/Callback'
import Profile from './Profile';
import Store from './Store'

const auth = new Auth()

const handleAuthentication = ({location}) => {
  if (/access_token|id_token|error/.test(location.hash)) {
    auth.handleAuthentication();
  }
}

const App = () => (
  <Router history={history} component={App}>
    <div>
      <Switch>
        <Route exact path="/" render={(props) => <Splash auth={auth} {...props} />} />
        
        <Route path="/callback" render={(props) => {
            handleAuthentication(props);
            return <Callback {...props} /> 
          }}/>
        
        {/* <Route exact path="/signup" component={SignupContainer} /> */}
        <Route exact path="/mfa" component={MFA} />
        <Route exact path="/billing" component={Billing} />
        <Route exact path="/terms" component={Terms} />
        <Route exact path="/store" component={Store} />

        <Route path="/profile" render={(props) => (
            !auth.isAuthenticated() ? (
              <Redirect to="/"/>
            ) : (
              <Profile auth={auth} {...props} />
            )
          )} />

        {/* <Route exact path="/login" component={Login} /> */}
        <Route exact path="/home" render={(props) => <Home auth={auth} {...props} />} />
        <Route component={NoMatch} />
      </Switch>
    </div>
  </Router>
)

export default App