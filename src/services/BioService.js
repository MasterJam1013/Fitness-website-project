import axios from 'axios';



export default {
    listBio() {
        return axios.get(`/trainerbio`);
    }
}