import React, { useState, useEffect } from 'react'
import Page401 from 'src/views/pages/page401/Page401'
import DataTable from 'react-data-table-component'
import UserService from 'src/service/UserService'
import Tab from 'react-bootstrap/Tab'
import Tabs from 'react-bootstrap/Tabs'
import AddNewManager from './AddNewManager'

const OtherManager = () => {
  const [state, setState] = useState([])
  const [error, setError] = useState()
  useEffect(() => {
    UserService.GetAll()
      .then((response) => {
        setState(response.responseObject)
        console.log(state)
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
    UserService.Delete(id).then((res) => {
      alert(res.message)
      window.location.reload()
    })
  }
  const columns = [
    {
      name: 'Image',
      selector: (row) => (
        <img src={row.userAvatar} className="rounded-circle" style={{ width: 50, height: 50 }} />
      ),
      width: '120px',
    },
    {
      name: 'User Name',
      selector: (row) => row.userName,
      sortable: true,
    },
    {
      name: 'Email',
      selector: (row) => row.userEmail,
      sortable: true,
    },
    {
      name: 'Role',
      selector: (row) => row.role,
      sortable: true,
      width: '80px',
    },
    {
      name: 'Phone',
      selector: (row) => row.userPhone,
      sortable: true,
      width: '120px',
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
  const handleButtonClick = (e, id) => {
    e.preventDefault()
    console.log(id)
  }

  const conditionalRowStyles = []
  return (
    <Tabs defaultActiveKey="home" id="uncontrolled-tab-example" className="mb-3">
      <Tab eventKey="home" title="All Manager">
        <DataTable
          columns={columns}
          data={state}
          pagination
          conditionalRowStyles={conditionalRowStyles}
        />
      </Tab>
      <Tab eventKey="addNew" title="Add New">
        <AddNewManager />
      </Tab>
    </Tabs>
  )
}
export default OtherManager
