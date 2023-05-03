import React, { useState } from 'react'
import axios from 'axios'
import { useParams } from 'react-router-dom'
import UserService from 'src/service/UserService'
const ChangeAvatar = () => {
  const { id } = useParams()
  const [uploadFile, setUploadFile] = useState('')
  const [cloudinaryImage, setCloudinaryImage] = useState('')
  console.log(id)

  const handleUpload = (e) => {
    e.preventDefault()
    const formData = new FormData()
    formData.append('file', uploadFile)
    formData.append('upload_preset', 'Group2project3')

    axios
      .post('https://api.cloudinary.com/v1_1/locnguyen2409/image/upload', formData)
      .then((response) => {
        setCloudinaryImage(response.data.secure_url)
        UserService.UpdateAvatar(id, response.data.secure_url).then((success) => {
          console.log(success.message)
        })
      })
      .catch((error) => {
        console.log(error)
      })
  }

  return (
    <div className="App">
      <section className="left-side">
        <form>
          <h3> Upload Images to Cloudinary Cloud Storage</h3>

          <div>
            <input
              type="file"
              onChange={(event) => {
                setUploadFile(event.target.files[0])
              }}
            />
          </div>
          <button onClick={handleUpload}> Upload File</button>
        </form>
      </section>

      <section className="right-side">
        <h3>The resulting image will be displayed here</h3>
        {cloudinaryImage && <img src={cloudinaryImage} style={{ height: '50px' }} />}
      </section>
    </div>
  )
}
export default ChangeAvatar
