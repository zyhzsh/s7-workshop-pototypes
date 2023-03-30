import { Typography } from '@material-tailwind/react';
import React, { useEffect, useState } from 'react'
import { supabase } from '../supabaseClient';
import ChallengePreviewCard from './ChallengePreviewCard';

const ListChallenges = () => {
  const [allChallenges, setChallenges] = useState([]);
  const getAllChallenges = async () => {
    let { data, error } = await supabase
      .from('demo_challenges')
      .select('*')
    setChallenges(data)
  }
  useEffect(() => {
    getAllChallenges()
  }, [])
  return (
    <div>
      <Typography variant="h2" color="blue" className="mb-6">Challenge Section</Typography>
      <div className='grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-y-8 xl:grid-cols-4 gap-x-2 pt-5 '>
        {allChallenges.map((challenge) => (
          <ChallengePreviewCard key={challenge.id} challenge={challenge} />
        ))}
      </div>
    </div>
  )
}

export default ListChallenges