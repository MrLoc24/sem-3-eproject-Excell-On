import React, { useState, useEffect } from 'react'
import OrderService from 'src/service/OrderService'
import { useParams } from 'react-router-dom'

const OrderDetail = () => {
  const { id } = useParams()
  const [order, setOrder] = useState([])
  const [customer, setCustomer] = useState([])
  const [orderDetail, setOrderDetail] = useState([{}])

  useEffect(() => {
    OrderService.GetById(id).then((response) => {
      setOrder(response.responseObject)
      setCustomer(response.responseObject.customer)
      setOrderDetail(response.responseObject.orderDetails)
      console.log(orderDetail)
    })
  }, [])
  const status = () => {
    switch (order.orderStatus) {
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
  }

  return (
    <section className="content">
      <div className="container-fluid">
        <div className="row">
          <div className="col-12">
            <div className="invoice p-3 mb-3">
              <div className="row">
                <div className="col-12">
                  <h4>
                    <i className="fas fa-globe"></i> Excell-On Service
                    <small className="float-right">: {order.orderDateCreate}</small>
                  </h4>
                </div>
              </div>

              <div className="row invoice-info">
                <div className="col-sm-4 invoice-col">
                  From
                  <address>
                    <strong>Admin</strong>
                    <br />
                    795 Folsom Ave, Suite 600
                    <br />
                    San Francisco, CA 94107
                    <br />
                    Phone: (804) 123-5432
                    <br />
                    Email: info@almasaeedstudio.com
                  </address>
                </div>

                <div className="col-sm-4 invoice-col">
                  To
                  <address>
                    <strong>{customer.customerName}</strong>
                    <br />
                    {customer.customerPhone}
                    <br />
                    {customer.customerEmail}
                  </address>
                </div>

                <div className="col-sm-4 invoice-col">
                  <b>
                    Invoice #EX-{order.id}-{order.customerId}
                  </b>
                  <br />
                  <b>Order ID:</b> {order.id}
                  <br />
                  <b>Account:</b> 968-34567
                </div>
              </div>

              <div className="row">
                <div className="col-12 table-responsive">
                  <table className="table table-striped">
                    <thead>
                      <tr>
                        <th>Start Date</th>
                        <th>End Date</th>
                        <th>Number of Staff</th>
                        <th>Service</th>
                        <th>Department</th>
                      </tr>
                    </thead>
                    {orderDetail &&
                      orderDetail.map((detail, idx) => (
                        <tbody>
                          <tr key={idx}>
                            <td>{detail.orderDetailDateStart}</td>
                            <td>{detail.orderDetailDateEnd}</td>
                            <td>{detail.orderDetailNumberOfPeople}</td>
                            <td>{detail.service && detail.service.serviceName}</td>
                            <td>{detail.department && detail.department.name}</td>
                          </tr>
                        </tbody>
                      ))}
                  </table>
                </div>
              </div>

              <div className="row">
                <div className="col-6">
                  <p className="lead">Payment Methods:</p>
                  <img src="../../dist/img/credit/visa.png" alt="Visa" />
                  <img src="../../dist/img/credit/mastercard.png" alt="Mastercard" />
                  <img src="../../dist/img/credit/american-express.png" alt="American Express" />
                  <img src="../../dist/img/credit/paypal2.png" alt="Paypal" />

                  <p className="text-muted well well-sm shadow-none" style={{ marginTop: '10px' }}>
                    Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles, weebly ning
                    heekya handango imeem plugg dopplr jibjab, movity jajah plickers sifteo edmodo
                    ifttt zimbra.
                  </p>
                </div>

                <div className="col-6">
                  <p className="lead">Amount Due 2/22/2014</p>

                  <div className="table-responsive">
                    <table className="table">
                      <tbody>
                        <tr>
                          <th style={{ width: '50%' }}>Subtotal:</th>
                          <td>$250.30</td>
                        </tr>
                        <tr>
                          <th>Status:</th>
                          <td>{status()}</td>
                        </tr>

                        <tr>
                          <th>Total:</th>
                          <td>${order.orderTotalCost}</td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>

              <div className="row no-print">
                <div className="col-12">
                  <a
                    href="invoice-print.html"
                    rel="noopener"
                    target="_blank"
                    className="btn btn-default"
                  >
                    <i className="fas fa-print"></i> Print
                  </a>
                  <button type="button" className="btn btn-success float-right">
                    <i className="far fa-credit-card"></i> Submit Payment
                  </button>
                  <button
                    type="button"
                    className="btn btn-primary float-right"
                    style={{ marginRight: '5px' }}
                  >
                    <i className="fas fa-download"></i> Generate PDF
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  )
}
export default OrderDetail
