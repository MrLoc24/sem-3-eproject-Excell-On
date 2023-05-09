import React, { useState, useEffect } from 'react'
import axios from 'axios'
import CustomerService from 'src/service/CustomerService';
const ChangeAvatar = () => {
  const customer = JSON.parse(sessionStorage.getItem('customer'));
  const id = customer.id;
  const [state, setState] = useState([])
  const [uploadFile, setUploadFile] = useState('')
  console.log(id)

  useEffect(() => {
    CustomerService.GetById(id).then((response) => {
      setState(response)
    })
  }, [])

  const handleUpload = (e) => {
    e.preventDefault()
    const formData = new FormData()
    formData.append('file', uploadFile)
    formData.append('upload_preset', 'Group2project3')

    axios
      .post('https://api.cloudinary.com/v1_1/locnguyen2409/image/upload', formData)
      .then((response) => {
        CustomerService.UpdateAvatar(id, response.data.secure_url).then((success) => {
          console.log(success.message)
          alert(success.message)
          window.location.reload()
        })
      })
      .catch((error) => {
        console.log(error)
      })
  }

  return (
    <div>
      <div className="left-side ms-3">
        <img
          className="img-responsive"
          style={{ height: '75px', borderRadius: '5px' }}
          src={state.customerAvatar}
        />
        <br />
        <form>
          <div>
            <input
              className="mt-lg-3"
              type="file"
              onChange={(event) => {
                setUploadFile(event.target.files[0])
              }}
            />
          </div>
          <button className="btn btn-primary mt-lg-3" onClick={handleUpload}>
            Upload File
          </button>
        </form>
        <br />
      </div>
    </div>
  )
}
export default ChangeAvatar
