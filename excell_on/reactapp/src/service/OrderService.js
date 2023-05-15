import axios from 'axios'

const URL = 'https://localhost:7207/api'
const customer = JSON.parse(sessionStorage.getItem('customer'))
const token = customer.token.replace(/^"(.*)"$/, '$1')

class OrderService {
  static get token() {
    const customer = JSON.parse(sessionStorage.getItem('customer'))
    return (token = customer.token.replace(/^"(.*)"$/, '$1'))
  }

  GetById = async (id) => {
    const response = await axios.get(URL + '/Orders/allOrder/' + id, {
      headers: {
        Authorization: `Bearer ${OrderService.token}`,
      },
    })
    return response.data.responseObject
  }

  GetSingleById = async (id) => {
    const response = await axios.get(URL + 'Orders/order/' + id, {
      headers: {
        Authorization: `Bearer ${OrderService.token}`,
      },
    })
    return response.data.responseObject
  }

  PendingOrder = async (id) => {
    const response = await axios.get(URL + 'Orders/pending/' + id, {
      headers: {
        Authorization: `Bearer ${OrderService.token}`,
      },
    })
    return response.data.responseObject
  }

  AddNewOrder = async (totalCost, id) => {

  }
}

export default new OrderService()
