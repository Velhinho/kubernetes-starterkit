import axios from 'axios'


export default {
    getOperations () {
        const url = 'http://localhost:5000/api/bootstorage';
        return axios.get(url);
    }
}