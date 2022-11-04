import axios from 'axios'

const url = 'http://${process.env.VUE_APP_expressed}/api/express';

export default {
    getAdditionResult (num1, num2) {
        return axios.get(url + '/add?num1=' + num1 + '&num2=' + num2);
    },
    getSubtractionResult (num1, num2) {
        return axios.get(url + '/subtract?num1=' + num1 + '&num2=' + num2);
    }
}