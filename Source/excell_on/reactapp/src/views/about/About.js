import React from 'react'
import { Breadcrumb } from 'src/components'

const About = () => {
  return (
    <>
      <Breadcrumb title="About"></Breadcrumb>
      <div className="container-fluid my-5">
        <div className="row justify-content-center">
          <div className="col-4 p-0">
            <img src="image/bg.jpg" alt="" width="100%" height="100%" />
          </div>
          <div className="col-4 px-3 d-flex flex-column">
            <h4 className="card-title">About Us</h4>
            <p className="card-text">
              Lorem ipsum dolor sit amet consectetur, adipisicing elit. Nesciunt, perspiciatis
              accusantium culpa veritatis impedit officia distinctio, molestias magnam rem neque
              quas similique fugiat consectetur. Laboriosam tempora alias eaque. Mollitia, magni!
            </p>
          </div>
        </div>
        <div className="row my-4 py-4 bg-dark justify-content-center intro-section text-dark">
          <div className="col-sm-3">
            <div className="card">
              <div className="card-body text-center">
                <h5 className="card-title">About Us</h5>
                <p className="card-text">
                  With supporting text below as a natural lead-in to additional content. Lorem,
                  ipsum dolor sit amet consectetur adipisicing elit. Eius ut culpa praesentium,{' '}
                </p>
              </div>
            </div>
          </div>
          <div className="col-sm-3">
            <div className="card">
              <div className="card-body text-center">
                <h5 className="card-title">About Us</h5>
                <p className="card-text">
                  With supporting text below as a natural lead-in to additional content. Lorem,
                  ipsum dolor sit amet consectetur adipisicing elit. Eius ut culpa praesentium,{' '}
                </p>
              </div>
            </div>
          </div>
          <div className="col-sm-3">
            <div className="card">
              <div className="card-body text-center">
                <h5 className="card-title">About Us</h5>
                <p className="card-text">
                  With supporting text below as a natural lead-in to additional content. Lorem,
                  ipsum dolor sit amet consectetur adipisicing elit. Eius ut culpa praesentium,{' '}
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </>
  )
}
export default About
