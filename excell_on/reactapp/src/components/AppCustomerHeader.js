import React, { useState, useEffect } from 'react'
import Container from 'react-bootstrap/Container'
import Nav from 'react-bootstrap/Nav'
import Navbar from 'react-bootstrap/Navbar'
import NavDropdown from 'react-bootstrap/NavDropdown'
import ServiceService from 'src/service/ServiceService'
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
    <Navbar collapseOnSelect expand="lg" bg="primary" variant="dark" fixed="top">
      <Container>
        <Navbar.Brand href="/">Excell-On</Navbar.Brand>
        <Navbar.Toggle aria-controls="responsive-navbar-nav" />
        <Navbar.Collapse id="responsive-navbar-nav">
          <Nav className="justify-content-end flex-grow-1 pe-3">
            <Nav.Link href="/">Home</Nav.Link>
            <Nav.Link href="#/about">About Us</Nav.Link>
            <NavDropdown title="Service" id="collasible-nav-dropdown">
              {services.map((ser, index) => (
                <NavDropdown.Item href={`service/${ser.id}`} key={index}>
                  {ser.serviceName}
                </NavDropdown.Item>
              ))}
            </NavDropdown>
          </Nav>
          <Nav>
            <Nav.Link href="#deets">Login</Nav.Link>
            <Nav.Link eventKey={2} href="#memes">
              Dank memes
            </Nav.Link>
          </Nav>
        </Navbar.Collapse>
      </Container>
    </Navbar>
  )
}
export default AppCustomerHeader
