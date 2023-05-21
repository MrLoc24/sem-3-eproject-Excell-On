import React, { useState, useEffect } from 'react'
import StaffService from 'src/service/StaffService'
import Page401 from 'src/views/pages/page401/Page401'
import DataTable from 'react-data-table-component'
import { useNavigate } from 'react-router-dom'
import Tab from 'react-bootstrap/Tab'
import Tabs from 'react-bootstrap/Tabs'
import AddNewStaff from './AddNewStaff'

const AdminStaff = () => {
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
  const handleDeleteClick = (e, id) => {
    e.preventDefault()
    confirm('Are you sure you want to delete')
    StaffService.Delete(id).then((res) => {
      alert(res.message)
      window.location.reload()
    })
  }
  const handleActivateClick = (e, id) => {
    e.preventDefault()
    confirm('Sure ????')
    StaffService.Activate(id).then((res) => {
      alert(res.message)
      window.location.reload()
    })
  }
  let navigate = useNavigate()
  const handleButtonClick = (e, id) => {
    e.preventDefault()
    navigate(`/admin/manage/staff/${id}`)
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
      name: 'Department',
      selector: (row) => (row.department.name ? row.department.name : 'Not available'),
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
      name: 'Status',
      selector: (row) => (row.deleted ? 'Inactive' : 'Active'),
      sortable: true,
    },
    {
      cell: (row) => (
        <>
          <button className="btn btn-primary m-lg-1" onClick={(e) => handleButtonClick(e, row.id)}>
            Detail
          </button>
          {!row.deleted ? (
            <button className="btn btn-danger" onClick={(e) => handleDeleteClick(e, row.id)}>
              Delete
            </button>
          ) : (
            <button className="btn btn-success" onClick={(e) => handleActivateClick(e, row.id)}>
              Active
            </button>
          )}
        </>
      ),
      ignoreRowClick: true,
      allowOverflow: true,
      width: '180px',
      button: true,
    },
  ]
  return (
    <Tabs defaultActiveKey="home" id="uncontrolled-tab-example" className="mb-3">
      <Tab eventKey="home" title="All Staff">
        <DataTable columns={columns} data={state} pagination />
      </Tab>
      <Tab eventKey="addNew" title="Add New">
        <AddNewStaff />
      </Tab>
    </Tabs>
  )
}
export default AdminStaff
