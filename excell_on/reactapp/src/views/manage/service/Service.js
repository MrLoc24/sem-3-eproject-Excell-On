import React, { useState, useEffect } from 'react'
import DataTable from 'react-data-table-component'
import ServiceService from 'src/service/ServiceService'
import { useNavigate } from 'react-router-dom'
import { Link } from 'react-router-dom'
const Accordion = () => {
  const [serviceData, setServiceData] = useState([])
  useEffect(() => {
    ServiceService.GetAll().then((response) => {
      setServiceData(response.responseObject)
    })
  }, [])
  let navigate = useNavigate()
  const handleButtonClick = (e, id) => {
    e.preventDefault()
    navigate(`/admin/manage/service/${id}`)
  }
  const customStyles = {
    header: {
      style: {
        minHeight: '56px',
      },
    },
    headRow: {
      style: {
        borderTopStyle: 'solid',
        borderTopWidth: '1px',
      },
    },
    headCells: {
      style: {
        '&:not(:last-of-type)': {
          borderRightStyle: 'solid',
          borderRightWidth: '1px',
        },
      },
    },
    cells: {
      style: {
        '&:not(:last-of-type)': {
          borderRightStyle: 'solid',
          borderRightWidth: '1px',
        },
      },
    },
  }
  const columns = [
    {
      name: 'Image',
      cell: (row) => <img src={row.serviceImage} width={60} className="container-fluid" />,
    },
    {
      name: 'Service',
      selector: (row) => row.serviceName,
      sortable: true,
    },
    {
      name: 'Service',
      cell: (row) => (
        <p className="container-fluid" width={100}>
          {row.serviceDescription}
        </p>
      ),
    },
    {
      name: 'Price',
      selector: (row) => row.servicePrice,
      sortable: true,
    },
    {
      name: 'Status',
      selector: (row) => (row.deleted ? 'Deleted' : 'Active'),
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
      <DataTable columns={columns} data={serviceData} pagination customStyles={customStyles} />
    </>
  )
}

export default Accordion
