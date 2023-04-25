import React from 'react'

const Dashboard = React.lazy(() => import('./views/dashboard/Dashboard'))

// Manage
const Service = React.lazy(() => import('./views/manage/service/Service'))
const ServiceDetail = React.lazy(() => import('./views/manage/service/ServiceDetail'))
const Breadcrumbs = React.lazy(() => import('./views/manage/breadcrumbs/Breadcrumbs'))
const Cards = React.lazy(() => import('./views/manage/cards/Cards'))
const Carousels = React.lazy(() => import('./views/manage/carousels/Carousels'))
const Collapses = React.lazy(() => import('./views/manage/collapses/Collapses'))
const ListGroups = React.lazy(() => import('./views/manage/list-groups/ListGroups'))
const Navs = React.lazy(() => import('./views/manage/navs/Navs'))
const Paginations = React.lazy(() => import('./views/manage/paginations/Paginations'))
const Placeholders = React.lazy(() => import('./views/manage/placeholders/Placeholders'))
const Popovers = React.lazy(() => import('./views/manage/popovers/Popovers'))
const Progress = React.lazy(() => import('./views/manage/progress/Progress'))
const Spinners = React.lazy(() => import('./views/manage/spinners/Spinners'))
const Tables = React.lazy(() => import('./views/manage/tables/Tables'))
const Tooltips = React.lazy(() => import('./views/manage/tooltips/Tooltips'))

const routes = [
  { path: '/dashboard', name: 'Dashboard', element: Dashboard },
  { path: '/base', name: 'Base', element: Cards, exact: true },
  { path: '/manage/service', name: 'Service', element: Service },
  { path: '/manage/service/:id', name: 'Service Detail', element: ServiceDetail },
  { path: '/manage/breadcrumbs', name: 'Breadcrumbs', element: Breadcrumbs },
  { path: '/manage/cards', name: 'Cards', element: Cards },
  { path: '/manage/carousels', name: 'Carousel', element: Carousels },
  { path: '/manage/collapses', name: 'Collapse', element: Collapses },
  { path: '/manage/list-groups', name: 'List Groups', element: ListGroups },
  { path: '/manage/navs', name: 'Navs', element: Navs },
  { path: '/manage/paginations', name: 'Paginations', element: Paginations },
  { path: '/manage/placeholders', name: 'Placeholders', element: Placeholders },
  { path: '/manage/popovers', name: 'Popovers', element: Popovers },
  { path: '/manage/progress', name: 'Progress', element: Progress },
  { path: '/manage/spinners', name: 'Spinners', element: Spinners },
  { path: '/manage/tables', name: 'Tables', element: Tables },
  { path: '/manage/tooltips', name: 'Tooltips', element: Tooltips },
]

export default routes
