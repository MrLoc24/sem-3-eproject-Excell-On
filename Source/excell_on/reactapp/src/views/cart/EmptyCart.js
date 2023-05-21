import React from 'react'
import { Breadcrumb, AboutSection, ContactSection } from 'src/components'

export default function EmptyCart() {
  return (
    <>
      <Breadcrumb title="Cart" />
      <div className="container my-5">
        <div>
          <p className="container text-center fs-5">There are no records to display</p>
        </div>
        <div className="container">
          <h4>Summary</h4>
          <h3>Total Cost: 0</h3>
          <a type="button" href="/checkout" className="btn btn-primary disabled">
            Checkout
          </a>
        </div>
      </div>
      <AboutSection />
      <ContactSection />
    </>
  )
}
