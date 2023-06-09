import React from 'react'
import CIcon from '@coreui/icons-react'
import {
  cilBell,
  cilCalculator,
  cilChartPie,
  cilCursor,
  cilDescription,
  cilDrop,
  cilNotes,
  cilPencil,
  cilPuzzle,
  cilSpeedometer,
  cilStar,
} from '@coreui/icons'
import { CNavGroup, CNavItem, CNavTitle } from '@coreui/react'

const _nav = [
  {
    component: CNavItem,
    name: 'Dashboard',
    to: '/admin/dashboard',
    icon: <CIcon icon={cilSpeedometer} customClassName="nav-icon" />,
    badge: {
      color: 'info',
    },
  },
  {
    component: CNavGroup,
    name: 'Manage',
    to: '/base',
    icon: <CIcon icon={cilPuzzle} customClassName="nav-icon" />,
    items: [
      {
        component: CNavItem,
        name: 'Service',
        to: 'manage/service',
      },
      {
        component: CNavItem,
        name: 'Order',
        to: 'manage/order',
      },
      {
        component: CNavItem,
        name: 'Staff',
        to: 'manage/staff',
      },
      {
        component: CNavItem,
        name: 'My Profile',
        to: 'manage/myprofile/' + sessionStorage.getItem('id'),
      },
      {
        component: CNavItem,
        name: 'Our Customer',
        to: 'manage/customer',
      },
      {
        component: CNavItem,
        name: 'Manager',
        to: 'manage/otherManager',
      },
    ],
  },
]

export default _nav
