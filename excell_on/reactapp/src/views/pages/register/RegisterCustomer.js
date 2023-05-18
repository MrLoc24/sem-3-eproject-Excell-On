import React, { useState } from 'react'
import { useForm } from 'react-hook-form'
import { yupResolver } from '@hookform/resolvers/yup'
import { useNavigate } from 'react-router-dom'
import * as Yup from 'yup'
import {
  CButton,
  CCard,
  CCardBody,
  CCol,
  CContainer,
  CForm,
  CFormInput,
  CInputGroup,
  CInputGroupText,
  CRow,
} from '@coreui/react'
import CIcon from '@coreui/icons-react'
import { cilLockLocked, cilUser, cilContact, cilPhone, cibMailRu } from '@coreui/icons'
import CustomerService from 'src/service/CustomerService'

const Register = () => {
  const navigate = useNavigate()

  const CustomerSchema = Yup.object().shape({
    customerName: Yup.string().required('Required'),
    customerPhone: Yup.number('Must be number')
      .required('Required')
      .positive('Invalid Phone Number')
      .integer(),
    customerEmail: Yup.string().email('Invalid Email').required('Required'),
    customerUserName: Yup.string()
      .min(3, 'Username must be at least 3 characters')
      .required('Required'),
    customerPassword: Yup.string()
      .required('Password is required')
      .min(3, 'Password must be at least 3 characters'),
    confirmPassword: Yup.string()
      .required('Confirm Password is required')
      .oneOf([Yup.ref('customerPassword')], 'Passwords must match'),
  })

  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm({
    mode: 'onChange',
    resolver: yupResolver(CustomerSchema),
  })

  const onSubmit = (formData) => {
    const data = {
      ...formData,
      customerPhone: formData.customerPhone.toString()
    }
    console.log(data)
    CustomerService.CreateCustomer(data).then(()=>{
      alert("Create Account Successfully!")
      navigate('/login')
      window.location.reload()
    })
  }

  return (
    <div className="bg-light min-vh-100 d-flex flex-row align-items-center">
      <CContainer>
        <CRow className="justify-content-center">
          <CCol md={9} lg={7} xl={6}>
            <CCard className="mx-4">
              <CCardBody className="p-4">
                <CForm onSubmit={handleSubmit(onSubmit)}>
                  <h1 className="text-center">Register</h1>
                  <CInputGroup className="mt-4">
                    <CInputGroupText>
                      <CIcon icon={cilContact} />
                    </CInputGroupText>
                    <CFormInput
                      placeholder="Full Name"
                      autoComplete="fullname"
                      name="customerName"
                      {...register('customerName')}
                    />
                  </CInputGroup>
                  {errors.customerName && (
                    <p className="text-danger">{errors.customerName.message}</p>
                  )}

                  <CInputGroup className="mt-4">
                    <CInputGroupText>
                      <CIcon icon={cilPhone} />
                    </CInputGroupText>
                    <CFormInput
                      placeholder="Phone"
                      autoComplete="phone"
                      name="customerPhone"
                      {...register('customerPhone')}
                    />
                  </CInputGroup>
                  {errors.customerPhone && (
                    <p className="text-danger">{errors.customerPhone.message}</p>
                  )}

                  <CInputGroup className="mt-4">
                    <CInputGroupText>@</CInputGroupText>
                    <CFormInput
                      placeholder="Email"
                      autoComplete="mail"
                      name="customerEmail"
                      {...register('customerEmail')}
                    />
                  </CInputGroup>
                  {errors.customerEmail && (
                    <p className="text-danger">{errors.customerEmail.message}</p>
                  )}

                  <CInputGroup className="mt-4">
                    <CInputGroupText>
                      <CIcon icon={cilUser} />
                    </CInputGroupText>
                    <CFormInput
                      placeholder="Username"
                      autoComplete="username"
                      name="customerUserName"
                      {...register('customerUserName')}
                    />
                  </CInputGroup>
                  {errors.customerUserName && (
                    <p className="text-danger">{errors.customerUserName.message}</p>
                  )}

                  <CInputGroup className="mt-4">
                    <CInputGroupText>
                      <CIcon icon={cilLockLocked} />
                    </CInputGroupText>
                    <CFormInput
                      type="password"
                      placeholder="Password"
                      autoComplete="new-password"
                      name="customerPassword"
                      {...register('customerPassword')}
                    />
                  </CInputGroup>
                  {errors.customerPassword && (
                    <p className="text-danger">{errors.customerPassword.message}</p>
                  )}
                  <CInputGroup className="mt-2">
                    <CInputGroupText>
                      <CIcon icon={cilLockLocked} />
                    </CInputGroupText>
                    <CFormInput
                      type="password"
                      placeholder="Confirm password"
                      autoComplete="new-password"
                      {...register('confirmPassword')}
                    />
                  </CInputGroup>
                  {errors.confirmPassword && (
                    <p className="text-danger">{errors.confirmPassword.message}</p>
                  )}
                  <div className="d-grid mt-4">
                    <CButton color="success" type="submit">
                      Create Account
                    </CButton>
                  </div>
                </CForm>
              </CCardBody>
            </CCard>
          </CCol>
        </CRow>
      </CContainer>
    </div>
  )
}

export default Register
