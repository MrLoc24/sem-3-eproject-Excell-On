import axios from 'axios'

const URL = 'https://localhost:7207/api'

class LoginCustomerService {
  login = async (username, password) => {
    const response = await axios.post(URL + '/customer/authenticate', { username, password })
    if (response.data.token) {
      sessionStorage.setItem('name', JSON.stringify(response.data.customerName))
      sessionStorage.setItem('id', JSON.stringify(response.data.id))
      sessionStorage.setItem('token', JSON.stringify(response.data.token))
      return response.data
    }
  }
  logout = () => {
    sessionStorage.clear()
  }
}
export default new LoginCustomerService()
