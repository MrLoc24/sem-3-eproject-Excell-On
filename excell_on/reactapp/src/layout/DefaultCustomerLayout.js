import React from 'react'
import { AppCustomerHeader, AppCustomerFooter, AppCustomerContent } from '../components/index'

const DefaultCustomerLayout = () => {
  return (
    <div>
      <div>
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
