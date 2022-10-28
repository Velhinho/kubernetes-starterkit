import axios from 'axios'


export default {
    getOperations () {
        const url = 'http://bootstorage/api/bootstorage';
        return axios.get(url);
    }
}