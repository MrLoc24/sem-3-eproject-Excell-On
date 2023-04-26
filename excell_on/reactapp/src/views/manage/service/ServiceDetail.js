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
    const { name, value } = e.target
    setServiceDetail((prevState) => ({
      ...prevState,
      [name]: value,
    }))
  }
  const handleSubmit = (e) => {
    e.preventDefault()
    ServiceService.UpdateById(id, serviceDetail).then(() => {
      window.location.reload()
      console.log('update successfully')
    })
  }
  console.log(serviceDetail)
  return (
    <form onSubmit={handleSubmit}>
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
      <br />
      <label>
        Service Name:
        <input
          type="textarea"
          value={serviceDetail.serviceName || ''}
          onChange={handleInputChange}
          name="serviceName"
        />
      </label>

      <input
        type="text"
        value={serviceDetail.serviceDescription || ''}
        onChange={handleInputChange}
        name="serviceDescription"
      />
      <input
        type="text"
        value={serviceDetail.servicePrice || ''}
        onChange={handleInputChange}
        name="servicePrice"
      />
      <input
        type="text"
        value={serviceDetail.deleted || ''}
        onChange={handleInputChange}
        name="deleted"
      />
      <label>
        Service Name:
        <input
          type="text"
          value={serviceDetail.serviceImage || ''}
          onChange={handleInputChange}
          name="serviceImage"
        />
      </label>
      <button className="btn-danger" type="submit">
        UpdateById
      </button>
    </form>
  )
}
export default ServiceDetail
