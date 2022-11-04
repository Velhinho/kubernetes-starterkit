<h1 align="center">
  <br>
  Capstone Project
  <br>
</h1>

<h4 align="center">A minimal Microservices based calculator application based over <a href="https://github.com/khandelwal-arpit/kubernetes-starterkit" target="_blank">Kubernetes Starterkit Project</a>.</h4>

* Include a brief description of the application and of the solution and its components, configuration, implementation options, tools used, etc.



## Micro-services ##

* *Vuecalc* service
* *Happy* service
* *Expressed* service
* *Bootstorage* service

### Vuecalc ###
A vue-cli 3.0 based Vue.js application which renders the calculator UI.

The service is composed of 'home', 'calculator' and 'history' views. It uses Axios library to do all the API calls. The 'history' view shows a list of recent operations done over the calculator application by fetching them from the 'Bootstorage' service.

### Expressed ###
It is an Express.js based web application serving basic APIs for addition and subtraction. 

The _Vuecalc_ service calls the apis from this service when it has to do an add or subtract operation, once the operation is complete the _Bootstorage_ service stores the last performed operation in the database.

### Happy ###
It is a Hapi.js (v17.8.x) based application having two basic APIs for multiplication and division.

It also uses the 'Bootstorage' service to store the last executed operation.

### Bootstorage ###
aaaaaaa


## Infrastructure ##

The infrastructure consists of a Google Cloud VM for each micro-service.
* *Vue*
* *Happy*
* *Expressed*
* *Bootstorage*

### Deployment ###
The infrastructure is deployed by Terraform and managed by Ansible. For deployment refer to [readme.md](https://github.com/khandelwal-arpit/kubernetes-starterkit/blob/master/happy/readme.md) at the infrastructure folder.

