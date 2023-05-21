import React, { useState, useEffect } from 'react'
import { AppContent, AppSidebar, AppFooter, AppHeader } from '../components/index'
import { useNavigate } from 'react-router-dom'

const DefaultLayout = () => {
  const [authenticated, setAuthenticated] = useState(null)
  const navigate = useNavigate()
  useEffect(() => {
    const loggedInUser = sessionStorage.getItem('user')
    if (loggedInUser) {
      setAuthenticated(loggedInUser)
    } else {
      navigate('/admin/login')
    }
  }, [])

  return (
    <div>
      <AppSidebar />
      <div className="wrapper d-flex flex-column min-vh-100 bg-light">
        <AppHeader />
        <div className="body flex-grow-1 px-3">
          <AppContent />
        </div>
        <AppFooter />
      </div>
    </div>
  )
}

export default DefaultLayout
