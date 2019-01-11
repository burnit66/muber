import React from 'react'
import './CSS/terms.css'

const handleSubmit = () => {
    window.location.href = '/home'
}

const Terms = () => (
  <div className="termsContainer">
    <div className="title">
        Terms of Use
    </div>
    <div className="termHeader">
        Who May Use the Services
    </div>
    <div>
        <p className="termText">When one door of happiness closes, another opens, but often we look so long at the closed door that we do not see the one that has been opened for us.</p>
        <ul className="termText">
            <li><span className="termBold">Step 1:</span> You may use the Services only if you agree to form a binding contract with us and are not a person barred from receiving services under the laws of the applicable jurisdiction.</li>
            <li><span className="termBold">Step 2:</span> Our Privacy Policy describes how we handle the information you provide to us when you use our Services.</li>
        </ul>
    </div>
    <div className="termHeader">
        Privacy
    </div>
    <p className="termText">When one door of happiness closes, another opens, but often we look so long at the closed door that we do not see the one that has been opened for us.</p>

    <button className="termButton" onClick={() => {handleSubmit()}}>Continue &amp; Agree</button>
  </div>
);

export default Terms;