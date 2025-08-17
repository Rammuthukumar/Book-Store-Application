import React, { useContext, useEffect, useState } from "react";

import "../style/AdminBookManager.css";
import axiosInstance from "../service/axios/AxiosInstance";
import { AuthContext } from "../context/AuthProvider";
import { useNavigate } from "react-router-dom";

const AdminBookManager = () => {
  const {user,logout} = useContext(AuthContext);
  const navigate = useNavigate();
  const [books, setBooks] = useState([]);
  const [editingBook, setEditingBook] = useState(null);
  const [sortField,setSortField] = useState("id");
  const [sortOrder,setSortOrder] = useState('asc');
  const [page,setPage] = useState(0);
  const [formData, setFormData] = useState({
    bookName: "",
    authorName: "",
    year: "",
    price: "",
    genre: "",
    publisher: "",
    language: "",
    publishedDate: "",
    pages: "",
    stock: "",
    category: ""
  });

  const fetchBooks = async (pageNum=0) => {
    try{
      const res = await axiosInstance.get(`/api/book?page=${pageNum}&size=5`);
      setBooks(res.data);
    }
    catch(err){
      if(err.response && err.response.status === 401)
          navigate("/login")
    }
    
  };

   const fetchSortedBooks = async (field,order) => {
    const res = await axiosInstance.get(`/api/book?sort=${field}&order=${order}`);
    setBooks(res.data);
  }


 useEffect(() => {
  if (!user || !user.roles) return;
  if (!user.roles[0].endsWith('ADMIN')) {
    navigate('/');
  }
   fetchBooks();
}, [user]);

  const handleInputChange = (e) => {
    setFormData((prev) => ({
      ...prev,
      [e.target.name]: e.target.value,
    }));
  };

  const handleSubmit = async (e) => {
    const transformedData = {
      authorName: formData.authorName,
      bookName: formData.bookName,
      genre: formData.genre,
      language: formData.language,
      pages: parseInt(formData.pages, 10),     // convert string to number
      price: parseInt(formData.price, 10),
      publishedDate: formData.publishedDate,
      stock: parseInt(formData.stock, 10),
      year: parseInt(formData.year, 10),
      publisherDTO: {
        publisherName: formData.publisher
      },
      categoriesDTO: [
        {
          categoryName: formData.category // or you can add another input field for category
        }
      ]
    };
    console.log(transformedData);
    e.preventDefault();
    try {
      if (editingBook) {
        const response = await axiosInstance.put(`/api/book/${editingBook.id}`, transformedData);
        console.log(response);
      } else {
        const response = await axiosInstance.post("/api/book", transformedData);
        console.log(response);
      }
      setFormData({
        bookName: "",
        authorName: "",
        year: "",
        price: "",
        genre: "",
        publisher: "",
        language: "",
        publishedDate: "",
        pages: "",
        stock: "",
        category:""
      });
      setEditingBook(null);
      fetchBooks();
    } catch (err) {
      console.log(err);
    }
  };

  const handleEdit = (book) => {
    console.log(book);
    setEditingBook(book);
    setFormData({
      bookName: book.bookName,
      authorName: book.authorName,
      year: book.year,
      price: book.price,
      genre: book.genre,
      publisher: book.publisherDTO?.publisherName || "",   // pick publisherName
      language: book.language,
      publishedDate: book.publishedDate,
      pages: book.pages,
      stock: book.stock,
      category: book.categoriesDTO[0]?.categoryName || ""   // pick first categoryName
    });
  };

  const handleDelete = async (id) => {
    if (window.confirm("Are you sure you want to delete this book?")) {
      const response = await axiosInstance.delete(`/api/book/${id}`);
      console.log(response);
      fetchBooks();
    }
  };

  const handleSort = (field) => {
    const newOrder = sortField === field && sortOrder === 'asc' ? 'desc' : 'asc';
    setSortField(field);
    setSortOrder(newOrder);
    fetchSortedBooks(field,newOrder);
  };

  const handlePrevBtn = () => {
    setPage(p => Math.max(0, p-1));
    fetchBooks(page-1);
  }

  const handleNextBtn = () => {
    setPage(n => n+1);
    fetchBooks(page+1);
  }


  return (
    <div className="admin-container">
      <h2>Admin Book Manager</h2>

      <form onSubmit={handleSubmit} className="admin-form">
        <h3>{editingBook ? "Update Book" : "Add Book"}</h3>
        {Object.keys(formData).map((field) => (
          <input
            key={field}
            name={field}
            placeholder={field}
            value={formData[field]}
            onChange={handleInputChange}
            className="admin-input"
          />
        ))}
        <button type="submit" className="admin-submit-btn">
          {editingBook ? "Update" : "Add"}
        </button>
      </form>

      <h3>Book List</h3>
      <table className="admin-table">
        <thead>
          <tr>
            <th>ID</th>
            <th>Book Name</th>
            <th>Author</th>
            <th onClick={() => handleSort('price')}>
                Price {sortField === 'price' && (sortOrder === 'asc' ? '↑' : '↓')}
            </th>

            <th>Genre</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          {books.map((book) => (
            <tr key={book.id}>
              <td>{book.id}</td>
              <td>{book.bookName}</td>
              <td>{book.authorName}</td>
              <td>{book.price}</td>
              <td>{book.genre}</td>
              <td>
                <button onClick={() => handleEdit(book)} className="admin-edit-btn">Edit</button>
                <button onClick={() => handleDelete(book.id)} className="admin-delete-btn">Delete</button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
      <div className="page-nav-container">
        <button className="prev-page-btn" onClick={handlePrevBtn}>&lt;</button>
        <button className="next-page-btn" onClick={handleNextBtn}>&gt;</button>
      </div>
    </div>
  );
};

export default AdminBookManager;
