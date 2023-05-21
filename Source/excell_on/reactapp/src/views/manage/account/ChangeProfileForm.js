import React, { useState, useEffect } from 'react'
import { useParams } from 'react-router-dom'
import UserService from 'src/service/UserService'

const ChangProfileForm = () => {
  const { id } = useParams()
  const [state, setState] = useState([])
  useEffect(() => {
    UserService.GetById(id).then((response) => {
      setState(response)
    })
  }, [])
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
            <div className="form-group">
              <label>User Name</label>
              <input
                type="text"
                className="form-control"
                name="userName"
                value={state.userName || ''}
                placeholder="UserName"
                onChange={handleInputChange}
              />
            </div>
            <div className="form-group">
              <label>Age</label>
              <input
                type="number"
                className="form-control"
                name="userAge"
                value={state.userAge || ''}
                placeholder="Age"
                onChange={handleInputChange}
              />
            </div>
            <div className="form-group">
              <label htmlFor="phone">Phone</label>
              <input
                type="number"
                className="form-control"
                id="phone"
                name="userPhone"
                value={state.userPhone || ''}
                placeholder="Phone"
                onChange={handleInputChange}
              />
            </div>
            <div className="form-group">
              <label htmlFor="email">Email</label>
              <input
                type="email"
                className="form-control"
                id="email"
                name="userEmail"
                value={state.userEmail || ''}
                placeholder="Email"
                onChange={handleInputChange}
              />
            </div>
            <div className="form-group">
              <label htmlFor="address">Address</label>
              <input
                type="text"
                className="form-control"
                name="userAddress"
                id="address"
                value={state.userAddress || ''}
                placeholder="Enter address"
                onChange={handleInputChange}
              />
            </div>
            <div className="form-group">
              <label htmlFor="fullName">User Name</label>
              <input
                type="text"
                className="form-control"
                name="userFullName"
                id="fullName"
                value={state.userFullName || ''}
                placeholder="Full name"
                onChange={handleInputChange}
              />
            </div>
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
