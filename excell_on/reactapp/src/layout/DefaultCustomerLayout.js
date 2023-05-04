import React from 'react'
import { AppCustomerHeader, AppCustomerFooter, AppCustomerContent } from '../components/index'

const DefaultCustomerLayout = () => {
  return (
    <div>
      <div className='mb-5'>
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
