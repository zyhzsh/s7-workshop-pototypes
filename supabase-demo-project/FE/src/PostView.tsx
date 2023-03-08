import { useParams } from 'react-router-dom';

export default function PostView() {
  const { pageNumber } = useParams();
  return <h2>Message Board</h2>;
}
