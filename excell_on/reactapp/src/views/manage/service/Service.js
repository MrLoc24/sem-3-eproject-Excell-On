import React, { useState, useEffect } from 'react'
import DataTable from 'react-data-table-component'
import ServiceService from 'src/service/ServiceService'
import { useNavigate } from 'react-router-dom'
import { Link } from 'react-router-dom'
const Accordion = () => {
  const [serviceData, setServiceData] = useState([])
  useEffect(() => {
    ServiceService.GetAll().then((response) => {
      const data = response.responseObject.map((ser) => {
        return {
          serviceName: ser.serviceName,
          id: ser.id,
          price: ser.servicePrice,
        }
      })
      let serviceData = data
      setServiceData(serviceData)
    })
  }, [])
  let navigate = useNavigate()
  const handleButtonClick = (e, id) => {
    e.preventDefault()
    navigate(`/admin/manage/service/${id}`)
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
      name: 'Service',
      selector: (row) => row.serviceName,
      sortable: true,
    },
    {
      name: 'Price',
      selector: (row) => row.price,
      sortable: true,
    },
    {
      name: 'Status',
      selector: (row) => row.deleted,
      sortable: true,
    },
  ]

  return (
    <>
      <DataTable columns={columns} data={serviceData} pagination />
    </>
  )
}

export default Accordion
