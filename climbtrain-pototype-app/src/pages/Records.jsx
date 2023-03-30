import { Button, Chip, Typography } from '@material-tailwind/react'
import React, { useEffect, useId, useState } from 'react'
import { useNavigate, useParams } from 'react-router-dom'
import { supabase } from '../supabaseClient'
import { convertSecondsToTime } from '../util/convertToTime'
const Records = () => {
  const { challengeId, recordId } = useParams()
  const navigate = useNavigate()
  const [record, setRecord] = useState(0)
  const [challenge, setChallenge] = useState(null)
  const [checkpoints, setCheckpoints] = useState([])

  const getRecord = async () => {
    const { data, error } = await supabase
      .from('demo_records')
      .select()
      .eq('id', recordId)
      .single()
    if (error) {
      navigate('/', { replace: true })
    }
    if (data) {
      setRecord(data)
    }
  }

  const getCheckpoint = async () => {
    const { data, error } = await supabase
      .from('demo_checkpoints')
      .select('*')
      .eq('challenge_id', challengeId)
    if (error) {
      navigate('/', { replace: true })
    }
    if (data) {
      setCheckpoints(data);
    }
  }

  const getChallenge = async () => {
    const { data, error } = await supabase
      .from('demo_challenges')
      .select('*')
      .eq('id', challengeId)
      .single()
    if (error) {
      navigate('/', { replace: true })
    }
    if (data) {
      setChallenge(data)
    }
  }
  useEffect(() => {
    getRecord()
    getCheckpoint()
    getChallenge()
  }, [challengeId, recordId, navigate])


  return (
    <div className='my-4 mx-auto max-w-screen-xl py-2 px-4 lg:px-8 lg:py-4'>
      <Chip variant="gradient" color='red' value={challenge?.category || ""} />
      <Typography variant="h1" color="blue" textGradient>{challenge?.name || ""}</Typography>
      <img src={challenge?.img_url} className="w-72 h-full" />
      <Typography variant="h3" color="blue" textGradient>
        Description
      </Typography>
      <Typography variant="lead">{challenge?.description || ""}</Typography>

      <Button>
        <Typography variant="h1">{convertSecondsToTime(record?.duration) || ""}</Typography>
        Continue
      </Button>
      <div>{checkpoints.map(checkpoint => {
        return <div
          key={checkpoint?.id}
          className={record.checkpoint_id === checkpoint.id ? `text-blue-300` : ""}
        >
          <Typography variant="h5">Checkpoint {checkpoint?.position} - {checkpoint?.name} {record.checkpoint_id === checkpoint.id ? "(You are here)" : null}</Typography>
          {checkpoint.name}
          {checkpoint.description}
        </div>
      })}</div>
    </div>
  )
}

export default Records