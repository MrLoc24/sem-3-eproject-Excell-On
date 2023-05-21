import React, { useState, useEffect } from 'react'
import { useParams } from 'react-router-dom'
import { Breadcrumb } from 'src/components'
import { ContactSection, AboutSection } from 'src/components'
import DataTable from 'react-data-table-component'
import OrderCustomerService from 'src/service/OrderCustomerService'

export default function OrderHistoryDetail() {
  const [data, setData] = useState(false)
  const params = useParams()

  const status = [
    {
      id: 1,
      name: 'Pending'
    },
    {
      id: 2,
      name: 'Unpaid'
    },
    {
      id: 99,
      name: 'Paid'
    },
    {
      id: 3,
      name: 'Deleted'
    },
    {
      id: 0,
      name: 'Empty'
    }
  ]

  useEffect(() => {
    const id = sessionStorage.getItem('id')
    OrderCustomerService.GetById(id).then((response) => {
      const arrayData = response.filter((item) => item.id == params.id);
      setData(arrayData[0])
    })
  }, [])

  const columns = [
    {
      name: 'Index',
      selector: (row) => data.orderDetails.indexOf(row) + 1,
      sortable: true,
    },
    {
      name: 'Service',
      selector: (row) => row.service.serviceName,
      sortable: true,
    },
    {
      name: 'Department',
      selector: (row) => row.department.name,
      sortable: true,
    },
    {
      name: 'Date Start',
      selector: (row) => row.orderDetailDateStart,
      sortable: true,
    },
    {
      name: 'Date End',
      selector: (row) => row.orderDetailDateEnd,
      sortable: true,
    },
    {
      name: 'Number of Employees',
      selector: (row) => row.orderDetailNumberOfPeople,
      sortable: true,
    },
    {
      name: 'Employee/day Price ($)',
      selector: (row) => row.service.servicePrice,
      sortable: true,
    },
    {
      name: 'Subtotal',
      selector: (row) => row.service.servicePrice * row.orderDetailNumberOfPeople,
      sortable: true,
    }
  ]

  return (
    <>
      <Breadcrumb title="Order Details" />
      <div className="container-fluid">
        {data && <DataTable columns={columns} data={data.orderDetails} />}
        <div className='container text-end my-2'>
          <p>Total Cost: ${data.orderTotalCost}</p>
          <a href='/history' className='btn btn-primary px-3 py-1'>Back</a>
        </div>
      </div>
      <AboutSection />
      <ContactSection />
    </>
  )
}
