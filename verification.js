require('dotenv').config()

const accountSid = process.env.ACCOUNT_SID
const authToken = process.env.AUTH_TOKEN
const client = require('twilio')(accountSid, authToken)
const twilioNumber = '+14405717695'
const clientNumber = '+14402898769'

const generateCode = () => {
  return Math.floor(1000 + Math.random() * 9000)
}

const clientCode = generateCode()

client.messages
  .create({
     body: '\nYour Müber code is: ' + clientCode,
     from: twilioNumber,
     to: clientNumber
   })
  .then(message => console.log(message.sid))
  .done()