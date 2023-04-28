import React, { useState, useEffect } from 'react'
import { useParams } from 'react-router-dom'
import ServiceService from 'src/service/ServiceService'
const ServiceDetail = () => {
  const { id } = useParams()
  const [serviceDetail, setServiceDetail] = useState([])
  useEffect(() => {
    ServiceService.GetById(id).then((response) => {
      let serviceDetail = response
      setServiceDetail(serviceDetail)
    })
  }, [])
  const handleInputChange = (e) => {
    let { name, value } = e.target
    if (value === 'true' || value === 'false') {
      value = JSON.parse(value)
    }
    setServiceDetail((prevState) => ({
      ...prevState,
      [name]: value,
    }))
  }

  const handleSubmit = (e) => {
    e.preventDefault()
    ServiceService.UpdateById(id, serviceDetail)
      .then(() => {
        console.log('update successfully')
      })
      .catch((err) => {
        console.log(err.message)
      })
  }
  console.log(serviceDetail)
  return (
    <div className="card card-primary">
      <div className="card-header">
        <h3 className="card-title">My Profile</h3>
      </div>
      <form onSubmit={handleSubmit} encType="multipart/form-data">
        <div className="card-body">
          <div className="form-group">
            <label>
              Service id:
              <input
                type="text"
                value={serviceDetail.id || ''}
                onChange={handleInputChange}
                name="id"
                readOnly
              />
            </label>
          </div>

          <div className="form-group">
            <label>
              Service Name:
              <input
                type="text"
                value={serviceDetail.serviceName || ''}
                onChange={handleInputChange}
                name="serviceName"
              />
            </label>
          </div>
          <div className="form-group">
            <label>
              Service Description
              <textarea
                type="textarea"
                value={serviceDetail.serviceDescription || ''}
                onChange={handleInputChange}
                name="serviceDescription"
              />
            </label>
          </div>
          <div className="form-group">
            <label>
              Service Price
              <input
                type="text"
                value={serviceDetail.servicePrice || ''}
                onChange={handleInputChange}
                name="servicePrice"
              />
            </label>
          </div>
          <div className="form-group">
            <label>
              Service Status
              <select name="deleted" onChange={handleInputChange} value={serviceDetail.deleted}>
                <option value={true}>Yes</option>
                <option value={false}>No</option>
              </select>
            </label>
          </div>
          <div className="form-group">
            <label>
              Service Name:
              <input
                type="text"
                value={serviceDetail.serviceImage || ''}
                onChange={handleInputChange}
                name="serviceImage"
              />
            </label>
          </div>
          <div className="form-group">
            <button className="btn-danger" type="submit">
              UpdateById
            </button>
          </div>
        </div>
      </form>
    </div>
  )
}
export default ServiceDetail
