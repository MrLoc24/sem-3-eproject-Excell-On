import React, { useState, useEffect } from 'react'
import { useParams } from 'react-router-dom'
import UserService from 'src/service/UserService'
import { FormInput } from 'src/components'

const ChangProfileForm = () => {
  const { id } = useParams()
  const [state, setState] = useState([])
  useEffect(() => {
    UserService.GetById(id).then((response) => {
      setState(response)
    })
  }, [])

  const inputs = [
    {
      label: 'User Name',
      name: 'userName',
      value: state.userName,
      errorMessage: "Username is required",
      required: true
    },
    {
      label: 'Age',
      name: 'userAge',
      value: state.userAge,
      errorMessage: "Age must be equal or greater than 18",
      required: true,
      type: 'number',
      min: '18'
    },
    {
      label: 'Phone',
      name: 'userPhone',
      value: state.userPhone,
      errorMessage: "Phone is required",
      required: true
    },
    {
      label: 'Email',
      name: 'userEmail',
      value: state.userEmail,
      errorMessage: "Email is required",
      required: true,
      id: 'email'
    },
    {
      label: 'Address',
      name: 'userAddress',
      value: state.userAddress,
      errorMessage: "Address is required",
      required: true,
      id: 'adress'
    },
    {
      label: 'Full Name',
      name: 'userFullName',
      value: state.userFullName,
      errorMessage: "Full name is required",
      required: true,
      id: 'fullname'
    }
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
    UserService.UpdateProfile(id, state)
      .then((response) => {
        console.log(response.message)
      })
      .catch((err) => {
        console.error(err.message)
      })
  }
  console.log(state)
  return (
    <>
      <div className="card card-primary">
        <div className="card-header">
          <h3 className="card-title">My Profile</h3>
        </div>
        {/* <!-- /.card-header -->
              <!-- form start --> */}
        <form encType="multipart/form-data" onSubmit={handleSubmit}>
          <div className="card-body">
            {inputs.map((item)=>(
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

          <div className="card-footer">
            <button type="submit" className="btn btn-danger m-lg-2">
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
