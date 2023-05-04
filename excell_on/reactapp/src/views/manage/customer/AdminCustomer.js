import React, { useState, useEffect } from 'react'
import CustomerService from 'src/service/CustomerService'
import Page401 from 'src/views/pages/page401/Page401'
import DataTable from 'react-data-table-component'

const AdminCustomer = () => {
  const [state, setState] = useState([])
  const [error, setError] = useState()
  useEffect(() => {
    CustomerService.GetAll()
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
  const columns = [
    {
      cell: (row) => (
        <button className="btn btn-primary" onClick={(e) => handleButtonClick(e, row.id)}>
          Detail
        </button>
      ),
      ignoreRowClick: true,
      allowOverflow: true,
      button: true,
    },
    {
      name: 'Id',
      selector: (row) => row.id,
      sortable: true,
    },
    {
      name: 'Name',
      selector: (row) => row.customerName,
      sortable: true,
    },
    {
      name: 'Email',
      selector: (row) => row.customerEmail,
      sortable: true,
    },
    {
      name: 'Phone',
      selector: (row) => row.customerPhone,
      sortable: true,
    },
  ]
  return (
    <>
      <DataTable columns={columns} data={state} pagination />
    </>
  )
}
export default AdminCustomer