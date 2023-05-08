import axios from 'axios'

const URL = 'https://localhost:7207/api'

class LoginCustomerService {
  login = async (username, password) => {
    const response = await axios.post(URL + '/customer/authenticate', { username, password })
    if (response.data.token) {
      sessionStorage.setItem('customer', JSON.stringify(response.data))
      return response.data
    }
  }
  logout = () => {
    sessionStorage.removeItem('customer')
  }
}
export default new LoginCustomerService()
