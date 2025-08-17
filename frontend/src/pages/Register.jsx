import { useState } from 'react'
import '../style/Login.css'
import { register } from '../service/AuthService';
import { useNavigate } from 'react-router-dom';

function Register(){
    const [userData, setUserData] = useState({username:"", password:"", role:"USER", email:""})
    const [error, setError] = useState("");
    const [success, setSuccess] = useState("");
    const navigate = useNavigate()

    const handleForm = async (e) => {
        try{
            e.preventDefault();
            console.log(userData);
            await register(userData);
            setSuccess("Registration successfull please verify account");
            navigate("/acc-verification")
          //  setTimeout(() => navigate("/login"), 1500);
        }
        catch(err){
            setError("Registration Unsuccessfull, try again");
            console.log(err);
        }
    }

    const handleChange = (e) => {
        setUserData({...userData, [e.target.name]: e.target.value})
    }


    return ( <div className="login-container">
         <h2>Register</h2>
         {error && <p style={{ color: "red" }}>{error}</p>}
         {success && <p style={{ color: "green" }}>{success}</p>}
        <form onSubmit={handleForm}>
            <label >
                Username:
                <input type="text" name="username" onChange={handleChange} placeholder="Enter your name"/>
            </label>
            <br />
            <label >
                Password:
                <input type="text" name="password" onChange={handleChange} placeholder="Enter your password"/>
            </label>
            <label >
                Email:
                <input type="text" name="email" onChange={handleChange} placeholder='Enter your email'/>
            </label> 
            <button type="submit">Register</button>
        </form>

    </div> )
}
export default Register