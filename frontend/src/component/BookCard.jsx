import { useContext } from "react";
import { AuthContext } from "../context/AuthProvider";
import { notifyUser } from "../service/BookService";
import { placeOrder } from "../service/OrderService";
import '../style/BookCard.css'

function BookCard({book, index}){
    const {user, logout} = useContext(AuthContext);

    const handleAddToCart = async (id) => {
        console.log(id);
        try{
            const response = await placeOrder({bookId:id});
            console.log(response);
            if(response.status !== 201 )
                console.log("Cant add this book");
        }
        catch(err){
            console.log(err)
        }
    }

    const handleNotifyUser = async (id, bookName) => {
        try{
            const response = await notifyUser(id,{bookName,userName:user.sub});
            console.log(response);
            if(response.status !== 201)
                console.log("something went wrong",response.status);
        }
        catch(err){
            console.log(err)
        }
    }

    

    return (
        <div key={book.id} className="book-card">
                    <div className="image-container">
                    <img
                        src={`/${book.bookName}.webp`} alt={book.bookName} className="book-image"/>
                    </div>
                    <div className="book-details">
                            <h4>{book.bookName}</h4>
                                <p><strong>Author:</strong> {book.authorName}</p>
                                <p><strong>Genre:</strong> {book.genre}</p>
                                <p><strong>Language:</strong> {book.language}</p>
                                <p><strong>Price:</strong> ₹{book.price}</p>
                                <p className={book.stock > 0 ? "in-stock" : "out-of-stock"}>
                                    {book.stock > 0 ? "In Stock" : "Out of Stock"}
                                </p>
                                {
                                    book.stock > 0 ? <button onClick={() => handleAddToCart(book.id)} className="cart-btn">
                                    Add to Cart</button> :
                                    <button onClick={()=> handleNotifyUser(book.id, book.bookName)} className="cart-btn">
                                    Notify me</button>
                                }
                                
                    </div>
        </div>
    )
}
export default BookCard