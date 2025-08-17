import axiosInstance from "./axios/AxiosInstance"

export const getUserOrders = () => {
    return axiosInstance.get("/order/user");
}

export const placeOrder = (data) => {
    return axiosInstance.post("/order",data)
}

export const updateOrder = (data) => {
    return axiosInstance.put("/order",data)
}

export const deleteOrder = (data) => {
    return axiosInstance.delete(`/order/${data}`)
}