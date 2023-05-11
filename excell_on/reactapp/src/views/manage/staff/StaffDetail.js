import React, { useState, useEffect } from 'react'
import { useParams } from 'react-router-dom'
import StaffService from 'src/service/StaffService'

const StaffDetail = () => {
  const { id } = useParams()
  const [state, setState] = useState([])
  useEffect(() => {
    StaffService.GetById(id).then((response) => {
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
    StaffService.UpdateProfile(id, state)
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
          <h3 className="card-title">{state.staffFullName || ''}</h3>
        </div>
        {/* <!-- /.card-header -->
              <!-- form start --> */}
        <form encType="multipart/form-data" onSubmit={handleSubmit}>
          <div className="card-body">
            <div className="form-group">
              <label>Staff Full Name</label>
              <input
                type="text"
                className="form-control"
                name="staffFullName"
                value={state.staffFullName || ''}
                placeholder="UserName"
                onChange={handleInputChange}
              />
            </div>
            <div className="form-group">
              <label>Age</label>
              <input
                type="number"
                className="form-control"
                name="staffAge"
                value={state.staffAge || ''}
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
                name="staffPhone"
                value={state.staffPhone || ''}
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
                name="staffEmail"
                value={state.staffEmail || ''}
                placeholder="Email"
                onChange={handleInputChange}
              />
            </div>
            <div className="form-group">
              <label htmlFor="address">Address</label>
              <input
                type="text"
                className="form-control"
                name="staffAddress"
                id="address"
                value={state.staffAddress || ''}
                placeholder="Enter address"
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
export default StaffDetail
