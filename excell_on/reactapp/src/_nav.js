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
        name: 'Breadcrumb',
        to: 'manage/breadcrumbs',
      },
      {
        component: CNavItem,
        name: 'Cards',
        to: 'manage/cards',
      },
      {
        component: CNavItem,
        name: 'Carousel',
        to: 'manage/carousels',
      },
      {
        component: CNavItem,
        name: 'Collapse',
        to: 'manage/collapses',
      },
      {
        component: CNavItem,
        name: 'List group',
        to: 'manage/list-groups',
      },
      {
        component: CNavItem,
        name: 'Navs & Tabs',
        to: 'manage/navs',
      },
      {
        component: CNavItem,
        name: 'Pagination',
        to: 'manage/paginations',
      },
      {
        component: CNavItem,
        name: 'Placeholders',
        to: '/manage/placeholders',
      },
      {
        component: CNavItem,
        name: 'Popovers',
        to: '/manage/popovers',
      },
      {
        component: CNavItem,
        name: 'Progress',
        to: '/manage/progress',
      },
      {
        component: CNavItem,
        name: 'Spinners',
        to: '/manage/spinners',
      },
      {
        component: CNavItem,
        name: 'Tables',
        to: '/manage/tables',
      },
      {
        component: CNavItem,
        name: 'Tooltips',
        to: '/manage/tooltips',
      },
    ],
  },
  {
    component: CNavGroup,
    name: 'Pages',
    icon: <CIcon icon={cilStar} customClassName="nav-icon" />,
    items: [
      {
        component: CNavItem,
        name: 'Login',
        to: '/login',
      },
      {
        component: CNavItem,
        name: 'Register',
        to: '/register',
      },
      {
        component: CNavItem,
        name: 'Error 404',
        to: '/404',
      },
      {
        component: CNavItem,
        name: 'Error 500',
        to: '/500',
      },
    ],
  },
  {
    component: CNavItem,
    name: 'Docs',
    href: 'https://coreui.io/react/docs/templates/installation/',
    icon: <CIcon icon={cilDescription} customClassName="nav-icon" />,
  },
]

export default _nav
