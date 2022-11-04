<h1 align="center">
  <br>
  Capstone Project - Bootstorage Service
  <br>
</h1>

The _Bootstorage_ is a simple Flask application that uses SQLite to store the operations made by _Happy_ and _Expressed_ services and to display past operations to _Vuecalc_ service.


## Project setup ##
Ansible is the one responsible for all the setup, running the commands on the bootstorage.sh script:
```
sudo flask run --host="0.0.0.0" -p 80
```
-----