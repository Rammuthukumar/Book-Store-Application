import { useState, useEffect } from "react";
import "../style/Order.css";
import { deleteOrder, getUserOrders, updateOrder } from "../service/OrderService";

function Order() {
    const [orders, setOrders] = useState([]);
    const [quantities, setQuantities] = useState({});

    useEffect(() => {
        const fetchData = async () => {
            try {
                const response = await getUserOrders();
                setOrders(response.data);
                console.log(response.data);
                console.log(orders)

                // Initialize quantities with default values from the response
                const quantityMap = {};
                response.data.forEach(order => {
                    quantityMap[order.id] = order.quantity;
                });
                setQuantities(quantityMap);
            } catch (err) {
                console.log(err);
            }
        };
        fetchData();
    }, []);

    const handleUpdate = async (order) => {
        const newQuantity = quantities[order.id];
        console.log("Updating order", order.id, "to quantity", newQuantity);
        // Call your update API here
        try{
            const bookId = order.bookResponse.id;
            const response = await updateOrder({bookId,quantity:newQuantity});
            const updatedOrder = response.data;

            setOrders((prevOrders) => 
                prevOrders.map((o) => 
                    o.id === updatedOrder.id ? {...o,...updatedOrder} : o
                )
            )
        }
        catch(err){
            console.log(err)
        }
    };

    const handleDelete = async (orderId) => {
        console.log("Deleting order", orderId);
        // Call your delete API here
        try {
            const response = await deleteOrder(orderId);
            if(response.status === 200){
                setOrders((prevOrders) =>
                    prevOrders.filter((o)=> o.id !== orderId)
                )
            }
            else console.log("Cant find the book for the given book id");
        }
        catch(err){
            console.log(err);
        }
    };

    const handleQuantityChange = (orderId, value) => {
        setQuantities(prev => ({...prev,[orderId]: value}));
    };

    return (
        <div>
            {orders.map((order) => (
                <div key={order.id} className="order-card">
                    <div className="order-left">
                        <img src={`/${order.bookResponse.bookName}.webp`} alt="book img"/>
                    </div>

                    <div className="order-right">
                        <h3>{order.bookResponse.bookName}</h3>
                        <p><strong>Author:</strong> {order.bookResponse.authorName}</p>

                        <div className="order-actions">
                            <label>
                                <strong>Quantity:</strong>
                                <input
                                    type="number"
                                    min="1"
                                    value={quantities[order.id] || 1}
                                    onChange={(e) =>
                                        handleQuantityChange(order.id, parseInt(e.target.value))
                                    }
                                />
                            </label>

                            <p><strong>Total Price:</strong> ₹{order.totalPrice}</p>

                            <div className="button-group">
                                <button className="update-btn" onClick={() => handleUpdate(order)}>Update</button>
                                <button className="delete-btn" onClick={() => handleDelete(order.id)}>Delete</button>
                            </div>
                        </div>
                    </div>
                </div>
            ))}
        </div>
    );
}

export default Order;
 