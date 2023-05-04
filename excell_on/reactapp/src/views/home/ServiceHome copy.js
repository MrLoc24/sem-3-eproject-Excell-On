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
    <>
      <div className="container-fluid d-flex justify-content-center">
        <div className="row">
          {/* Card image */}
          {serviceCard.map((ser, idx) => (
            <div className="col-md-4" key={idx}>
              <div className="card text-center">
                <div className="overflow">
                  <img src="/image/tlemarket.jpg" className="card-img-top"></img>
                </div>
                <div className="card-body text-dark">
                  <a href="#" className="btn btn-outline-success">
                    Go to details
                  </a>
                  <h4 className="card-title">{ser.serviceName}</h4>
                  <p className="card-text text-secondary">{ser.description}</p>
                </div>
              </div>
            </div>
          ))}
        </div>
      </div>
    </>
  )
}
export default ServiceHome
