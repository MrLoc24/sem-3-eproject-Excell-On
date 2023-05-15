import axios from 'axios'

const URL = 'https://localhost:7207/api'

class Order {
  GetAll = async () => {
    const response = await axios.get(URL + '/orders', {
      headers: {
        Authorization: `Bearer ${sessionStorage.getItem('token').replace(/^"(.*)"$/, '$1')}`,
      },
    })
    return response.data
  }
  GetById = async (id) => {
    const response = await axios.get(URL + '/orders/order/' + id, {
      headers: {
        Authorization: `Bearer ${sessionStorage.getItem('token').replace(/^"(.*)"$/, '$1')}`,
      },
    })
    return response.data
  }
  DeleteOrder = async (id) => {
    const response = await axios.put(URL + '/orders/delete/' + id, {
      headers: {
        Authorization: `Bearer ${sessionStorage.getItem('token').replace(/^"(.*)"$/, '$1')}`,
      },
    })
    return response.data
  }
}
export default new Order()
