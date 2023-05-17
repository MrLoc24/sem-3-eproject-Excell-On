import React, { useEffect, useState } from 'react'
import { Nav, NavDropdown, Badge } from 'react-bootstrap'
import { useNavigate } from 'react-router-dom'
import LoginCustomerService from 'src/service/LoginCustomerService'
import CustomerService from 'src/service/CustomerService'
import './CartUser.scss'

export default function CartUser(props) {
  const [customer, setCustomer] = useState({})
  const [cartAmount, setCartAmount] = useState(0)

  const navigate = useNavigate()
  const handleLogout = () => {
    LoginCustomerService.logout()
    navigate('/')
    window.location.reload()
  }

  useEffect(() => {
    let id = JSON.parse(sessionStorage.getItem('id'))
    CustomerService.GetById(id).then((response) => {
      setCustomer(response)
    })
  }, [])

  useEffect(() => {
    let amount = JSON.parse(localStorage.getItem('cart'))
    if (amount) {
      setCartAmount(amount.length)
    }
  }, [])

  return (
    <>
      <Nav>
        <Nav.Link href="/cart" className="d-flex align-items-center mx-3">
          <i class="bi bi-cart4 fs-3 position-relative">
            <Badge
              pill
              bg="info"
              className="position-absolute top-0 start-100 translate-middle m-0"
            >
              {cartAmount}
            </Badge>
          </i>
        </Nav.Link>
        <Nav.Link href="/profile" className="px-0">
          <img
            src={customer.customerAvatar}
            width={50}
            alt={customer.customerName}
            className="rounded-circle"
          />
        </Nav.Link>
        <NavDropdown className="my-auto" title={props.username} id="collasible-nav-dropdown">
          <NavDropdown.Item href="/profile">
            <i class="bi bi-gear me-2"></i>Profile
          </NavDropdown.Item>
          <NavDropdown.Item onClick={handleLogout}>
            <i class="bi bi-arrow-bar-right me-2"></i>Logout
          </NavDropdown.Item>
        </NavDropdown>
      </Nav>
    </>
  )
}
