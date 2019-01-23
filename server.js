const express = require("express");
const braintree = require("braintree");
const bodyParser = require("body-parser")
const PORT = process.env.PORT || 3001;
const app = express();
require('dotenv').config();
require("./routes")(app);

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));

app.use(function (req, res, next) {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');
  res.setHeader('Access-Control-Allow-Credentials', true);
  next();
  });

const gateway = braintree.connect({
  environment: braintree.Environment.Sandbox,
  merchantId: process.env.BRAINTREE_MERCHANTID,
  publicKey: process.env.BRAINTREE_PUBLICKEY,
  privateKey: process.env.BRAINTREE_PRIVATEKEY
});

app.get("/server/client_token", function (req, res) {
  gateway.clientToken.generate({}, function (err, response) {
    res.json(response.clientToken);
  });
});

app.post("/server/purchase/:nonce", function (req, res) {
  var nonceFromTheClient = req.body.payment_method_nonce;
  gateway.transaction.sale({
    amount: "10.00",
    paymentMethodNonce: nonceFromTheClient,
    options: {
      submitForSettlement: true
    }
  }, function (err, result) {
  });
});


// Define middleware here
app.use(express.urlencoded({ extended: true }));
app.use(express.json());
// Serve up static assets (usually on heroku)
if (process.env.NODE_ENV === "production") {
  app.use(express.static("client/build"));
}


app.listen(PORT, function() {
  console.log(`🌎 ==> Server now on port ${PORT}!`);
});