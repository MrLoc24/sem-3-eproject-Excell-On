import React from 'react'
import Col from 'react-bootstrap/Col'
import Nav from 'react-bootstrap/Nav'
import Row from 'react-bootstrap/Row'
import Tab from 'react-bootstrap/Tab'

import ChangePasswordForm from './ChangePasswordForm'
import ChangProfileForm from './ChangeProfileForm'
import ChangeAvatar from './ChangeAvatar'
const MyProfile = () => {
  return (
    <Tab.Container id="left-tabs-example" defaultActiveKey="first">
      <Row>
        <Col sm={3}>
          <Nav variant="pills" className="flex-column">
            <Nav.Item>
              <Nav.Link eventKey="first">My Profile</Nav.Link>
            </Nav.Item>
            <Nav.Item>
              <Nav.Link eventKey="second">Change Password</Nav.Link>
            </Nav.Item>
            <Nav.Item>
              <Nav.Link eventKey="third">Change Profile Image</Nav.Link>
            </Nav.Item>
          </Nav>
        </Col>
        <Col sm={9}>
          <Tab.Content>
            <Tab.Pane eventKey="first">
              <ChangProfileForm />
            </Tab.Pane>
            <Tab.Pane eventKey="second">
              <ChangePasswordForm />
            </Tab.Pane>
            <Tab.Pane eventKey="third">
              <ChangeAvatar />
            </Tab.Pane>
          </Tab.Content>
        </Col>
      </Row>
    </Tab.Container>
  )
}
export default MyProfile
