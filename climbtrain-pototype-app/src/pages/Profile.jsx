import React, { useEffect, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { supabase } from '../supabaseClient'
import {
  Card,
  Input,
  Button,
  Typography,
} from "@material-tailwind/react";
import UpdateProfileAvatar from '../components/UpdateProfileAvatar';


const Profile = ({ user }) => {
  const navigate = useNavigate()
  const [profile, setProfile] = useState(null);

  const getProfile = async () => {
    const { data, error } = await supabase
      .from('demo_profiles')
      .select('*')
      .eq('id', user?.id)
      .single();
    if (error) {
      navigate('/', { replace: true })
    }
    //If profile data is empty
    if (data.username === null) {
      const username = user?.id;
      const height = 0;
      const weight = 0;
      const avatar_url = 'user?.user_metadata?.avatar_url;'
      //Update profile data
      const { data, error } = await supabase
        .from('demo_profiles')
        .update({
          username,
          height,
          weight,
          avatar_url
        })
        .eq('id', user?.id)
        .select().single();
      if (error) {
        navigate('/', { replace: true })
      }
      if (data) {
        setProfile(data);
        return;
      }
    }
    setProfile(data)

  }
  useEffect(() => {
    getProfile()
  }, [user])

  const onSubmitHandler = async (e) => {
    e.preventDefault();
    const username = e.target.username.value;
    const height = e.target.height.value;
    const weight = e.target.weight.value;
    if (username !== "" || height !== "" || weight !== "") {
      const { data, error } = await supabase
        .from('demo_profiles')
        .update({
          username,
          height,
          weight,
        })
        .eq('id', user?.id)
        .select().single();
      if (error) { alert('unknow Error'); return; }
      if (data) {
        setProfile(data)
      }

    }
    else {
      alert('Please enter username,height,weight')
    }
  }

  const updateProfileUrlHandler = async (avatar_url) => {
    console.log(avatar_url);
    const { data, error } = await supabase
      .from('demo_profiles')
      .update({
        avatar_url
      })
      .eq('id', user?.id)
      .select().single();
    if (error) { alert('unknow Error'); return; }
    if (data) {
      setProfile({ ...profile, avatar_url })
    }
  }

  const deleteProfile = async () => {
    alert(user.id)
  }


  return (
    <div className='my-4 mx-auto max-w-screen-xl py-2 px-4 lg:px-8 lg:py-4 '>
      <Typography variant="h6" color="blue-gray">
        Wellcome back
      </Typography>
      <Typography variant="h5" color="blue-gray">
        {profile?.username}
      </Typography>
      <hr className='mb-4' />
      <form className="mt-8 mb-2 w-80 max-w-screen-lg sm:w-96" onSubmit={onSubmitHandler}>
        <div className="flex flex-col gap-6">
          <UpdateProfileAvatar
            userId={user?.id}
            url={profile?.avatar_url}
            onUpload={updateProfileUrlHandler}
          />
          <Input size="lg" name="username" defaultValue={profile?.username} label="User Name" required />
          <Input size="lg" defaultValue={profile?.height} name="height" type="number" label='Height' required step="0.1" />
          <Input size="lg" defaultValue={profile?.weight} name="weight" type="number" label='Weight' required step="0.1" />
        </div>
        <Button className="mt-6" fullWidth type="submit">
          Update
        </Button>
        <Button className="mt-4" fullWidth color='red' onClick={deleteProfile}>
          Delete Profile
        </Button>
      </form>
    </div>
  )
}

export default Profile
