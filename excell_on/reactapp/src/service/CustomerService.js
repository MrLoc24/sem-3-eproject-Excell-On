import axios from 'axios'

const URL = 'https://localhost:7207/api'

class CustomerService {
  GetAll = async () => {
    const response = await axios.get(URL + '/customer', {
      headers: {
        Authorization: `Bearer ${sessionStorage.getItem('token').replace(/^"(.*)"$/, '$1')}`,
      },
    })
    return response.data
  }
}

export default new CustomerService()