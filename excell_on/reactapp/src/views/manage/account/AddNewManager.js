import React, { useState, useEffect } from 'react'
import UserService from 'src/service/UserService'
import axios from 'axios'
const AddNewManager = () => {
  const [userFullName, setUserFullName] = useState('')
  const [userName, setUserName] = useState('')
  const [userEmail, setUserEmail] = useState('')
  const [userPhone, setUserPhone] = useState('')
  const [userAge, setUserAge] = useState('')
  const [userAddress, setUserAddress] = useState('')
  const [uploadFile, setUploadFile] = useState('')
  const [userAvatar, setUserAvatar] = useState('')
  const [role, setRole] = useState('')
  const [roleMap, setRoleMap] = useState([])
  const [data, setData] = useState([])

  const handleSubmit = async (e) => {
    e.preventDefault()
    const formData = new FormData()
    formData.append('file', uploadFile)
    formData.append('upload_preset', 'Group2project3')

    axios
      .post('https://api.cloudinary.com/v1_1/locnguyen2409/image/upload', formData)
      .then((response) => {
        setUserAvatar(response.data.secure_url)
        console.log(userAvatar)
      })
      .catch((error) => {
        console.log(error)
      })

    setData({
      userName,
      userFullName,
      userEmail,
      userPhone,
      userAge,
      userAddress,
      userAvatar,
      role,
    })
    console.log(data)
    UserService.AddNew(data).then((res) => alert(res.message))
  }
  useEffect(() => {
    UserService.GetRoles().then((res) => {
      setRoleMap(res)
      console.log(roleMap)
    })
  }, [])
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
                placeholder="UserName"
                onChange={(e) => setUserName(e.target.value)}
              />
            </div>
            <div className="form-group">
              <label>Age</label>
              <input
                type="number"
                className="form-control"
                name="userAge"
                placeholder="Age"
                onChange={(e) => setUserAge(e.target.value)}
              />
            </div>
            <div className="form-group">
              <label htmlFor="phone">Phone</label>
              <input
                type="number"
                className="form-control"
                id="phone"
                name="userPhone"
                placeholder="Phone"
                onChange={(e) => setUserPhone(e.target.value)}
              />
            </div>
            <div className="form-group">
              <label htmlFor="email">Email</label>
              <input
                type="email"
                className="form-control"
                id="email"
                name="userEmail"
                placeholder="Email"
                onChange={(e) => setUserEmail(e.target.value)}
              />
            </div>
            <div className="form-group">
              <label htmlFor="address">Address</label>
              <input
                type="text"
                className="form-control"
                name="userAddress"
                id="address"
                placeholder="Enter address"
                onChange={(e) => setUserAddress(e.target.value)}
              />
            </div>
            <div className="form-group">
              <label htmlFor="fullName">User Full Name</label>
              <input
                type="text"
                className="form-control"
                name="userFullName"
                id="fullName"
                placeholder="Full name"
                onChange={(e) => setUserFullName(e.target.value)}
              />
            </div>
            <div className="form-group">
              <label htmlFor="role">Role</label>
              <select id="country" name="country" onChange={(e) => setRole(e.target.value)}>
                {roleMap.map((item, index) => (
                  <option key={index} value={item.role1}>
                    {item.role1}
                  </option>
                ))}
              </select>
            </div>
            <div className="form-group">
              <label htmlFor="avatar">User Avatar</label>
              <input
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
export default AddNewManager
