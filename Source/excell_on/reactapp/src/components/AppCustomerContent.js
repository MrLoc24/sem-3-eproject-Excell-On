import React, { Suspense } from 'react'
import { Navigate, Route, Routes } from 'react-router-dom'
import { CContainer, CSpinner } from '@coreui/react'

// routes config
import routesCustomer from '../routesCustomer'

const AppCustomerContent = () => {
  return (
    <CContainer fluid className='customer-content'>
      <Suspense fallback={<CSpinner color="primary" />}>
        <Routes>
          {routesCustomer.map((route, idx) => {
            return (
              route.element && (
                <Route
                  key={idx}
                  path={route.path}
                  exact={route.exact}
                  name={route.name}
                  element={<route.element />}
                />
              )
            )
          })}
        </Routes>
      </Suspense>
    </CContainer>
  )
}

export default React.memo(AppCustomerContent)
