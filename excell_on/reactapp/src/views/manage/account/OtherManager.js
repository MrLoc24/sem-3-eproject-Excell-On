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
  const columns = [
    {
      name: 'Id',
      selector: (row) => row.id,
      sortable: true,
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
    },
    {
      name: 'Phone',
      selector: (row) => row.userPhone,
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
  const handleButtonClick = (e, id) => {
    e.preventDefault()
    console.log(id)
  }

  return (
    <Tabs defaultActiveKey="home" id="uncontrolled-tab-example" className="mb-3">
      <Tab eventKey="home" title="All Manager">
        <DataTable columns={columns} data={state} pagination />
      </Tab>
      <Tab eventKey="addNew" title="Add New">
        <AddNewManager />
      </Tab>
    </Tabs>
  )
}
export default OtherManager
