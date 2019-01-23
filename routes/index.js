const connection = require('../config/connection')

module.exports = function(app) {
    app.get('/api/locations', (req, res) => {
        connection.query('SELECT * FROM locations', function(err, data) {
            err?res.send(err):res.json({locations: data})
        })
    })

    app.post('/api/locations', (req, res) => {
        connection.query("INSERT INTO locations (lonp, latp, lond, latd, pickup, dropoff) VALUES (?, ?, ?, ?, ?, ?)",
         [req.body.lonp, req.body.latp, req.body.lond, req.body.latd, req.body.pickup, req.body.dropoff], 
         function(err, data) {
          if(err) {
              console.log(err)
          }else {
              console.log("Post Successful")
          }
        });
    });

    app.delete('/api/locations', (req, res) => {
      connection.query("TRUNCATE TABLE locations", function(err, data) {
        if(err) {
            console.log(err)
        }else {
            console.log("Post Successful")
        }
      });
  });
}