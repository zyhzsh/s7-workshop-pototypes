import { useEffect, useState } from 'react'
import PocketBase from 'pocketbase';



const pb = new PocketBase('http://127.0.0.1:8090');


const App = () => {


  const [lists, setList] = useState([]);

  const testCall = async () => {
    const dataSet = await pb.collection('games').getFullList({
      sort: '-created',
    });
    setList(dataSet)
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
