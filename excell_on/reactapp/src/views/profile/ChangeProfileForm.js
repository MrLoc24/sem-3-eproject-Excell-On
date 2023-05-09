import React, { useState, useEffect } from 'react'
import { useParams } from 'react-router-dom'
import CustomerService from 'src/service/CustomerService'

const ChangProfileForm = () => {
  const customer = JSON.parse(sessionStorage.getItem('customer'));
  const id = customer.id;
  const [state, setState] = useState([])
  useEffect(() => {
    CustomerService.GetById(id).then((response) => {
      setState(response)
    })
  }, [])
  const handleInputChange = (e) => {
    const { name, value } = e.target
    setState((prevState) => ({
      ...prevState,
      [name]: value,
    }))
  }
  const handleSubmit = (e) => {
    e.preventDefault()
    CustomerService.UpdateProfile(id, state)
      .then((response) => {
        console.log(response.message)
      })
      .catch((err) => {
        console.error(err.message)
      })
  }
  console.log(state)
  return (
    <>
      <div className="card card-primary">
        <div className="card-header d-flex">
          <img src={state.customerAvatar} width={100} alt='Not found'className='rounded-circle'/>
          <h3 className="ms-3 card-title d-flex align-items-center">{state.customerUserName}</h3>
        </div>
        {/* <!-- /.card-header -->
              <!-- form start --> */}
        <form encType="multipart/form-data" onSubmit={handleSubmit}>
          <div className="card-body">
            <div className="form-group">
              <label>Full Name</label>
              <input
                type="text"
                className="form-control"
                name="customerName"
                value={state.customerName || ''}
                onChange={handleInputChange}
              />
            </div>
            <div className="form-group">
              <label>Phone Number</label>
              <input
                type="number"
                className="form-control"
                name="customerPhone"
                value={state.customerPhone || ''}
                onChange={handleInputChange}
              />
            </div>
            <div className="form-group">
              <label htmlFor="phone">Email</label>
              <input
                type="email"
                className="form-control"
                name="customerEmail"
                value={state.customerEmail || ''}
                onChange={handleInputChange}
              />
            </div>
          </div>
          {/* <!-- /.card-body --> */}

          <div>
            <button type="submit" className="btn btn-danger text-white mx-lg-2">
              Submit
            </button>
            <button type="reset" className="btn btn-primary">
              Reset
            </button>
          </div>
        </form>
      </div>
    </>
  )
}
export default ChangProfileForm
