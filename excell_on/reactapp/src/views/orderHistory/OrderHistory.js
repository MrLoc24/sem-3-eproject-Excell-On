import React, { useEffect, useState } from 'react'
import { Breadcrumb, AboutSection, ContactSection } from 'src/components'
import OrderCustomerService from 'src/service/OrderCustomerService'
import DataTable from 'react-data-table-component'
import { useNavigate } from 'react-router-dom'

export default function OrderHistory() {
  const [data, setData] = useState(false)
  const navigate = useNavigate()

  useEffect(() => {
    const id = sessionStorage.getItem('id');
    OrderCustomerService.GetById(id).then((response) => {
      setData(response)
    })
  }, [])

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


  const columns = [
    {
      name: 'Index',
      selector: (row) => data.indexOf(row) + 1,
      sortable: true,
    },
    {
      name: 'Order Id',
      selector: (row) => row.id,
      sortable: true,
    },
    {
      name: 'Create Date',
      selector: (row) => row.orderDateCreate,
      sortable: true,
    },
    {
      name: 'Description',
      selector: (row) => row.orderDescription,
      sortable: true,
    },
    {
      name: 'Total Cost ($)',
      selector: (row) => row.orderTotalCost,
      sortable: true,
    },
    {
      name: 'Order Status',
      selector: (row) => status.find((item) => item.id === row.orderStatus).name,
      sortable: true,
    },
    {
      name: 'Action',
      cell: (row) => (
        <>
          <a className="btn btn-danger" href={`/detailHistory/${row.id}`}>
            Detail
          </a>
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
      <Breadcrumb title="Order History" />
      <div className="container">
        {data && <DataTable columns={columns} data={data} pagination />}
      </div>
      <AboutSection />
      <ContactSection />
    </>
  )
}
