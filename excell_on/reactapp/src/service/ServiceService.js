import axios from 'axios'

const URL = 'https://localhost:7207/api'

class ServiceService {
  GetAll = async () => {
    const response = await axios.get(URL + '/api/service')
    return response.data
  }
  GetById = async (id) => {
    const response = await axios.get(URL + '/api/service/' + id)
    return response.data
  }
}
export default new ServiceService()
