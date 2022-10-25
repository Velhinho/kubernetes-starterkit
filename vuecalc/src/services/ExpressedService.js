import axios from 'axios'


export default {
    getAdditionResult (num1, num2) {
        const url = 'http://localhost:3000/api/express';
        return axios.get(url + '/add?num1=' + num1 + '&num2=' + num2);
    },
    getSubtractionResult (num1, num2) {
        const url = 'http://localhost:3000/api/express';
        return axios.get(url + '/subtract?num1=' + num1 + '&num2=' + num2);
    }
}