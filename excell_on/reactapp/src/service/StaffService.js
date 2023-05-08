import axios from 'axios'

const URL = 'https://localhost:7207/api'
class StaffService {
  GetAll = async () => {
    const response = await axios({
      method: 'get',
      url: URL + '/staff',
      headers: {
        Authorization: `Bearer ${sessionStorage.getItem('token').replace(/^"(.*)"$/, '$1')}`,
      },
    })

    return response.data
  }
  Delete = async (id) => {
    const response = await axios({
      method: 'put',
      url: URL + '/staff/deleteStatus/' + id,
      headers: {
        Authorization: `Bearer ${sessionStorage.getItem('token').replace(/^"(.*)"$/, '$1')}`,
      },
    })
    return response.data
  }
}
export default new StaffService()
