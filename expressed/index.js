'use strict';

const Hapi = require('hapi');
const request = require('request');
require('dotenv').config();

const server = Hapi.server({
    port: 80,
    routes: { cors: { origin: ['*'] } },
    host: '0.0.0.0'
});

server.route({
    method: 'GET',
    path: '/api/express/',
    handler: (request, h) => {
        return 'Hey folks, I am EXPRESS!';
    }
});

server.route({
    method: 'GET',
    path: '/api/express/{name}',
    handler: (request, h) => {
        return 'Hello, ' + encodeURIComponent(request.params.name) + '!';
    }
});

server.route({  
  method: 'GET',
  path: '/api/express/add',
  handler: (request, h) => {
    const params = request.query
    const result = parseFloat(params.num1) + parseFloat(params.num2);
    postToBootStorage(params.num1, params.num2, '+',result);
    return result;
  }
});

server.route({  
  method: 'GET',
  path: '/api/express/subtract',
  handler: (request, h) => {
    const params = request.query
    const result = params.num1 - params.num2;
    postToBootStorage(params.num1, params.num2, '-',result);
    return result;
  }
});

server.route({
    method: 'GET',
    path: '/api/express/healthz',
    handler: (request, h) => {
        return 'I am healthy!';
    }
});

/*
  Method to send post request to Srping Boot microservice
*/
function postToBootStorage(num1, num2, operation, result){
  var data = {
        "num1": num1,
        "num2": num2,
        "op": operation,
        "result": result
         };
  
  request({
      url: `http://${process.env.VUE_APP_bootstorage}/api/bootstorage/create`,
      method: "POST",
      json: true,
      body: data
  }, function (error, response, body){
    console.log("Received response from Spring Boot service 'bootstorage'");
      //console.log("response = " + JSON.stringify(response));
      if(error){
        console.log("error = " + error);
      }
      if(process.env.LOG_LEVEL == 'DEBUG'){
        console.log("body = " + JSON.stringify(body));
      }
  });
};

server.events.on('response', function (request) {
    console.log(request.info.remoteAddress + ': ' + request.method.toUpperCase() + ' ' + request.url.path + ' --> ' + request.response.statusCode);
});

const init = async () => {
    await server.start();
    console.log(`Server running at: ${server.info.uri}`);
};

process.on('unhandledRejection', (err) => {
    console.log(err);
    process.exit(1);
});

init();