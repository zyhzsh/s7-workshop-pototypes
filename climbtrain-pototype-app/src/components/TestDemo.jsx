import React, { useEffect, useState } from 'react'
import { supabase } from '../supabaseClient'
const TestDemo = ({ gameId, status, setStatus }) => {



  useEffect(() => {
    const subscription =
      supabase
        .channel('any')
        .on('postgres_changes',
          {
            event: '*',
            schema: 'public',
            table: 'games',
          },
          payload => {
            console.log(payload)
          })
        .subscribe();
    return () => {
      subscription.unsubscribe();
    };
  }, [])


  return (
    <div>
      {gameId ? gameId : 'None'}
      <br />
      {status ? status : 'IDE'}
    </div>
  )
}

export default TestDemo