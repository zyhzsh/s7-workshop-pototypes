import { useEffect } from "react"
import { useState } from "react"
import { Link } from "react-router-dom"
import supabase from "../supabaseClient"

const Home = () => {
  const [error,setError] = useState(null)
  const [smoothies,setSmoothies] = useState([])
  const [orderBy,setOrderBy] = useState('created_at')

  const handleDelete=async(id)=>{
    const {data,error} = await supabase
    .from('smoothies')
    .delete()
    .eq('id',id)
    .select()

    if(error){
      console.log(error)
    }
    if(data){

      setSmoothies(prev=>prev.filter(item=>item.id !==id))
    }
  }

  useEffect(() => {
    const fetchSmoothies = async () => {
      const { data, error } = await supabase
        .from('smoothies')
        .select()
        .order(orderBy, {ascending: false})
      if (error) {
        setError('Could not fetch the smoothies')
        setSmoothies(null)
      }
      if (data) {
        setSmoothies(data)
        setError(null)
      }
    }
    fetchSmoothies()
  }, [orderBy])



  return (
    <div className="page home">
      {error && (<p>{error}</p>)}
      <div className="order-by">
            <p>Order by:</p>
            <button onClick={() => setOrderBy('created_at')}>Time Created</button>
            <button onClick={() => setOrderBy('title')}>Title</button>
            <button onClick={() => setOrderBy('rating')}>Rating</button>
      </div>
      <hr />
      {smoothies.map(item=>{
        return <div key={item.id}>
         <h1>{item.title}</h1> 
          <p>Method: {item.method}</p>
          <p>Rating: {item.rating}</p>
          <button>
            <Link to={'/'+item.id}>
              Detail
            </Link>
          </button>
          <button onClick={()=>handleDelete(item.id)}>Delete</button>
        </div>
      })}
    </div>
  )
}

export default Home