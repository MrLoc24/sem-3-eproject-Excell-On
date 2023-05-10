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

  GetById = async (id) => {
    const customer = JSON.parse(sessionStorage.getItem('customer'))
    const token = customer.token.replace(/^"(.*)"$/, '$1')
    const response = await axios.get(URL + '/customer/' + id, {
      headers: {
        Authorization: `Bearer ${token}`,
      },
    })
    return response.data.responseObject
  }

  ChangePassword = async (id, password) => {
    const customer = JSON.parse(sessionStorage.getItem('customer'))
    const token = customer.token.replace(/^"(.*)"$/, '$1')
    const response = await axios({
      method: 'put',
      url: URL + '/customer/changePassword/' + id + '?newPassword=' + password,
      headers: {
        Authorization: `Bearer ${token}`,
      },
      data: {},
    })
    return response.data
  }

  UpdateProfile = async (id, data) => {
    const customer = JSON.parse(sessionStorage.getItem('customer'))
    const token = customer.token.replace(/^"(.*)"$/, '$1')
    const response = await axios({
      method: 'put',
      url: URL + '/customer/updateProfile/' + id,
      headers: {
        Authorization: `Bearer ${token}`,
      },
      data: data,
    })
    return response.data
  }

  UpdateAvatar = async (id, data) => {
    const customer = JSON.parse(sessionStorage.getItem('customer'))
    const token = customer.token.replace(/^"(.*)"$/, '$1')
    const response = await axios({
      method: 'put',
      url: URL + '/customer/updateAvatar/' + id + '?url=' + data,
      headers: {
        Authorization: `Bearer ${token}`,
      },
    })
    return response.data
  }
}

export default new CustomerService()
