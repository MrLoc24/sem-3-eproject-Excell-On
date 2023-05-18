import React, { useState, useEffect } from 'react'
import CustomerService from 'src/service/CustomerService'
import { FormInput } from 'src/components'

const ChangProfileForm = () => {
  const id = JSON.parse(sessionStorage.getItem('id'))
  const [state, setState] = useState([])
  useEffect(() => {
    CustomerService.GetById(id).then((response) => {
      setState(response)
    })
  }, [])

  const inputs = [
    {
      label: 'Full Name',
      name: 'customerName',
      value: state.customerName,
      errorMessage: "Full Name must be at least 3 letters",
      required: true,
      pattern: ".{3,}"
    },
    {
      label: 'Phone Number',
      name: 'customerPhone',
      value: state.customerPhone,
      errorMessage: "Phone number is required",
      required: true,
      type:'tel'
    },
    {
      label: 'Email',
      name: 'customerEmail',
      value: state.customerEmail,
      errorMessage: "Must be email format",
      required: true,
      pattern: '[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$',
      type: "Email"
    },
  ]

  const handleInputChange = (e) => {
    const { name, value } = e.target
    setState((prevState) => ({
      ...prevState,
      [name]: value,
    }))
  }
  const handleSubmit = (e) => {
    e.preventDefault()
    CustomerService.UpdateProfile(id, state)
      .then((response) => {
        console.log(response.message)
        alert("Update successfully!");
        window.location.reload();
      })
      .catch((err) => {
        console.error(err.message)
      })
  }
  console.log(state)
  return (
    <>
      <div className="card card-primary">
        <div className="card-header d-flex">
          <img src={state.customerAvatar} width={100} alt="Not found" className="rounded-circle" />
          <h3 className="ms-3 card-title d-flex align-items-center">{state.customerUserName}</h3>
        </div>
        {/* <!-- /.card-header -->
              <!-- form start --> */}
        <form encType="multipart/form-data" onSubmit={handleSubmit}>
          <div className="card-body">
            {inputs.map((item) => (
              <FormInput 
                label={item.label}
                name={item.name}
                value={item.value}
                onChange={handleInputChange}
                errorMessage={item.errorMessage}
                {...item}
              />
            ))}
          </div>
          {/* <!-- /.card-body --> */}

          <div>
            <button type="submit" className="btn btn-danger text-white mx-lg-2">
              Submit
            </button>
            <button type="reset" className="btn btn-primary">
              Reset
            </button>
          </div>
        </form>
      </div>
    </>
  )
}
export default ChangProfileForm
