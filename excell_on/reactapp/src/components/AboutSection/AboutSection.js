import React from 'react'

export default function AboutSection() {
  return (
    <div>
        <div className="intro-section p-3">
          <div className="row justify-content-center">
            <div className="col-4">
              <img src="https://res.cloudinary.com/locnguyen2409/image/upload/v1683600487/about_j4urfy.png" width={300}/>
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
  )
}
