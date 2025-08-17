import axios from 'axios'

const url = "http://localhost:8080/user/";

export const login = (credentials) => {
    return axios.post(`${url}login`, credentials)
}

export const register = (userData) => {
    console.log(userData);
    return axios.post(`${url}register`, userData)
}