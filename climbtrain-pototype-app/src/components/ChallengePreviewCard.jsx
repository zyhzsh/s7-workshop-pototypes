import {
  Card,
  CardHeader,
  CardBody,
  CardFooter,
  Typography,
} from "@material-tailwind/react";
import { Link } from "react-router-dom";

const ChallengePreviewCard = ({ challenge }) => {

  return (
    <Link to={`/challenges/${challenge.id}`} className='flex justify-center'>
      <Card className="hover:shadow-2xl min-w-[160px] max-w-[360px]  min-h-[200px]  max-h-[340px]">
        <CardHeader className="relative max-h-40 ">
          <img
            src={challenge.img_url}
            alt="img-blur-shadow"
          />
        </CardHeader>
        <CardBody className="text-center h-44 overflow-hidden py-2">
          <Typography variant="h5" className="mb-2">
            {challenge.name}
          </Typography>
          <Typography >
            {challenge.description}
          </Typography>
        </CardBody>
      </Card>
    </Link>
  )
}

export default ChallengePreviewCard