import React, { useState, useEffect } from 'react'
import OrderService from 'src/service/OrderService'
import { useParams } from 'react-router-dom'

const OrderDetail = () => {
  const { id } = useParams()
  const [orderDetail, setOrderDetail] = useState({})
  const [customerName, setCustomerName] = useState('');

  useEffect(() => {
    OrderService.GetById(id).then((response) => {
      setOrderDetail(response.responseObject);
      setCustomerName(response.responseObject.customer.customerName);
      console.log(orderDetail);
    })
  }, [])

  return (
    <section className="content">
      <div className="container-fluid">
        <div className="row">
          <div className="col-12">
            <div className="invoice p-3 mb-3">
              <div className="row">
                <div className="col-12">
                  <h4>
                    <i className="fas fa-globe"></i> AdminLTE, Inc.
                    <small className="float-right">Date: {new Date().toLocaleString() + ''}</small>
                  </h4>
                </div>
              </div>

              <div className="row invoice-info">
                <div className="col-sm-4 invoice-col">
                  From
                  <address>
                    <strong>Admin, Inc.</strong>
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
                    <strong>{customerName}</strong>
                    <br />
                    795 Folsom Ave, Suite 600
                    <br />
                    San Francisco, CA 94107
                    <br />
                    Phone: (555) 539-1037
                    <br />
                    Email: john.doe@example.com
                  </address>
                </div>

                <div className="col-sm-4 invoice-col">
                  <b>Invoice #007612</b>
                  <br />
                  <br />
                  <b>Order ID:</b> {orderDetail.id}
                  <br />
                  <b>Payment Due:</b> 2/22/2014
                  <br />
                  <b>Account:</b> 968-34567
                </div>
              </div>

              <div className="row">
                <div className="col-12 table-responsive">
                  <table className="table table-striped">
                    <thead>
                      <tr>
                        <th>Qty</th>
                        <th>Product</th>
                        <th>Serial #</th>
                        <th>Description</th>
                        <th>Subtotal</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>1</td>
                        <td>Call of Duty</td>
                        <td>455-981-221</td>
                        <td>El snort testosterone trophy driving gloves handsome</td>
                        <td>$64.50</td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>Need for Speed IV</td>
                        <td>247-925-726</td>
                        <td>Wes Anderson umami biodiesel</td>
                        <td>$50.00</td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>Monsters DVD</td>
                        <td>735-845-642</td>
                        <td>Terry Richardson helvetica tousled street art master</td>
                        <td>$10.70</td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>Grown Ups Blue Ray</td>
                        <td>422-568-642</td>
                        <td>Tousled lomo letterpress</td>
                        <td>$25.99</td>
                      </tr>
                    </tbody>
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
                          <th>Tax (9.3%)</th>
                          <td>$10.34</td>
                        </tr>
                        <tr>
                          <th>Shipping:</th>
                          <td>$5.80</td>
                        </tr>
                        <tr>
                          <th>Total:</th>
                          <td>$265.24</td>
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
