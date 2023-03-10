import React, { useState, useEffect } from 'react'
import { supabase } from '../supabaseClient';
import { v4 as uuidv4 } from 'uuid'
const UpdateProfileAvatar = ({ url, userId, onUpload }) => {

  const [uploading, setUploading] = useState(false)
  const uploadAvatar = async (event) => {
    try {
      setUploading(true)
      if (!event.target.files || event.target.files.length === 0) {
        throw new Error('You must select an image to upload.')
      }
      const file = event.target.files[0]

      const imageId = uuidv4();
      let { data, error: uploadError } = await
        supabase.storage
          .from('profile')
          .upload(userId + '/' + imageId, file, {
            upsert: true,
          });
      const { data: avatar_url } = supabase
        .storage
        .from('profile')
        .getPublicUrl(userId + '/' + imageId)
      onUpload(avatar_url.publicUrl)
      if (uploadError) {
        throw uploadError
      }
    } catch (error) {
      alert(error.message)
    } finally {
      setUploading(false)
    }
  }
  return (
    <>
      <img src={url} className="w-[150px] h-[150px]" />
      {uploading ? (
        'Uploading...'
      ) : (
        <>
          <label className="button primary block" htmlFor="single">
            Upload your avatar
          </label>
          <div className="visually-hidden">
            <input
              type="file"
              id="single"
              accept="image/*"
              onChange={uploadAvatar}
              disabled={uploading}
            />
          </div>
        </>
      )}
    </>

  )
}

export default UpdateProfileAvatar