import { useEffect, useState } from "react"
import { BrowserRouter, Routes, Route } from "react-router-dom"
import Header from './components/Header'
import Challenge from './pages/Challenge'
import Home from "./pages/Home"
import Profile from "./pages/Profile"
import Records from "./pages/Records"
import { supabase } from "./supabaseClient"


const App = () => {
  const [user, setUser] = useState(null)
  const GetUser = async () => {
    const { data } = await supabase.auth.getUser();
    const userInfo = data?.user
    setUser(userInfo)
    console.log(data?.user)
  }
  useEffect(() => {
    GetUser();
  }, [])
  return (
    <>
      <BrowserRouter>
        <Header user={user} setUser={setUser} />
        <Routes>
          <Route path="/" element={<Home user={user} />} />
          <Route path="/profile" element={<Profile user={user} />} />
          <Route path="/challenges/:challengeId/records/:recordId" element={<Records />} />
          <Route path="/challenges/:id" element={<Challenge />} />
        </Routes>
      </BrowserRouter>
    </>
  )
}

export default App