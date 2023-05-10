import React from 'react'

//User Front-end
const Home = React.lazy(() => import('./views/home/Home'))
const About = React.lazy(() => import('./views/about/About'))
const Login = React.lazy(() => import('./views/pages/login/LoginCustomer'))
const Register = React.lazy(() => import('./views/pages/register/Register'))
const Contact = React.lazy(() => import('./views/contact/Contact'))
const Service = React.lazy(() => import('./views/serviceCustomer/ServiceCustomer'))
const Profile = React.lazy(() => import('./views/profile/Profile'))

const routesCustomer = [
  { path: '/', name: 'Home', element: Home, exact: true },
  { path: '/home', name: 'Home', element: Home, exact: true },
  { path: '/about', name: 'About', element: About, exact: true },
  { path: '/login', name: 'Login', element: Login, exact: true },
  { path: '/register', name: 'Register', element: Register, exact: true },
  { path: '/contact', name: 'Contact', element: Contact, exact: true },
  { path: '/service/:id', name: 'Service', element: Service, exact: true },
  { path: '/profile', name: 'Profile', element: Profile, exact: true }
]

export default routesCustomer
