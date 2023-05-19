import React, { useState, useEffect } from 'react'
import { Card, Button } from 'react-bootstrap'
import { Breadcrumb, AboutSection, ContactSection } from 'src/components'
import CustomerService from 'src/service/CustomerService'
import OrderCustomerService from 'src/service/OrderCustomerService'
import DataTable from 'react-data-table-component'
import { useNavigate } from 'react-router-dom'

export default function Checkout() {
  const [customer, setCustomer] = useState({})
  const [order, setOrder] = useState({})
  const [data, setData] = useState([])
  const navigate = useNavigate()

  useEffect(() => {
    let data = JSON.parse(localStorage.getItem('cart'))
    setData(data)
    console.log(data)
  }, [])

  useEffect(() => {
    let id = JSON.parse(sessionStorage.getItem('id'))
    CustomerService.GetById(id).then((response) => {
      setCustomer(response)
      OrderCustomerService.PendingOrder(response.id).then((res) => {
        if (res.id) {
          sessionStorage.setItem('orderId', res.id)
          sessionStorage.setItem('amount', res.orderDetails.length)
          setOrder(res)
        } else {
          OrderCustomerService.InitOrder(response.id).then(() => {
            OrderCustomerService.PendingOrder(response.id).then((res) => {
              sessionStorage.setItem('orderId', res.id)
              sessionStorage.setItem('amount', res.orderDetails.length)
              setOrder(res)
            })
          })
        }
      })
    })
  }, [])
  let newArray = data.map(function (item) {
    let newItem = { ...item }
    delete newItem.department
    delete newItem.price
    delete newItem.Id
    delete newItem.service
    delete newItem.subTotal
    return newItem
  })

  const handleSubmit = (e) => {
    e.preventDefault()
    const total = data.reduce((total, item) => total + item.subTotal, 0)
    const id = sessionStorage.getItem('id')
    console.log(id)
    console.log(total)
    console.log(newArray)
    OrderCustomerService.AddNewOrder(total, id, newArray).then((res) => {
      alert(res.message)
      // localStorage.clear()
      // navigate('/')
      // window.location.reload()
    })
  }

  const columns = [
    {
      name: 'Service',
      selector: (row) => row.service,
      sortable: true,
    },
    {
      name: 'Department',
      selector: (row) => row.department,
      sortable: true,
    },
    {
      name: 'Start Date',
      selector: (row) => row.OrderDetailDateStart,
      sortable: true,
    },
    {
      name: 'End Date',
      selector: (row) => row.OrderDetailDateEnd,
      sortable: true,
    },
    {
      name: 'Number of Employees',
      selector: (row) => row.OrderDetailNumberOfPeople,
      sortable: true,
    },
    {
      name: 'Employee/day Price ($)',
      selector: (row) => row.price,
      sortable: true,
    },
    {
      name: 'Subtotal ($)',
      selector: (row) => row.subTotal,
      sortable: true,
    },
  ]

  return (
    <>
      <Breadcrumb title="Checkout" />
      <div className="container my-5">
        <div className="container d-flex justify-content-center">
          <Card bg="light" text="black" style={{ width: '100%' }} className="mb-2">
            <Card.Header>
              <h5>Customer Detail</h5>
            </Card.Header>
            <Card.Body>
              <Card.Text>Name: {customer.customerName}</Card.Text>
              <Card.Text>Phone: {customer.customerPhone}</Card.Text>
              <Card.Text>Email: {customer.customerEmail}</Card.Text>
            </Card.Body>
          </Card>
          <Card bg="light" text="black" style={{ width: '100%' }} className="mb-2">
            <Card.Header>
              <h5>Order Information</h5>
            </Card.Header>
            <Card.Body>
              <Card.Text>Create Date: {order.orderDateCreate}</Card.Text>
              <Card.Text>
                Total Cost: ${data.reduce((total, item) => total + item.subTotal, 0)}
              </Card.Text>
            </Card.Body>
          </Card>
        </div>
        <div className="container my-4">
          <h3 className="text-center">Order Summary</h3>
          <DataTable columns={columns} data={data} />
        </div>
        <div className="container d-flex justify-content-end">
          <Button variant="primary" onClick={(e) => handleSubmit(e)}>
            Submit Order
          </Button>
        </div>
      </div>
      <AboutSection />
      <ContactSection />
    </>
  )
}
