import React, { useState, useEffect } from 'react'
import { useParams } from 'react-router-dom'
import ServiceService from 'src/service/ServiceService'
import { Breadcrumb } from 'src/components'

export default function ServiceCustomer() {
  const params = useParams()
  const [service, setService] = useState({})
  useEffect(() => {
    ServiceService.GetById(params.id).then((response) => {
      setService(response)
    })
  }, [])

  return (
    <>
      <Breadcrumb title={service.serviceName} />
      <div className="container my-5">
        <div className="row justify-content-center">
          <div className="col-6 p-0 text-center">
            <img src={service.serviceImage} alt={service.serviceName} width="75%" height="300" />
          </div>
          <div className="col-6 px-3 d-flex flex-column justify-content-between">
            <h4 className="card-title">{service.serviceName}</h4>
            <p className="card-text">
              {service.serviceDescription}
            </p>
            <ul>
              <li>Commitment to service quality</li>
              <li>Commitment to qualifications and qualifications of employees</li>
              <li>Commitment to refund if the error arises from the company</li>
            </ul>
            <h5>Price: ${service.servicePrice}/Day (for 1 employee)</h5>
            <div className="container ps-0 ">
              <button type="button" className="btn btn-primary px-4">
                Add to Cart
              </button>
            </div>
          </div>
        </div>
      </div>
    </>
  )
}
