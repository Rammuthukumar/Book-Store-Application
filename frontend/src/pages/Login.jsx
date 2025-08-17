import { useContext, useState } from "react"
import {Link, useNavigate} from 'react-router-dom'
import '../style/Login.css'
import { login } from "../service/AuthService";
import { AuthContext } from "../context/AuthProvider";

function Login(){
    const [credentials, setCredentials] = useState({username:"", password: ""});
    const {user,login:authLogin} = useContext(AuthContext);
    const navigate = useNavigate();

   
    const handleChange = (e)=> {
        setCredentials({...credentials, [e.target.name]: e.target.value})

    }

    const handleForm = async (e) => {
        console.log(credentials);
        e.preventDefault();
        try {
            const response = await login(credentials);
            console.log(response);
            authLogin(response.data.jwtToken);
            user.roles[0].substring(5) === "ADMIN" ? navigate("/admin"): navigate("/");
        } catch (error) {
            console.log(error);
        }
        console.log(credentials);
    }

    return ( 
        <div className="login-container">
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
                <br />
                <button type="submit">Login</button>
            </form>
            <div className="new-user">
                <p>New User?</p>
                <Link to="/register">Register</Link>
            </div>
        </div>
     )
}
export default Login