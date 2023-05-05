import React, { useState, useEffect } from 'react'
import ServiceService from 'src/service/ServiceService'
import './Card.css'
const ServiceHome = () => {
  const [serviceCard, setServiceCard] = useState([])
  useEffect(() => {
    ServiceService.GetAll().then((response) => {
      const data = response.responseObject.map((ser) => {
        return {
          serviceName: ser.serviceName,
          description: ser.serviceDescription,
          id: ser.id,
        }
      })
      let serviceCard = data
      setServiceCard(serviceCard)
    })
  }, [])
  return (
      <div className="container-fluid d-flex justify-content-center">
        <div className="row pt-2">
          {/* Card image */}
          {serviceCard.map((ser, idx) => (
            <div class="card card-service mx-4 text-center" key={idx}>
              <img class="card-img-top" src="image/bg-1.jpg" alt={idx} />
              <div class="card-body d-flex flex-column justify-content-between">
                <div>
                  <h5 class="card-title">{ser.serviceName}</h5>
                  <p class="card-text">{ser.description}</p>
                </div>
                <div>
                  <a href="#" class="btn btn-primary">
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
