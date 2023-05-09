import React, { useEffect, useState } from 'react'
import { Nav, NavDropdown} from 'react-bootstrap'
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
        <Nav.Link href="/cart" className='d-flex align-items-center'>
          <i class="bi bi-cart4 fs-3"></i>
        </Nav.Link>
        <Nav.Link href="/profile" className='px-0'>
          <img src={customer.customerAvatar} width={50} alt={customer.customerName} className='rounded-circle'/>
        </Nav.Link>
        <NavDropdown className="my-auto" title={props.username} id="collasible-nav-dropdown">
          <NavDropdown.Item href="/profile"><i class="bi bi-gear me-2"></i>Profile</NavDropdown.Item>
          <NavDropdown.Item onClick={handleLogout}><i class="bi bi-arrow-bar-right me-2"></i>Logout</NavDropdown.Item>
        </NavDropdown>
      </Nav>
    </>
  )
}
