import auth0 from 'auth0-js'

const LOGIN_SUCCESS_PAGE = '/home'
const LOGIN_FAILURE_PAGE = '/404'

export default class Auth {
    auth0 = new auth0.WebAuth({
        domain: "1muber.auth0.com",
        clientID: "ChesZrWBK4VPY02VsMcaH0eAB2lipTGJ",
        redirectUri: "http://localhost:3000/callback",
        audience: "https://1muber.auth0.com/userinfo",
        responseType: "token id_token",
        scope: "openid"
    })

    constructor() {
        this.login = this.login.bind(this)
    }

    login() {
        this.auth0.authorize()
    }

    handleAuthentication() {
        this.auth0.parseHash((err, authResults) => {
            if (authResults && authResults.accessToken && authResults.idToken) {
                let expiresAt = JSON.stringify((authResults.expiresIn) * 1000 + new Date().getTime())
                localStorage.setItem("access_token", authResults.accessToken)
                localStorage.setItem("id_token", authResults.idToken)
                localStorage.setItem("expires_at", expiresAt)
                window.location.hash = ''
                window.location.pathname = LOGIN_SUCCESS_PAGE
            } else if (err) {
                window.location.pathname = LOGIN_FAILURE_PAGE
                console.log(err)
            }
        })
    }

    isAuthenticated() {
        let expiresAt = JSON.parse(localStorage.getItem("expires_at"))
        return new Date().getTime() < expiresAt
    }
}