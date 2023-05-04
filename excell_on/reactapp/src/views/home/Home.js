import React, { useState, useEffect } from 'react'
import ServiceHome from './ServiceHome'
import MyCompanyService from 'src/service/MyCompanyService'
// import 'bootstrap/dist/css/bootstrap.min.css'
const Home = () => {
  const myStyle = {
    paddingLeft: '20px',
    paddingRight: '20px',
    paddingTop: '12px',
    borderRadius: '6px',
    border: '1px white solid',
    paddingBottom: '12px',
  }
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
      console.log(myCompany)
      setMyCompany(myCompany)
    })
  }, [])
  return (
    <>
      {myCompany.map((company, idx) => (
        <div key={idx} className="container-fluid">
        {/* Carousel */}
            <div className="container px-5">
              <div className="row">
                <div className="col-xl-6 banner-left">
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
                    <a className="btn-style-black" style={myStyle}>
                      View Our Service
                    </a>
                  </div>
                </div>
                <div className="col-lg-6 w3l-features-photo-7_top-right mt-lg-0 mt-sm-5 mt-4">
                  <img
                    src={process.env.PUBLIC_URL + '/image/bg-1.jpg'}
                    className="img-fluid"
                    alt=""
                  />
                </div>
              </div>
            </div>
          </div>
          <div className="w3l-features-photo-7 py-5">
            <div className="container py-md-5 py-4">
              <div className="row w3l-features-photo-7_top">
                <div className="col-lg-6 w3l-features-photo-7_top-left pr-lg-5">
                  <h4 className="title-style mb-2">{company.title}</h4>
                  <p>
                    Orci urna. In et augue ornare, tempor massa in, luctus sapien. Proin a diam et
                    dui fermentum dolor molestie vel id neque. Donec sed tempus enim, a congue
                    risus. Pellen tesqu.
                  </p>
                  <div className="row feat_top mt-4 pt-lg-3">
                    <div className="col-6 w3l-features-photo-7-box">
                      <i className="fa fa-thumbs-o-up" aria-hidden="true"></i>
                      <h5 className="w3l-feature-text my-2" style={{ fontSize: 1.6 + 'rem' }}>
                        Our Mission
                      </h5>
                      <p>{company.MyMission}</p>
                    </div>
                    <div className="col-6 w3l-features-photo-7-box">
                      <i className="fa fa-angellist" aria-hidden="true"></i>
                      <h5 className="w3l-feature-text my-2" style={{ fontSize: 1.6 + 'rem' }}>
                        Our Vision
                      </h5>
                      <p>{company.myVision}</p>
                    </div>
                  </div>
                </div>
                <div className="col-lg-6 w3l-features-photo-7_top-right mt-lg-0 mt-sm-5 mt-4">
                  <img
                    src={process.env.PUBLIC_URL + '/image/bg.jpg'}
                    className="img-fluid"
                    alt=""
                  />
                </div>
              </div>
            </div>
          </div>
        </div>
      ))}
      <h1 className="text-center">OUR SERVICES</h1>
      <ServiceHome />
    </>
  )
}
export default Home
