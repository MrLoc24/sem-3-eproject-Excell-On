import React from 'react'
import { useForm } from 'react-hook-form'
import { yupResolver } from '@hookform/resolvers/yup'
import * as Yup from 'yup'
import CustomerService from 'src/service/CustomerService'

function ChangePasswordForm() {
  const customer = JSON.parse(sessionStorage.getItem('customer'));
  const id = customer.id;
  // form validation rules
  const validationSchema = Yup.object().shape({
    password: Yup.string()
      .required('Password is required')
      .min(6, 'Password must be at least 6 characters'),
    confirmPassword: Yup.string()
      .required('Confirm Password is required')
      .oneOf([Yup.ref('password')], 'Passwords must match'),
  })
  const formOptions = { resolver: yupResolver(validationSchema) }

  // get functions to build form with useForm() hook
  const { register, handleSubmit, reset, formState } = useForm(formOptions)
  const { errors } = formState

  function onSubmit(data) {
    // display form data on success
    CustomerService.ChangePassword(id, data.password)
      .then((response) => {
        alert(response.message)
        window.location.reload()
      })
      .catch(function (error) {
        if (error.response) {
          console.log('Server responded with status code:', error.response.status)
          console.log('Response data:', error.response.data)
        } else if (error.request) {
          console.log('No response received:', error.request)
        } else {
          console.log('Error creating request:', error.message)
        }
      })
  }

  return (
    <div className="card m-3">
      <h5 className="card-header">Password and Confirm Password</h5>
      <div className="card-body">
        <form onSubmit={handleSubmit(onSubmit)} encType="multipart/form-data">
          <div className="form-row">
            <div className="form-group col">
              <label>Password</label>
              <input
                name="password"
                type="password"
                {...register('password')}
                className={`form-control ${errors.password ? 'is-invalid' : ''}`}
              />
              <div className="invalid-feedback">{errors.password?.message}</div>
            </div>
            <div className="form-group col">
              <label>Confirm Password</label>
              <input
                name="confirmPassword"
                type="password"
                {...register('confirmPassword')}
                className={`form-control ${errors.confirmPassword ? 'is-invalid' : ''}`}
              />
              <div className="invalid-feedback">{errors.confirmPassword?.message}</div>
            </div>
          </div>
          <div className="form-group">
            <button type="submit" className="btn btn-primary mr-1">
              Submit
            </button>
            <button type="button" onClick={() => reset()} className="btn btn-secondary m-lg-4">
              Clear
            </button>
          </div>
        </form>
      </div>
    </div>
  )
}

export default ChangePasswordForm
