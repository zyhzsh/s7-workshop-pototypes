import { Button, Chip, Typography } from '@material-tailwind/react'
import React, { useState, useEffect } from 'react'
import { useParams, useNavigate } from 'react-router-dom'
import ListChallengeCheckPoints from '../components/ListChallengeCheckPoints'
import { supabase } from '../supabaseClient'

const Challenge = () => {
  const { id } = useParams()
  const navigate = useNavigate()
  const [name, setName] = useState('')
  const [description, setDescription] = useState('')
  const [img, setImg] = useState('')
  const [category, setCategory] = useState('')

  const getChallenge = async () => {
    const { data, error } = await supabase
      .from('demo_challenges')
      .select()
      .eq('id', id)
      .single()

    if (error) {
      navigate('/', { replace: true })
    }
    if (data) {
      setName(data.name)
      setDescription(data.description)
      setImg(data.img_url)
      setCategory(data.category)
    }
  }

  useEffect(() => {
    getChallenge()
  }, [id, navigate])


  return (
    <div className='my-4 mx-auto max-w-screen-xl py-2 px-4 lg:px-8 lg:py-4'>
      <Chip variant="gradient" value={category} />
      <Typography variant="h1" color="blue" textGradient>{name}</Typography>
      <img src={img} className="w-72 h-full" />
      <Typography variant="h3" color="blue" textGradient>
        Description
      </Typography>
      <Typography variant="lead">{description}</Typography>
      <ListChallengeCheckPoints challengeId={id} />
      <Button>Join</Button>
    </div>
  )
}

export default Challenge