import React, { useState, useEffect } from 'react'
import { useParams } from 'react-router-dom'
import StaffService from 'src/service/StaffService'
import ServiceService from 'src/service/ServiceService'

const StaffDetailProfile = () => {
  const { id } = useParams()
  const [state, setState] = useState([])
  const [departmentId, setDepartment] = useState('')
  const [departmentMap, setDepartmentMap] = useState([])
  const [serviceId, setServiceId] = useState('')
  const [serviceMap, setServiceMap] = useState([])
  useEffect(() => {
    StaffService.GetDepartment().then((res) => {
      setDepartmentMap(res)
    })
  }, [])
  useEffect(() => {
    ServiceService.GetAll().then((res) => {
      setServiceMap(res.responseObject)
    })
  }, [])
  useEffect(() => {
    StaffService.GetById(id).then((response) => {
      setState(response)
    })
  }, [])
  const handleInputChange = (e) => {
    const { name, value } = e.target
    setState((prevState) => ({
      ...prevState,
      [name]: parseInt(value) ?? value,
    }))
  }
  const handleSubmit = (e) => {
    e.preventDefault()
    StaffService.UpdateProfile(id, state)
      .then((response) => {
        alert(response.message)
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
            <div className="form-group">
              <label htmlFor="department">Gender</label>
              <select
                className="form-control"
                id="gender"
                name="staffGender"
                onChange={handleInputChange}
              >
                <option value={1}>Male</option>
                <option value={0}>Female</option>
              </select>
            </div>
            <div className="form-group">
              <label htmlFor="department">Department</label>
              <select
                className="form-control"
                id="department"
                name="departmentId"
                value={state.departmentId}
                onChange={handleInputChange}
              >
                {departmentMap.map((item, index) => (
                  <option key={index} value={parseInt(item.id)}>
                    {item.name}
                  </option>
                ))}
              </select>
            </div>
            <div className="form-group">
              <label htmlFor="department">Service</label>
              <select
                className="form-control"
                id="service"
                name="serviceId"
                value={state.serviceId}
                onChange={handleInputChange}
              >
                {serviceMap.map((item, index) => (
                  <option key={index} value={parseInt(item.id)}>
                    {item.serviceName}
                  </option>
                ))}
              </select>
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
export default StaffDetailProfile
