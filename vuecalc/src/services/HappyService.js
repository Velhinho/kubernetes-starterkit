import axios from 'axios'


export default {
    getMultiplicationResult (num1, num2) {
        const url = 'http://localhost:4000/api/happy';
        return axios.get(url + '/multiply?num1=' + num1 + '&num2=' + num2);
    },
    getDivisionResult (num1, num2) {
        const url = 'http://localhost:4000/api/happy';
        return axios.get(url + '/divide?num1=' + num1 + '&num2=' + num2);
    }
}