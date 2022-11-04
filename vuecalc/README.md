<h1 align="center">
  <br>
  Capstone Project - Vuecalc Service
  <br>
</h1>

This is a vue-cli 3.0 based Vue.js application which renders the calculator UI as shown below:

![Calculator UI](https://github.com/Velhinho/kubernetes-starterkit/blob/master/assets/img/vuecalc.png)


The service is composed of 'home', 'calculator' and 'history' views. It uses Axios library to do all the API calls. The 'history' view shows a list of recent operations done over the calculator application by fetching them from the 'Bootstorage' service.


## Project setup ##
Ansible is the one responsible for all the setup, running the commands on the vuecalc.sh script:
```
npm install
sudo npm run prod
```
-----