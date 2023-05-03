import React, { Component, Suspense } from 'react'
import { HashRouter, Route, Routes } from 'react-router-dom'
import './scss/style.scss'

const loading = (
  <div className="pt-3 text-center">
    <div className="sk-spinner sk-spinner-pulse"></div>
  </div>
)

// Containers
const DefaultLayout = React.lazy(() => import('./layout/DefaultLayout'))
const DefaultCustomerLayout = React.lazy(() => import('./layout/DefaultCustomerLayout'))

// Pages
const Login = React.lazy(() => import('./views/pages/login/Login'))

class App extends Component {
  render() {
    return (
      <HashRouter>
        <Suspense fallback={loading}>
          <Routes>
            <Route exact path="/admin/login" name="Login Page" element={<Login />} />
            <Route exact path="/admin/*" name="Admin" element={<DefaultLayout />} />
            <Route exact path="*" name="Home" element={<DefaultCustomerLayout />} />
          </Routes>
        </Suspense>
      </HashRouter>
    )
  }
}

export default App
