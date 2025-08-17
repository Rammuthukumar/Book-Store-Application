import axios from 'axios'

const url = "http://localhost:8080/";

export const verifyAccount = (otpRequest) => {
    return axios.post(`${url}verify-otp`, otpRequest)
}