Rem my objectif is to create a structure files of my new API nodejs 
Rem I will use Mongodb and express so I will install them 
Rem I want to know if my new server work so I will test it in a Chrome brower 
@echo off 
Rem select the name of my API
set /p InputChoices= Enter the name of your API  
echo folder: %InputChoices%
Rem folder create
mkdir %InputChoices%
cd %InputChoices%

Rem create Package.js
start /wait cmd cd %cd% /c npm init
echo End of the Package.json
type nul >server.js
mkdir api
cd api
mkdir controlers models routes

Rem create files 
type nul >controlers/%InputChoices%Controler.js 
type nul >models/%InputChoices%Model.js 
type nul >routes/%InputChoices%Routes.js
cd ..
start /wait cmd cd %cd% /c npm install express mongoose --save
echo End of the instalation express and mongoose

Rem write server.js
echo var express = require('express');>>server.js
echo var app = express();>>server.js
echo var port =3000>>server.js
echo app.get('/', function (req, res) {  res.send('Hello %InputChoices%!');  });>>server.js
echo app.listen(port);>>server.js
echo  console.log('todo list RESTful API server started on: ' + port);>>server.js

Rem Test if the server.js work 
start cmd cd %cd% /c npm run start 
start chrome http://localhost:3000
pause
