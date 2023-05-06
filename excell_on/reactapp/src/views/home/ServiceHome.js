import React, { useState, useEffect } from 'react'
import ServiceService from 'src/service/ServiceService'
import './Card.css'
const ServiceHome = () => {
  const [serviceCard, setServiceCard] = useState([])
  useEffect(() => {
    ServiceService.GetAll().then((response) => {
      setServiceCard(response.responseObject)
    })
  }, [])
  return (
    <div className="container-fluid d-flex justify-content-center">
      <div className="row pt-2">
        {/* Card image */}
        {serviceCard.map((ser, idx) => (
          <div className="card card-service mx-4 text-center" key={idx}>
            <img className="card-img-top" src={ser.serviceImage} alt={idx} />
            <div className="card-body d-flex flex-column justify-content-between">
              <div>
                <h5 className="card-title">{ser.serviceName}</h5>
                <p className="card-text">{ser.serviceDescription}</p>
              </div>
              <div>
                <a href="#" className="btn btn-primary">
                  Learn More
                </a>
              </div>
            </div>
          </div>
        ))}
      </div>
    </div>
  )
}
export default ServiceHome
