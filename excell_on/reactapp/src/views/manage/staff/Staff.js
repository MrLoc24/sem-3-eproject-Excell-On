import React, { useState, useEffect } from 'react'
import StaffService from 'src/service/StaffService'
import Page401 from 'src/views/pages/page401/Page401'
import DataTable from 'react-data-table-component'

const AdminCustomer = () => {
  const [state, setState] = useState([])
  const [error, setError] = useState()
  useEffect(() => {
    StaffService.GetAll()
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
      name: 'Id',
      selector: (row) => row.id,
      sortable: true,
    },
    {
      name: 'Name',
      selector: (row) => row.staffFullName,
      sortable: true,
    },
    {
      name: 'Service',
      selector: (row) => row.service.serviceName,
      sortable: true,
    },
    {
      name: 'Email',
      selector: (row) => row.staffEmail,
      sortable: true,
    },
    {
      name: 'Phone',
      selector: (row) => row.staffPhone,
      sortable: true,
    },
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
  ]
  return (
    <>
      <DataTable columns={columns} data={state} pagination />
    </>
  )
}
export default AdminCustomer
