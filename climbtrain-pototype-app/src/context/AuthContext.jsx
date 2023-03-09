import { createContext } from "react";
import { supabase } from '../supabaseClient'
export const AuthContext = createContext()

const AuthContextProvider = (props) => {

  const Login = async () => {
    await supabase.auth.signin
    console.log("Login")
  }
  const LogOut = () => {
    console.log("LogOut")
  }

  return <AuthContext.Provider value={{ Login, LogOut }}>
    {props.children}
  </AuthContext.Provider>
}

export default AuthContextProvider;