import { Typography } from '@material-tailwind/react'
import React from 'react'
import ListChallenges from '../components/ListChallenges'
import ListRecords from '../components/ListRecords'


const Home = ({ user }) => {
  return (

    <div className='my-4 mx-auto max-w-screen-xl py-2 px-4 lg:px-8 lg:py-4'>
      {!user && <Typography variant="h1" color="blue" className='w-full text-center' >Please Login</Typography>}
      {user && <>
        <ListRecords />
        <ListChallenges />
      </>}
    </div>




  )
}

export default Home


