import { Button, Typography } from '@material-tailwind/react'
import React, { useEffect, useState } from 'react'
import { supabase } from '../supabaseClient'
import TestDemo from '../components/TestDemo';

const HardCodeDeviceId = '99618a1b-f4a2-4abe-a94c-aff6322a8d6f';


const RealTimeTest = () => {
  const [gameId, setGameId] = useState(null);
  const [status, setStatus] = useState(null);

  const startTheGame = async (id) => {
    const { data: game, error } = await supabase
      .from('games')
      .update({ status: 'Waitforhang' })
      .eq('id', id)
    setGameId(id);
    setStatus('Waitforhang');
  }
  const userHanging = async () => {
    const { data, error } = await supabase
      .from('games')
      .update({
        status: "Hang"
      })
      .eq('id', gameId)
      .select()
      .single();

    setStatus('Hang');
  }
  const userFailedHangTask = async () => {
    const { data, error } = await supabase
      .from('games')
      .update({
        status: "Failed"
      })
      .eq('id', gameId)
      .select()
      .single();

    //
    setStatus('Failed');
  }

  const userFinishACheckPoint = async () => {
    const { data, error } = await supabase
      .from('games')
      .update({
        status: "Break",
      })
      .eq('id', gameId)
      .select()
      .single();
    let currentCheckpoint = data.current_checkpoint;
    const totalCheckpoint = data.total_checkpoints;

    //If this is the last checkpoint
    if (currentCheckpoint === totalCheckpoint) {
      userFinishTheGame();
    }
    //If this is not the last checkpoint
    else {
      currentCheckpoint = currentCheckpoint + 1;
      const { data, error } = await supabase
        .from('games')
        .update({
          current_checkpoint: currentCheckpoint
        })
        .eq('id', gameId)
        .select()
        .single();
      setStatus('Break');
      console.log(data);
    }



  }

  const userFinishTheGame = async () => {
    const { data, error } = await supabase
      .from('games')
      .update({
        status: "Finished"
      })
      .eq('id', gameId)
      .select()
      .single();
    setStatus('Finished');
  }


  // Fun: Start the game
  useEffect(() => {
    const subscription =
      supabase
        .channel('any')
        .on('postgres_changes',
          {
            event: 'INSERT',
            schema: 'public',
            table: 'games'
          },
          payload => {
            const deviceId = payload.new.deviceId;
            const id = payload.new.id;
            if (payload.new.deviceId === HardCodeDeviceId) {
              startTheGame(id);
            }
          })
        .subscribe();

    return () => {
      subscription.unsubscribe();
    };
  }, [])



  return (
    <div className='my-4 mx-auto max-w-screen-xl py-2 px-4 lg:px-8 lg:py-4'>
      <Typography variant="h3" color="blue" textGradient>
        Realtime test buttons
      </Typography>
      <Button onClick={userHanging}>User hanging ....</Button> <br /> <br />
      <Button onClick={userFailedHangTask}>Failed hang task</Button> <br /> <br />
      <Button onClick={userFinishACheckPoint}>Finish a checkpoint</Button> <br /> <br />
      <Button onClick={userFinishTheGame}>Finish the challenge</Button> <br />
      <Typography variant="h3" color="blue" textGradient>
        Status
      </Typography>
      <TestDemo gameId={gameId} status={status} setStatus={setStatus} />
    </div>

  )
}

export default RealTimeTest





