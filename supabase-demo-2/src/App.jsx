//import { supabase } from './supabaseClient'

import AllPublishedPosts from "./components/AllPublishedPosts"
import MyPosts from "./components/MyPosts"
import Navbar from "./components/Navbar"
import AuthContextProvider from "./context/authContext"


const App = () => {

  return (
    <AuthContextProvider>
      <Navbar />
      {/* <MyPosts /> */}
      <AllPublishedPosts />
    </AuthContextProvider>
  )
}

export default App