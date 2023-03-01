import { useState } from 'react'
import { createClient } from '@supabase/supabase-js'

const supabaseUrl = 'https://gjokljurkcouvnjafyvt.supabase.co'
const supabaseKey = import.meta.env.VITE_DATA_KEY
const supabase = createClient(supabaseUrl, supabaseKey)


const App = () => {


  const [lists, setList] = useState([]);

  const testCall = async () => {

    let { data: games, error } = await supabase
      .from('games')
      .select('*')
    setList(games)
  }
  return (
    <>
      <h1>List of games</h1>
      <button onClick={() => testCall()}>Load</button>
      {lists.map((item, _) => {
        return <div key={_}>
          <li
          >{item?.name}</li>
          <li
            key={_}
          >{item?.description}</li>
          <br />
        </div>
      })}
    </>

  )
}

export default App
