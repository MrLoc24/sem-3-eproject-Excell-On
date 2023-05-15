import React, { useState, useEffect } from 'react'
import OrderService from 'src/service/OrderService'
import Page401 from 'src/views/pages/page401/Page401'
import DataTable from 'react-data-table-component'
import { useNavigate } from 'react-router-dom'

const AdminOrder = () => {
  const [state, setState] = useState([])
  const [error, setError] = useState()
  useEffect(() => {
    OrderService.GetAll()
      .then((response) => {
        setState(response.responseObject)
      })
      .catch((err) => {
        setError(err)
        console.log(error)
      })
  }, [])
  if (error) {
    return <Page401 />
  }
  const handleDeleteClick = (e, id) => {
    e.preventDefault()
    confirm('Are you sure you want to delete')
    OrderService.DeleteOrder(id).then((res) => {
      alert(res.message)
      window.location.reload()
    })
  }
  let navigate = useNavigate()
  const handleButtonClick = (e, id) => {
    e.preventDefault()
    navigate(`/admin/manage/order/${id}`)
  }
  const columns = [
    {
      name: 'Id',
      selector: (row) => row.id,
      sortable: true,
    },
    {
      name: 'Customer Name',
      selector: (row) => row.customer.customerName,
      sortable: true,
    },
    {
      name: 'Cost',
      selector: (row) => row.orderTotalCost,
      sortable: true,
    },
    {
      name: 'Status',
      selector: (row) => {
        switch (row.orderStatus) {
          case 0:
            return 'Pending'
          case 1:
            return 'Activated'
          case 2:
            return 'Completed'
          case 3:
            return 'Deleted'
          case 99:
            return 'Money Transferred'
        }
      },
      sortable: true,
    },
    {
      cell: (row) => (
        <>
          <button className="btn btn-primary m-lg-1" onClick={(e) => handleButtonClick(e, row.id)}>
            Detail
          </button>
          <button className="btn btn-danger" onClick={(e) => handleDeleteClick(e, row.id)}>
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
  return <DataTable columns={columns} data={state} pagination />
}
export default AdminOrder
