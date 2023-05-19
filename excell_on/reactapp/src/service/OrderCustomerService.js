import axios from 'axios'

const URL = 'https://localhost:7207/api'

class OrderService {
  static get token() {
    let token = JSON.parse(sessionStorage.getItem('token'))
    return token
  }

  InitOrder = async (id) => {
    const response = await axios({
      method: 'POST',
      url: URL + '/Orders' + '?id=' + id,
    })
    return response.data
  }

  GetById = async (id) => {
    const response = await axios.get(URL + '/Orders/allOrder/' + id, {
      headers: {
        Authorization: `Bearer ${OrderService.token}`,
      },
    })
    return response.data
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
    const response = await axios.get(URL + '/Orders/pending/' + id, {
      headers: {
        Authorization: `Bearer ${OrderService.token}`,
      },
    })
    return response.data
  }

  AddNewOrder = async (data, totalCost, id) => {
    const response = await axios({
      method: 'POST',
      url: URL + '/Orders/newOrder' + '?totalCost=' + totalCost + '&id=' + id,
      headers: {
        Authorization: `Bearer ${OrderService.token}`,
      },
      data: data,
    })
    return response.data
  }
}

export default new OrderService()
