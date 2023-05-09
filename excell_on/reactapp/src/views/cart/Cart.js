import React, { useEffect, useState } from 'react'
import { Breadcrumb } from 'src/components'
import DataTable from 'react-data-table-component'

export default function Cart() {
  const [data, setData] = useState([])
  const columns = [
    {
      name: 'Image',
      selector: (row) => (
        <img
          src={row.customerAvatar}
          className="rounded-circle"
          style={{ width: 50, height: 50 }}
        />
      ),
      width: '120px',
    },
  ]
  return (
    <>
      <Breadcrumb title="Cart" />
      <DataTable columns={columns} data={data} pagination />
    </>
  )
}
