import React from 'react'
import { AppCustomerHeader, AppCustomerFooter, AppCustomerContent } from '../components/index'

const DefaultCustomerLayout = () => {
  return (
    <div>
      <div className='header-spacing'>
        <AppCustomerHeader />
      </div>
      <AppCustomerContent />
      <div className='footer-background'>
        <AppCustomerFooter />
      </div>
    </div>
  )
}
export default DefaultCustomerLayout
