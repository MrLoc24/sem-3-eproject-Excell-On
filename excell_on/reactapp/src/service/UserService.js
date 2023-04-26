import axios from 'axios'
const URL = 'https://localhost:7207/api'
class UserService {
  GetAll = async () => {
    const response = await axios({
      method: 'GET',
      url: URL + '/user',
      headers: {
        Authorization: `Bearer ${sessionStorage.getItem('token').replace(/^"(.*)"$/, '$1')}`,
      },
    })
    return response.data
  }
  GetById = async (id) => {
    const response = await axios({
      method: 'get',
      url: URL + '/user/' + id,
      headers: {
        Authorization: `Bearer ${sessionStorage.getItem('token').replace(/^"(.*)"$/, '$1')}`,
      },
    })

    return response.data.responseObject
  }
  ChangePassword = async (id, password) => {
    const response = await axios({
      method: 'put',
      url: URL + '/user/changePassword/' + id + '?newPassword=' + password,
      headers: {
        Authorization: `Bearer ${sessionStorage.getItem('token').replace(/^"(.*)"$/, '$1')}`,
      },
      data: {},
    })
    return response.data
  }

  UpdateProfile = async (id, data) => {
    const response = await axios({
      method: 'put',
      url: URL + '/user/updateProfile/' + id,
      headers: {
        Authorization: `Bearer ${sessionStorage.getItem('token').replace(/^"(.*)"$/, '$1')}`,
      },
      data: data,
    })
    return response.data
  }
}

export default new UserService()
