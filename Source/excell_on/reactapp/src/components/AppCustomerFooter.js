import React from 'react'
const AppCustomerFooter = () => {
  return (
    <div className="container">
      <footer className="py-5 pb-0">
        <div className="row">
          <div className="col-5">
            <div href="/">
              <img
                src="https://res.cloudinary.com/locnguyen2409/image/upload/v1683466970/Logo-white_gjpric.svg"
                width="200"
                height="80"
                className="d-inline-block align-top"
                alt="React Bootstrap logo"
              />
            </div>
          </div>

          <div className="col-3">
            <h5>Section</h5>
            <ul className="nav flex-column">
              <li className="nav-item mb-2">
                <a href="/" className="nav-link p-0">
                  Home
                </a>
              </li>
              <li className="nav-item mb-2">
                <a href="/service" className="nav-link p-0">
                  Service
                </a>
              </li>
              <li className="nav-item mb-2">
                <a href="/about" className="nav-link p-0">
                  About Us
                </a>
              </li>
              <li className="nav-item mb-2">
                <a href="/contact" className="nav-link p-0">
                  Contact
                </a>
              </li>
            </ul>
          </div>
          <div className="col-4">
            <iframe
              src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d244.95770082073807!2d106.6663077245387!3d10.78653837199133!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752edac37c5025%3A0xd5fab66e51e1049d!2sFPT%20Arena%20Multimedia!5e0!3m2!1svi!2s!4v1684577504209!5m2!1svi!2s"
              width="400"
              height="250"
              style={{ border: '1px' }}
              allowfullscreen=""
              loading="lazy"
              referrerpolicy="no-referrer-when-downgrade"
            ></iframe>
          </div>
        </div>

        <div className="d-flex justify-content-between py-4 my-4 border-top">
          <p>© 2023 Excell-On Service. All rights reserved.</p>
        </div>
      </footer>
    </div>
  )
}
export default AppCustomerFooter
