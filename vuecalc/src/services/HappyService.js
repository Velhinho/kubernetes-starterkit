import axios from 'axios'

const url = 'http://happy/api/happy';

export default {
    getMultiplicationResult (num1, num2) {
        return axios.get(url + '/multiply?num1=' + num1 + '&num2=' + num2);
    },
    getDivisionResult (num1, num2) {
        return axios.get(url + '/divide?num1=' + num1 + '&num2=' + num2);
    }
}