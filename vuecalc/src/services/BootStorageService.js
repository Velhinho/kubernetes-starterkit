import axios from 'axios'


export default {
    getOperations () {
        const url = `http://${process.env.VUE_APP_bootstorage}/api/bootstorage/operations`;
        return axios.get(url);
    }
}