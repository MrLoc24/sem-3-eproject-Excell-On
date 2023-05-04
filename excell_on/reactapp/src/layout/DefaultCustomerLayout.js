import React from 'react'
import { AppCustomerHeader, AppCustomerFooter, AppCustomerContent } from '../components/index'

const DefaultCustomerLayout = () => {
  return (
    <div>
      <div className='header-spacing'>
        <AppCustomerHeader />
      </div>
      <AppCustomerContent />
      <div>
        <AppCustomerFooter />
      </div>
    </div>
  )
}
export default DefaultCustomerLayout
