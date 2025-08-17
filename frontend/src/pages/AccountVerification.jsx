import { useState } from "react"
import { useNavigate } from "react-router-dom";
import { verifyAccount } from "../service/AccVerifyService";
import '../style/AccVerification.css'

function AccountVerification(params) {
    
    const [userData,setUserData] = useState({email:"",otpCode:""});
    const navigate = useNavigate()
    
    const handleForm = async (e) => {
        try{
            e.preventDefault();
            const response=await verifyAccount(userData);
            console.log(response);
            if(response.status == 200){
                console.log("verified");
                setTimeout(()=>navigate("/login"),1000);
            }
        }
        catch(err){
            console.log(err);
            console.log("Unsuccessfull");
        }
    }

    const handleChange = (e) => {
        setUserData({...userData,[e.target.name]:e.target.value})
    }

    return (
        <div className="verification-container">
            <form onSubmit={handleForm}>
                <label>
                    Email:
                    <input type="text" name="email" placeholder="Enter your registered email" onChange={handleChange} />
                </label>
                <label>
                    OTP:
                    <input type="text" name="Otp" placeholder="Enter your otp" onChange={handleChange} />
                </label>
                <button type="submit">Verify Account</button>
            </form>
        </div>
    )
}

export default AccountVerification