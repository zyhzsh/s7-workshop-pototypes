import { Card } from "@material-tailwind/react";

const PostPreview = ({ title }) => {
  return (
    <Card className="w-96 h-20 flex justify-center items-center">
      {title}
    </Card>
  );
}

export default PostPreview