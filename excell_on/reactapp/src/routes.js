import React from 'react'

const Dashboard = React.lazy(() => import('./views/dashboard/Dashboard'))

// Manage
const Service = React.lazy(() => import('./views/manage/service/Service'))
const ServiceDetail = React.lazy(() => import('./views/manage/service/ServiceDetail'))
const MyProfile = React.lazy(() => import('./views/manage/account/MyProfile'))
const AdminCustomer = React.lazy(() => import('./views/manage/customer/AdminCustomer'))
const OtherManager = React.lazy(() => import('./views/manage/account/OtherManager'))
const Staff = React.lazy(() => import('./views/manage/staff/Staff'))
const StaffDetail = React.lazy(() => import('./views/manage/staff/StaffDetail'))
const Order = React.lazy(() => import('./views/manage/order/Order'))
const OrderDetail = React.lazy(() => import('./views/manage/order/OrderDetail'))

const routes = [
  { path: '/dashboard', name: 'Dashboard', element: Dashboard },
  { path: '/manage/service', name: 'Service', element: Service },
  { path: '/manage/service/:id', name: 'Service Detail', element: ServiceDetail },
  { path: '/manage/staff', name: 'Staff', element: Staff },
  { path: '/manage/order', name: 'Order', element: Order },
  { path: '/manage/order/:id', name: 'Order Detail', element: OrderDetail },
  { path: '/manage/staff/:id', name: 'Staff Detail', element: StaffDetail },
  { path: '/manage/myprofile/:id', name: 'My Profile', element: MyProfile },
  { path: '/manage/customer', name: 'Our Customer', element: AdminCustomer },
  { path: '/manage/otherManager', name: 'Manager', element: OtherManager },
]

export default routes
