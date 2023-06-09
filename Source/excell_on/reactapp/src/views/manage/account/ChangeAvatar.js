import React, { useState } from 'react'
import axios from 'axios'
import { useParams } from 'react-router-dom'
import UserService from 'src/service/UserService'
const ChangeAvatar = () => {
  const { id } = useParams()
  const [uploadFile, setUploadFile] = useState('')
  console.log(id)

  const handleUpload = (e) => {
    e.preventDefault()
    const formData = new FormData()
    formData.append('file', uploadFile)
    formData.append('upload_preset', 'Group2project3')

    axios
      .post('https://api.cloudinary.com/v1_1/locnguyen2409/image/upload', formData)
      .then((response) => {
        sessionStorage.setItem('avatar', response.data.secure_url)
        UserService.UpdateAvatar(id, response.data.secure_url).then((success) => {
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
    <div className="App">
      <section className="left-side">
        <img
          className="img-responsive"
          style={{ height: '75px', borderRadius: '5px' }}
          src={sessionStorage.getItem('avatar').replace(/^"(.*)"$/, '$1')}
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
      </section>
    </div>
  )
}
export default ChangeAvatar
