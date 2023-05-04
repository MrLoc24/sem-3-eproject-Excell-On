import React, { useState, useEffect } from 'react'
import ServiceService from 'src/service/ServiceService'
import {Button, Nav, Navbar, NavDropdown, Container} from 'react-bootstrap';
const AppCustomerHeader = () => {
  const [services, setService] = useState([])
  useEffect(() => {
    ServiceService.GetAll().then((response) => {
      const data = response.responseObject.map((ser) => {
        return {
          serviceName: ser.serviceName,
          id: ser.id,
        }
      })
      let services = data
      setService(services)
    })
  }, [])

  return (
    <Navbar collapseOnSelect expand="lg" bg="white" variant="white" fixed="top" className='mb-5'>
      <Container>
        <Navbar.Brand href="/">
        <img
              src="image/Logo.svg"
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
            <Nav.Link href="#/about">About Us</Nav.Link>
            <Nav.Link href="#/contact">Contact</Nav.Link>
          </Nav>
          <Nav>
            <Nav.Link href="#/login">
              <Button variant='primary'>Login</Button>
            </Nav.Link>
            <Nav.Link eventKey={2} href="#/register">
              <Button variant='outline-primary'>Register</Button>
            </Nav.Link>
          </Nav>
        </Navbar.Collapse>
      </Container>
    </Navbar>
  )
}
export default AppCustomerHeader
