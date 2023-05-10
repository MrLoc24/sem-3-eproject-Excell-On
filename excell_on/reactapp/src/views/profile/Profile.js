import React from 'react'
import {Col, Nav, Row, Tab} from 'react-bootstrap'
import ChangePasswordForm from './ChangePasswordForm'
import ChangProfileForm from './ChangeProfileForm'
import ChangeAvatar from './ChangeAvatar'
import { Breadcrumb } from 'src/components'
import './Profile.scss'

const Profile = () => {
  return (
    <>
    <Breadcrumb title='Profile'/>
    <Tab.Container id="left-tabs-example" defaultActiveKey="first">
      <Row className='m-5'>
        <Col sm={2} className='col-2 d-flex flex-column pe-0 side-bar text-end side-menu'>
          <Nav variant="pills" className="flex-column">
            <Nav.Item >
              <Nav.Link className='side-button mt-4' eventKey="first">Profile</Nav.Link>
            </Nav.Item>
            <Nav.Item>
              <Nav.Link className='side-button mt-3' eventKey="second">Change Password</Nav.Link>
            </Nav.Item>
            <Nav.Item>
              <Nav.Link className='side-button mt-3' eventKey="third">Change Profile Image</Nav.Link>
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
              <ChangeAvatar/>
            </Tab.Pane>
          </Tab.Content>
        </Col>
      </Row>
    </Tab.Container>
    </>
  )
}
export default Profile
