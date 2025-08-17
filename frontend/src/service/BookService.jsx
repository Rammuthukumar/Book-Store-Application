import axiosInstance from "./axios/AxiosInstance";

export const getAllBooks = async () => {
    return await axiosInstance.get("/api/book");
}

export const searchByBook = async (bookName) => {
    return await axiosInstance.get(`/api/book?bookName=${bookName}`)
}

export const searchByAuthor = async (authorName) => {
    return await axiosInstance.get(`/api/book?authorName=${authorName}`)
}

export const notifyUser = async (id,request) => {
    return await axiosInstance.post(`api/${id}/notify-me`,request);
}