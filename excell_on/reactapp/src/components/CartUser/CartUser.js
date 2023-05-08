import React, { useEffect, useState } from 'react'
import { Nav, NavDropdown, Button } from 'react-bootstrap'
import LoginCustomerService from 'src/service/LoginCustomerService'
import CustomerService from 'src/service/CustomerService'

export default function CartUser(props) {
  const [customer, setCustomer] = useState({})
  const handleLogout = () => {
    LoginCustomerService.logout()
    window.location.reload()
  }

  useEffect(() => {
    let object = JSON.parse(sessionStorage.getItem('customer'))
    CustomerService.GetById(object.id).then((response) => {
      setCustomer(response)
      console.log(customer)
    })
  }, [])

  return (
    <>
      <Nav>
        <Nav.Link href="#/cart">
          <i class="bi bi-cart4 fs-3"></i>
        </Nav.Link>
        <Nav.Link href="#/profile">
          <img src={customer.customerAvatar} width={80} alt={customer.customerName} />
        </Nav.Link>
        <NavDropdown className="my-auto" title={props.username} id="collasible-nav-dropdown">
          <NavDropdown.Item href="#/profile">Profile</NavDropdown.Item>
          <NavDropdown.Item onClick={handleLogout}>Logout</NavDropdown.Item>
        </NavDropdown>
      </Nav>
    </>
  )
}
