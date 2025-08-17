import { useContext, useEffect, useRef, useState } from "react"
import { AuthContext } from "../context/AuthProvider"
import { getAllBooks, notifyUser, searchByAuthor, searchByBook } from "../service/BookService";
import '../style/Home.css'
import { useNavigate, Link } from "react-router-dom";
import BookCard from "../component/BookCard";

function Home(){
    const {user, logout} = useContext(AuthContext);
    const navigate = useNavigate()
    const [books, setBooks] = useState([]);
    const hasFetched = useRef(false);
    const [searchValue, setSearchValue] = useState('');
    const [searchCategory, setSearchCategory] = useState("book");

    useEffect(()=>{
        //console.log(user.roles[0]);
        const fetchData = async () => {
            try{
                const response = await getAllBooks();
                console.log(response.data);
                setBooks(response.data);
            }
            catch(err){
                if(err.response && err.response.status === 401) 
                    navigate("/login")
            }
        }
        if(!hasFetched.current){
            fetchData();
            hasFetched.current = true;
        }
    },[]);

    const handleLogout = () => {
        logout();
        setBooks([]);
        navigate("/login")
    }

    function handleSearchChange (event) {
        setSearchValue(event.target.value);
    }

    async function searchContent(){
        console.log(searchCategory+" "+searchValue);
        if(searchCategory === "author"){
            const response = await searchByAuthor(searchValue);
            setBooks(response.data)
            console.log(response.data);
        }
        else {
            const response = await searchByBook(searchValue);
            setBooks(response.data);
            console.log(response.data);
        }
    }
    
    async function notifyMe(id, bookName){
        try{
            const response = await notifyUser(id,{bookName,userName:user.sub});
            console.log(response);
            if(response.status !== 201){
                console.log("something went wrong");
            }
        }
        catch(err){
            console.log(err);
        }
        
    }

    return (
        <div className="home-container">
             <div className="header">
                <h2>Welcome, {user.sub}!</h2>
                <div className="search-container">
                    <select className="search-filter" value={searchCategory}
                        onChange={(e) => setSearchCategory(e.target.value)} >
                        <option value="book">Book</option>         {/* default */}
                        <option value="author">Author</option>
                        <option value="publisher">Publisher</option>
                    </select>
                    <input type="text" className="search-bar" value={searchValue} onChange={handleSearchChange}/>
                    <button className="search-btn" onClick={searchContent}>Search</button>
                </div>
                <div className="nav-buttons">
                    <button className="logout-btn" onClick={handleLogout}>Logout</button>
                    <Link className="order-link" to="/orders">Order</Link>
                </div>
            </div>
           
            <div className="book-grid">
            {books.length > 0 ? (
                books.map((book,i) => (
                    <BookCard key={book.id} book={book} index={i}/>
                    ))) : (
                            <p>No books available</p>)}
                    </div>
                </div>
    );
        
}
export default Home