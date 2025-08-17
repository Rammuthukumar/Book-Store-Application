import { BrowserRouter as Router, Routes, Route, useNavigate } from "react-router-dom"
import Login from "./pages/Login"
import Register from "./pages/Register"
import AuthProvider from "./context/AuthProvider"
import Home from "./pages/Home"
import Order from "./pages/Order"
import AdminBookManager from "./pages/AdminBookManager"
import AccountVerification from "./pages/AccountVerification"

function App(){
  
  return (
    <AuthProvider>
      <Router>
      <Routes>
        <Route path="/login" element={<Login/>}/>
        <Route path="/register" element={<Register/>}/>
        <Route path="/acc-verification" element={<AccountVerification/>}></Route>
        <Route path="/" element={<Home/>}/>
        <Route path="/orders" element={<Order/>}/>
        <Route path="/admin" element={<AdminBookManager/>}/>
      </Routes>
    </Router>
    </AuthProvider>
    
  )
}
export default App