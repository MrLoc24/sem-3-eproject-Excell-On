import axios from 'axios'

const URL = 'https://localhost:7207/api'

class AuthService {
  login = async (username, password) => {
    const response = await axios.post(URL + '/user/authenticate', { username, password })
    if (response.data.token) {
      sessionStorage.setItem('user', JSON.stringify(response.data))
      sessionStorage.setItem('token', JSON.stringify(response.data.token))
      sessionStorage.setItem('id', JSON.stringify(response.data.id))
      return response.data
    }
  }
  logout = () => {
    sessionStorage.removeItem('user')
  }
}
export default new AuthService()
