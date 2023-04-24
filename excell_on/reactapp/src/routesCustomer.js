import React from 'react'

//User Front-end
const Home = React.lazy(() => import('./views/home/Home'))
const About = React.lazy(() => import('./views/about/About'))

const routesCustomer = [
  { path: '/', name: 'Home', element: Home },
  { path: '/home', name: 'Home', element: Home, exact: true },
  { path: '/about', name: 'About', element: About, exact: true },
]

export default routesCustomer
