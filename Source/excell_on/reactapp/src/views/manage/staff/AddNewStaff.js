import React, { useState, useEffect } from 'react'
import StaffService from 'src/service/StaffService'
import axios from 'axios'
import ServiceService from 'src/service/ServiceService'
const AddNewStaff = () => {
  const [staffFullName, setStaffFullName] = useState('')
  const [staffEmail, setStaffEmail] = useState('')
  const [staffPhone, setStaffPhone] = useState('')
  const [staffAge, setStaffAge] = useState('')
  const [staffAddress, setStaffAddress] = useState('')
  const [staffGender, setStaffGender] = useState('')
  const [uploadFile, setUploadFile] = useState('')
  const [departmentId, setDepartment] = useState('')
  const [departmentMap, setDepartmentMap] = useState([])
  const [serviceId, setServiceId] = useState('')
  const [serviceMap, setServiceMap] = useState([])
  const handleSubmit = (e) => {
    e.preventDefault()
    const formData = new FormData()
    formData.append('file', uploadFile)
    formData.append('upload_preset', 'Group2project3')

    axios
      .post('https://api.cloudinary.com/v1_1/locnguyen2409/image/upload', formData)
      .then((response) => {
        let staffAvatar = response.data.secure_url
        StaffService.AddNew({
          staffFullName,
          staffEmail,
          staffPhone,
          staffAge,
          staffAddress,
          staffAvatar,
          staffGender,
          serviceId,
          departmentId,
        }).then((res) => alert(res.message))
      })
      .catch((error) => {
        console.log(error)
      })
  }
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
  return (
    <>
      <div className="card card-primary">
        <div className="card-header">
          <h3 className="card-title">Staff Profile</h3>
        </div>
        {/* <!-- /.card-header -->
              <!-- form start --> */}
        <form encType="multipart/form-data" onSubmit={handleSubmit}>
          <div className="card-body">
            <div className="form-group">
              <label htmlFor="fullName">Staff Full Name</label>
              <input
                type="text"
                className="form-control"
                name="staffFullName"
                id="fullName"
                placeholder="Full name"
                onChange={(e) => setStaffFullName(e.target.value)}
              />
            </div>
            <div className="form-group">
              <label>Age</label>
              <input
                type="number"
                className="form-control"
                name="staffAge"
                placeholder="Age"
                onChange={(e) => setStaffAge(e.target.value)}
              />
            </div>
            <div className="form-group">
              <label htmlFor="phone">Phone</label>
              <input
                type="number"
                className="form-control"
                id="phone"
                name="staffPhone"
                placeholder="Phone"
                onChange={(e) => setStaffPhone(e.target.value)}
              />
            </div>
            <div className="form-group">
              <label htmlFor="email">Email</label>
              <input
                type="email"
                className="form-control"
                id="email"
                name="staffEmail"
                placeholder="Email"
                onChange={(e) => setStaffEmail(e.target.value)}
              />
            </div>
            <div className="form-group">
              <label htmlFor="address">Address</label>
              <input
                type="text"
                className="form-control"
                name="staffAddress"
                id="address"
                placeholder="Enter address"
                onChange={(e) => setStaffAddress(e.target.value)}
              />
            </div>
            <div className="form-group">
              <label htmlFor="department">Gender</label>
              <select
                className="form-control"
                id="gender"
                name="staffGender"
                onChange={(e) => setStaffGender(parseInt(e.target.value, 10))}
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
                name="staffDepartment"
                onChange={(e) => setDepartment(parseInt(e.target.value, 10))}
              >
                {departmentMap.map((item, index) => (
                  <option key={index} value={item.id}>
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
                name="service"
                onChange={(e) => setServiceId(parseInt(e.target.value, 10))}
              >
                {serviceMap.map((item, index) => (
                  <option key={index} value={item.id}>
                    {item.serviceName}
                  </option>
                ))}
              </select>
            </div>
            <div className="form-group">
              <label htmlFor="avatar">Staff Avatar</label>
              <input
                className="form-control"
                id="avatar"
                type="file"
                onChange={(event) => {
                  setUploadFile(event.target.files[0])
                }}
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
export default AddNewStaff
