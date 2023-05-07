import React from 'react'
import {Nav, NavDropdown, Button} from 'react-bootstrap'
import LoginCustomerService from 'src/service/LoginCustomerService'

export default function CartUser(props) {
  const handleLogout = () => {
    LoginCustomerService.logout();
    window.location.reload();
  }

  return (
    <>
      <Nav>
        <Nav.Link href="#/cart">
          <a>
            <i class="bi bi-cart4"></i>
          </a>
        </Nav.Link>
        <NavDropdown title={props.username} id="collasible-nav-dropdown">
          <NavDropdown.Item href="#" key="1">
            Item
          </NavDropdown.Item>
        </NavDropdown>
        <Nav.Link>
          <Button variant="outline-secondary" onClick={handleLogout}>Logout</Button>
        </Nav.Link>
      </Nav>
    </>
  )
}
