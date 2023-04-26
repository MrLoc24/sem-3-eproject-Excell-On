import React from 'react'

const Dashboard = React.lazy(() => import('./views/dashboard/Dashboard'))

// Manage
const Service = React.lazy(() => import('./views/manage/service/Service'))
const ServiceDetail = React.lazy(() => import('./views/manage/service/ServiceDetail'))
const MyProfile = React.lazy(() => import('./views/manage/account/MyProfile'))

const routes = [
  { path: '/dashboard', name: 'Dashboard', element: Dashboard },
  { path: '/manage/service', name: 'Service', element: Service },
  { path: '/manage/service/:id', name: 'Service Detail', element: ServiceDetail },
  { path: '/manage/myprofile/:id', name: 'My Profile', element: MyProfile },
]

export default routes
