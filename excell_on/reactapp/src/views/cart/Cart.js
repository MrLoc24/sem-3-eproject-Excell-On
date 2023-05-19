import React, { useEffect, useState } from 'react'
import { Breadcrumb, AboutSection, ContactSection } from 'src/components'
import DataTable from 'react-data-table-component'
import './Cart.scss'

export default function Cart() {
  const [data, setData] = useState([])

  useEffect(() => {
    let data = JSON.parse(localStorage.getItem('cart'))
    setData(data)
  }, [])

  // const handleButtonClick = (e, id) => {
  //   console.log('to detail')
  // }

  const handleDeleteClick = (e, id) => {
    e.preventDefault();
    setData(data.splice(id, 1));
    localStorage.setItem('cart', JSON.stringify(data));
    window.location.reload();
  }

  const columns = [
    {
      name: 'Index',
      selector: (row) => data.indexOf(row) + 1,
      sortable: true,
    },
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
    {
      name: 'Action',
      cell: (row) => (
        <>
          {/* <button className="btn btn-primary m-lg-1" onClick={(e) => handleButtonClick(e, row.id)}>
              Detail
            </button> */}
          <button className="btn btn-danger" onClick={(e) => handleDeleteClick(e, data.indexOf(row))}>
            Delete
          </button>
        </>
      ),
      ignoreRowClick: true,
      allowOverflow: true,
      width: '180px',
      button: true,
    },
  ]
  return (
    <>
      <Breadcrumb title="Cart" />
      <div className="container-fluid my-5">
        <DataTable columns={columns} data={data} pagination />
        <div className='container'>
          <h4>Summary</h4>
          <h3>Total Cost: {data.reduce((total, item) => total + item.subTotal, 0)}</h3>
          <a type='button' href='/checkout' className='btn btn-primary'>Checkout</a>
        </div>
      </div>
      <AboutSection/>
      <ContactSection/>
    </>
  )
}
