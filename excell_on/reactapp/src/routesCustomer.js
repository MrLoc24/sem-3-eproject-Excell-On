import React from 'react'

//User Front-end
const Home = React.lazy(() => import('./views/home/Home'))
const About = React.lazy(() => import('./views/about/About'))
const Login = React.lazy(() => import('./views/pages/login/Login'))
const Register = React.lazy(() => import('./views/pages/register/Register'))

const routesCustomer = [
  { path: '/', name: 'Home', element: Home },
  { path: '/home', name: 'Home', element: Home, exact: true },
  { path: '/about', name: 'About', element: About, exact: true },
  { path: '/login', name: 'Login', element: Login, exact: true },
  { path: '/register', name: 'Register', element: Register, exact: true }
]

export default routesCustomer
