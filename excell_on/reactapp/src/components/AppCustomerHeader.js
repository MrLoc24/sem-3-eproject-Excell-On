import React, { useState, useEffect } from 'react'
import ServiceService from 'src/service/ServiceService'
import { Nav, Navbar, NavDropdown, Container } from 'react-bootstrap'
import { CartUser } from './CartUser'
import { LoginButton } from './LoginButton'
import { useNavigate } from 'react-router-dom'

const AppCustomerHeader = () => {
  let navigate = useNavigate()
  const [services, setService] = useState([])
  const [customer, setCustomer] = useState({})
  const [show, setShow] = useState(false)
  useEffect(() => {
    ServiceService.GetAll().then((response) => {
      setService(response.responseObject)
    })
  }, [])

  useEffect(() => {
    if (sessionStorage.getItem('customer')) {
      setCustomer(JSON.parse(sessionStorage.getItem('customer')))
      setShow(true)
    }
  }, [])

  return (
    <Navbar collapseOnSelect expand="lg" bg="white" variant="white" fixed="top" className="mb-5">
      <Container>
        <Navbar.Brand href="/">
          <img
            src="https://res.cloudinary.com/locnguyen2409/image/upload/v1683466970/Logo_vqh3kn.svg"
            width="200"
            height="80"
            className="d-inline-block align-top"
            alt="React Bootstrap logo"
          />
        </Navbar.Brand>
        <Navbar.Toggle aria-controls="responsive-navbar-nav" />
        <Navbar.Collapse id="responsive-navbar-nav">
          <Nav className="justify-content-center flex-grow-1 pe-3">
            <Nav.Link href="/">Home</Nav.Link>
            <NavDropdown title="Service" id="collasible-nav-dropdown">
              {services.map((ser, index) => (
                <NavDropdown.Item href={`#/service/${ser.id}`} key={index}>
                  {ser.serviceName}
                </NavDropdown.Item>
              ))}
            </NavDropdown>
            <Nav.Link href="/about">About Us</Nav.Link>
            <Nav.Link href="/contact">Contact</Nav.Link>
          </Nav>
          {show && <CartUser username={customer.customerName || 'No name'} />}
          {!show && <LoginButton />}
        </Navbar.Collapse>
      </Container>
    </Navbar>
  )
}
export default AppCustomerHeader
