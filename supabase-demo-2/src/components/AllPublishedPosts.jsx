import React, { useEffect, useState } from 'react'
import { supabase } from '../supabaseClient';
import PostPreview from './PostPreview';

const AllPublishedPosts = () => {
  const [postsList, SetPostsList] = useState([]);

  const GetPost = async () => {
    const { data: posts, error } = await supabase
      .from('posts')
      .select('*');
    SetPostsList(posts)
  }

  useEffect(() => {
    GetPost()
  }, [])
  return (
    <div className='flex w-full justify-start mt-3 px-10 gap-3 flex-wrap'>
      {postsList.map(post => {
        return <PostPreview title={post.title} />
      })}

    </div>
  )
}

export default AllPublishedPosts