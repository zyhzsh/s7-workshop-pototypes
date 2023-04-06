import { useState, useEffect } from "react";
import {
  Navbar,
  MobileNav,
  Typography,
  IconButton,
  Button,
} from "@material-tailwind/react";

import { Link, useNavigate } from 'react-router-dom';
import { supabase } from "../supabaseClient";




const Header = ({ user, setUser }) => {

  const [openNav, setOpenNav] = useState(false);
  const navigate = useNavigate()

  const logIn = async () => {
    const { data, error } = await supabase.auth.signInWithOAuth({
      provider: 'google',
    })
    if (error) {
      console.error('Error signing in:', error.message);
      return;
    }
  }

  const logOut = async () => {
    await supabase.auth.signOut()
    setUser(null)
    navigate('/')
  }
  useEffect(() => {
    window.addEventListener(
      "resize",
      () => window.innerWidth >= 960 && setOpenNav(false)
    );
  }, []);

  const navList = (
    <ul className="mb-4 mt-2 flex flex-col gap-2 lg:mb-0 lg:mt-0 lg:flex-row lg:items-center lg:gap-6">

      <Link to={`/test`}>
        Test
      </Link>

      {user && <Link to={`/profile`}>
        Profile
      </Link>}
      <Typography
        as="li"
        variant="small"
        color="blue-gray"
        className="p-1 font-normal"
      >
        {user && <Button color="red" onClick={logOut}>
          Log Out
        </Button>}
        {!user && <Button onClick={logIn}>Login In</Button>}
      </Typography>
    </ul>
  );

  return (
    <Navbar className="my-4 mx-auto max-w-screen-xl py-2 px-4 lg:px-8 lg:py-4">
      <div className="container mx-auto flex items-center justify-between text-blue-gray-900">
        <Link to="/" className="mr-4 cursor-pointer py-1.5 font-normal">
          <span className="text-3xl text-blue-700">ClimbTraining</span>
        </Link>
        <div className="hidden lg:block">{navList}</div>
        <IconButton
          variant="text"
          className="ml-auto h-6 w-6 text-inherit hover:bg-transparent focus:bg-transparent active:bg-transparent lg:hidden"
          ripple={false}
          onClick={() => setOpenNav(!openNav)}
        >
          {openNav ? (
            <svg
              xmlns="http://www.w3.org/2000/svg"
              fill="none"
              className="h-6 w-6"
              viewBox="0 0 24 24"
              stroke="currentColor"
              strokeWidth={2}
            >
              <path
                strokeLinecap="round"
                strokeLinejoin="round"
                d="M6 18L18 6M6 6l12 12"
              />
            </svg>
          ) : (
            <svg
              xmlns="http://www.w3.org/2000/svg"
              className="h-6 w-6"
              fill="none"
              stroke="currentColor"
              strokeWidth={2}
            >
              <path
                strokeLinecap="round"
                strokeLinejoin="round"
                d="M4 6h16M4 12h16M4 18h16"
              />
            </svg>
          )}
        </IconButton>
      </div>
      <MobileNav open={openNav}>
        <div className="container mx-auto">
          {navList}
        </div>
      </MobileNav>
    </Navbar>

  );
}
export default Header