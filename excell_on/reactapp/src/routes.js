import React from 'react'

const Dashboard = React.lazy(() => import('./views/dashboard/Dashboard'))

// Manage
const Service = React.lazy(() => import('./views/manage/service/Service'))
const ServiceDetail = React.lazy(() => import('./views/manage/service/ServiceDetail'))
const MyProfile = React.lazy(() => import('./views/manage/account/MyProfile'))
const AdminCustomer = React.lazy(() => import('./views/manage/customer/AdminCustomer'))
const OtherManager = React.lazy(() => import('./views/manage/account/OtherManager'))
const Staff = React.lazy(() => import('./views/manage/staff/Staff'))

const routes = [
  { path: '/dashboard', name: 'Dashboard', element: Dashboard },
  { path: '/manage/service', name: 'Service', element: Service },
  { path: '/manage/service/:id', name: 'Service Detail', element: ServiceDetail },
  { path: '/manage/staff', name: 'Staff', element: Staff },
  { path: '/manage/myprofile/:id', name: 'My Profile', element: MyProfile },
  { path: '/manage/customer', name: 'Our Customer', element: AdminCustomer },
  { path: '/manage/otherManager', name: 'Manager', element: OtherManager },
]

export default routes
