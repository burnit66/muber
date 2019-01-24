import Auth0Lock from 'auth0-lock';

import { AUTH_CONFIG } from './auth0-variables';
import history from '../history';

export default class Auth {
  accessToken;
  idToken;
  expiresAt;
  userProfile;

  lock = new Auth0Lock(AUTH_CONFIG.clientId, AUTH_CONFIG.domain, {
    autoclose: true,
    auth: {
      redirectUrl: AUTH_CONFIG.callbackUrl,
      responseType: 'token id_token',
      params: {
        scope: 'openid profile name picture email'
      }
    },
    theme: {
      logo: 'https://i.imgur.com/3dgA0sR.png',
      primaryColor: '#e9168c'
    },
    languageDictionary: {
      emailInputPlaceholder: "something@youremail.com",
      title: "Müber"
    }
  })

  constructor() {
    this.handleAuthentication()
    // binds functions to keep this context
    this.login = this.login.bind(this);
    this.logout = this.logout.bind(this);
    this.handleAuthentication = this.handleAuthentication.bind(this);
    this.isAuthenticated = this.isAuthenticated.bind(this);
    this.getAccessToken = this.getAccessToken.bind(this);
    this.getIdToken = this.getIdToken.bind(this);
    this.getProfile = this.getProfile.bind(this);
  }

  getAccessToken() {
    return this.accessToken
  }

  getIdToken() {
    return this.idToken;
  }

  login() {
    // Call the show method to display the widget.
    this.lock.show()
  }

  handleAuthentication() {
    // Add a callback for Lock's `authenticated` event
    this.lock.on('authenticated', this.setSession.bind(this))
    // Add a callback for Lock's `authorization_error` event
    this.lock.on('authorization_error', (err) => {
      console.log(err)
      alert(`Error: ${err.error}. Check the console for further details.`)
      history.replace('/home')
    })
  }

  setSession(authResult) {
    if (authResult && authResult.accessToken && authResult.idToken) {
      // Set the time that the access token will expire at
      let expiresAt = JSON.stringify((authResult.expiresIn * 1000) + new Date().getTime())
      localStorage.setItem('isLoggedIn', 'true');
      localStorage.setItem('access_token', authResult.accessToken)
      localStorage.setItem('id_token', authResult.idToken)
      localStorage.setItem('expires_at', expiresAt)
      this.accessToken = authResult.accessToken;
      this.idToken = authResult.idToken;
      this.expiresAt = expiresAt;
      // navigate to the home route
      history.replace('/home')
    }
  }

  getProfile(cb) {
    this.lock.getUserInfo(localStorage.getItem('access_token'), (error, profile) => {
      if (profile) {
        console.log("Hello " + profile.name);
      }
      localStorage.setItem("profile", JSON.stringify(profile))
      cb(error, profile)
    })
  }


  logout() {
    // Remove tokens and expiry time
    this.accessToken = null;
    this.idToken = null;
    this.expiresAt = 0;

    // Remove user profile
    this.userProfile = null;

    // Remove isLoggedIn flag from localStorage
    localStorage.removeItem('isLoggedIn');

    // Clear access token and ID token from local storage
    localStorage.removeItem('access_token')
    localStorage.removeItem('id_token')
    localStorage.removeItem('expires_at')
    // navigate to the home route
    history.replace('/')
  }

  isAuthenticated() {
    // Check whether the current time is past the 
    // access token's expiry time
    let expiresAt = JSON.parse(localStorage.getItem('expires_at'))
    return new Date().getTime() < expiresAt
  }
}