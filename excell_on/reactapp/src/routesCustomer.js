import React from 'react'

//User Front-end
const Home = React.lazy(() => import('./views/home/Home'))
const About = React.lazy(() => import('./views/about/About'))
const Login = React.lazy(() => import('./views/pages/login/LoginCustomer'))
const Register = React.lazy(() => import('./views/pages/register/Register'))
const Contact = React.lazy(() => import('./views/contact/Contact'))

const routesCustomer = [
  { path: '/', name: 'Home', element: Home },
  { path: '/home', name: 'Home', element: Home },
  { path: '/about', name: 'About', element: About },
  { path: '/login', name: 'Login', element: Login },
  { path: '/register', name: 'Register', element: Register },
  { path: '/contact', name: 'Contact', element: Contact },
]

export default routesCustomer
