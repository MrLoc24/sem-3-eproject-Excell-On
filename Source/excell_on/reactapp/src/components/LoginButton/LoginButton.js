import React from 'react'
import {Nav, Button} from 'react-bootstrap'


export default function LoginButton() {
  return (
    <>
      <Nav>
        <Nav.Link href="/login">
          <Button variant="primary">Login</Button>
        </Nav.Link>
        <Nav.Link eventKey={2} href="/register">
          <Button variant="outline-primary">Register</Button>
        </Nav.Link>
      </Nav>
    </>
  )
}
