import React, { useState, useEffect } from 'react'
import DataTable from 'react-data-table-component'
import ServiceService from 'src/service/ServiceService'
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
  console.log(serviceData)
  const columns = [
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
  ]

  return (
    <>
      <DataTable columns={columns} data={serviceData} pagination />
    </>
  )
}

export default Accordion
