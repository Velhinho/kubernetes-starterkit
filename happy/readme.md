<h1 align="center">
  <br>
  Capstone Project - Happy Service
  <br>
</h1>

It is a Hapi.js (v17.8.x) based application having two basic APIs for multiplication and division.
The _Vuecalc_ service calls the apis from this service when it has to do an multiply or divide operation, once the operation is complete the _Bootstorage_ service stores the last performed operation in the database.


## Project setup ##
Ansible is the one responsible for all the setup, running the commands on the happy.sh script:
```
npm install
sudo npm run start
```
-----