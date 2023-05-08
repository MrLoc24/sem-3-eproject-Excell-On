import React, { useState, useEffect } from 'react'
import ServiceHome from './ServiceHome'
import MyCompanyService from 'src/service/MyCompanyService'
import { ContactSection } from 'src/components'
// import 'bootstrap/dist/css/bootstrap.min.css'
const Home = () => {
  const [myCompany, setMyCompany] = useState([])
  useEffect(() => {
    MyCompanyService.GetAll().then((response) => {
      const data = response
      console.log(data)
      let myCompany = data.map((company) => {
        return {
          title: company.title,
          myTarget: company.myTarget,
          MyMission: company.myMission,
          myVision: company.myVision,
        }
      })
      console.log(...myCompany)
      setMyCompany(myCompany)
    })
  }, [])
  return (
    <>
      {myCompany.map((company, idx) => (
        <div key={idx}>
          {/* Carousel */}
          <div className="container px-5 mb-4">
            <div className="row justify-content-center">
              <div className="col-xl-5 banner-left">
                <h3 className="text-black mb-3 title">
                  We Offer Best Quality
                  <br />
                  Customer{' '}
                  <span className="type-js">
                    <span className="text-js"> Service! </span>
                  </span>
                </h3>
                <p className="lead text-black">{company.myTarget}</p>
                <div className="mt-5">
                  <a className="btn btn-primary button-spacing py-1 px-2">View Our Service</a>
                </div>
              </div>
              <div className="col-lg-5 w3l-features-photo-7_top-right mt-lg-0 mt-sm-5 mt-4">
                <img
                  src={process.env.PUBLIC_URL + '/image/bg-1.jpg'}
                  className="img-fluid"
                  alt=""
                />
              </div>
            </div>
          </div>
          {/* Intro Section */}
          <div class="intro-section p-5 overlay">
            <h5 class="card-title">{company.title}</h5>
            <p class="card-text w-75 mx-auto">{company.myTarget}</p>
          </div>
          {/* </div> */}
        </div>
      ))}
      {/* Service Section */}
      <div className="container-fluid my-5">
        <h2 className="text-center">OUR SERVICES</h2>
        <ServiceHome />
      </div>

      {/* About Section */}
      <div>
        <div class="intro-section p-5">
          <div className="row justify-content-center">
            <div className="col-4">
              <img src="image/about.png" width={300}/>
            </div>
            <div className="col-4 d-flex flex-column justify-content-center">
              <h5 class="card-title text-start p-1">About Us</h5>
              <p class="card-text w-75 text-start">
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente tempore iusto
                maxime aliquid, deleniti repudiandae vel id et libero nostrum eligendi, magni est
                sed, dolore iste eos culpa molestiae recusandae.
              </p>
            </div>
          </div>
        </div>
      </div>

      <div className="container">
        <ContactSection />
      </div>
    </>
  )
}
export default Home
