/**
 * Head Quaters.
 */

module.exports = function(app, db) {

  app.get('/hq/version', function(req, res){
    var body = JSON.stringify({ version: app.VERSION });
    res.setHeader('Content-Type', 'application/json');
    res.setHeader('Content-Length', body.length);
    res.end(body);
  });

var cloudformation = new AWS.CloudFormation();
cloudformation.describeStackEvents(params, function (err, data) {
  if (err) {
      console.log(err); // an error occurred
        } else {
            console.log(data); // successful response
              }
              });

};
