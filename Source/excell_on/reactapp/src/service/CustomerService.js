import axios from 'axios'

const URL = 'https://localhost:7207/api'

class CustomerService {
  static get token() {
    let token = JSON.parse(sessionStorage.getItem('token'))
    return token;
  }

  GetAll = async () => {
    const response = await axios.get(URL + '/customer', {
      headers: {
        Authorization: `Bearer ${sessionStorage.getItem('token').replace(/^"(.*)"$/, '$1')}`,
      },
    })
    return response.data
  }

  GetById = async (id) => {
    const response = await axios.get(URL + '/customer/' + id, {
      headers: {
        Authorization: `Bearer ${CustomerService.token}`,
      },
    })
    return response.data.responseObject
  }

  CreateCustomer = async (data) => {
    const response = await axios({
      method: 'POST',
      url: URL + '/Customer/CreateCustomer',
      headers: {
        Authorization: `Bearer ${CustomerService.token}`,
      },
      data: data
    })
  }

  ChangePassword = async (id, password) => {
    const response = await axios({
      method: 'put',
      url: URL + '/customer/changePassword/' + id + '?newPassword=' + password,
      headers: {
        Authorization: `Bearer ${CustomerService.token}`,
      },
      data: {},
    })
    return response.data
  }

  UpdateProfile = async (id, data) => {
    const response = await axios({
      method: 'put',
      url: URL + '/customer/updateProfile/' + id,
      headers: {
        Authorization: `Bearer ${CustomerService.token}`,
      },
      data: data,
    })
    return response.data
  }

  UpdateAvatar = async (id, data) => {
    const response = await axios({
      method: 'put',
      url: URL + '/customer/updateAvatar/' + id + '?url=' + data,
      headers: {
        Authorization: `Bearer ${CustomerService.token}`,
      },
    })
    return response.data
  }
}

export default new CustomerService()
