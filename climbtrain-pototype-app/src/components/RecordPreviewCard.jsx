import { Card, Chip, Typography } from '@material-tailwind/react'
import React from 'react'
import { Link } from 'react-router-dom'
import { convertSecondsToTime } from '../util/convertToTime';

const RecordPreviewCard = ({ record }) => {
  return (
    <Link to={`/challenges/${record?.challenge_id}/records/${record?.id}`}>
      <Card
        className="p-4 overflow-hidden hover:text-white text-white hover:shadow-2xl opacity-80 hover:opacity-100">
        <img src={record?.demo_challenges?.img_url} className="absolute top-0 left-0  " />
        <div className='z-0'>
          <Typography variant="h2" >{record?.demo_challenges?.name}</Typography>
          <Chip variant="gradient" className='p-2' color='red' value={record?.demo_challenges?.category || ""} />
          <Typography variant="h6">
            Checkpoin - {record?.demo_checkpoints?.position}: </Typography>
          <Typography variant="h6">{record?.demo_checkpoints?.name}</Typography>
          <Typography variant="h6">{convertSecondsToTime(record?.duration)}</Typography>
        </div>
      </Card>
    </Link>
  )
}
export default RecordPreviewCard