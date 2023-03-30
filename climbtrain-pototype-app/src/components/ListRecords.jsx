import { Typography } from '@material-tailwind/react'
import React, { useEffect, useId, useState } from 'react'
import { supabase } from '../supabaseClient';
import RecordPreviewCard from './RecordPreviewCard';

const ListRecords = () => {
  const [records, setRecords] = useState([]);

  const getMyRecords = async () => {
    const { data, error } = await supabase
      .from('demo_records')
      .select(`
        *,
        challenges (*),
        checkpoints (*)`)
    setRecords(data)
  }

  useEffect(() => {
    getMyRecords()
  }, [])

  return (
    <div className='mb-4'>
      <Typography variant="h2" color="blue" >My Records</Typography>
      <div className='grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-y-8 xl:grid-cols-4 gap-x-2 pt-5 '>
        {records.map(record => {
          return <RecordPreviewCard
            key={useId}
            record={record}
          />
        })}
      </div>
    </div>
  )
}

export default ListRecords