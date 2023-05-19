import React from 'react'

//User Front-end
const Home = React.lazy(() => import('./views/home/Home'))
const About = React.lazy(() => import('./views/about/About'))
const Login = React.lazy(() => import('./views/pages/login/LoginCustomer'))
const Register = React.lazy(() => import('./views/pages/register/RegisterCustomer'))
const Contact = React.lazy(() => import('./views/contact/Contact'))
const Service = React.lazy(() => import('./views/serviceCustomer/ServiceCustomer'))
const Profile = React.lazy(() => import('./views/profile/Profile'))
const Cart = React.lazy(() => import('./views/cart/Cart'))
const EmptyCart = React.lazy(() => import('./views/cart/EmptyCart'))
const Checkout = React.lazy(() => import('./views/checkout/Checkout'))
const OrderHistory = React.lazy(() => import('./views/orderHistory/OrderHistory'))
const OrderHistoryDetail = React.lazy(() => import('./views/orderHistory/OrderHistoryDetail'))

const routesCustomer = [
  { path: '/', name: 'Home', element: Home, exact: true },
  { path: '/home', name: 'Home', element: Home, exact: true },
  { path: '/about', name: 'About', element: About, exact: true },
  { path: '/login', name: 'Login', element: Login, exact: true },
  { path: '/register', name: 'Register', element: Register, exact: true },
  { path: '/contact', name: 'Contact', element: Contact, exact: true },
  { path: '/service/:id', name: 'Service', element: Service, exact: true },
  { path: '/profile', name: 'Profile', element: Profile, exact: true },
  { path: '/cart', name: 'Cart', element: Cart, exact: true },
  { path: '/empty', name: 'EmptyCart', element: EmptyCart, exact: true },
  { path: '/checkout', name: 'Checkout', element: Checkout, exact: true },
  { path: '/history', name: 'OrderHistory', element: OrderHistory, exact: true },
  { path: '/detailHistory/:id', name: 'OrderHistoryDetail', element: OrderHistoryDetail, exact: true },

]

export default routesCustomer
