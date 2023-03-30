import { Typography } from '@material-tailwind/react';
import React, { useEffect, useState } from 'react'
import { supabase } from '../supabaseClient';

const ListChallengeCheckPoints = ({ challengeId }) => {
  const [checkpoints, setCheckpoints] = useState([]);
  const getCheckpoints = async () => {
    const { data, error } = await supabase
      .from('demo_checkpoints')
      .select('*')
      .eq('challenge_id', challengeId)
    setCheckpoints(data)
  }

  useEffect(() => {
    getCheckpoints()
  }, [challengeId])
  return (
    <div>
      {checkpoints.map((checkpoint) => {
        return <div key={checkpoint?.id}>
          <Typography variant="h5" color="blue">Checkpoint {checkpoint?.position} - {checkpoint?.name}</Typography>
          <Typography variant="small">
            {checkpoint?.description}
          </Typography>
        </div>
      })}
    </div>
  )
}

export default ListChallengeCheckPoints