import axios from 'axios'

const URL = 'https://localhost:7207/api'

class ServiceService {
  GetAll = async () => {
    const response = await axios.get(URL + '/service')
    return response.data
  }
  GetById = async (id) => {
    const response = await axios.get(URL + '/service/' + id)
    return response.data.responseObject
  }
  UpdateById = async (
    sid,
    { id, serviceName, serviceDescription, serviceImage, servicePrice, deleted },
  ) => {
    const response = await axios({
      method: 'put',
      url: URL + '/service/' + sid,
      headers: {
        Authorization: `Bearer ${sessionStorage.getItem('token').replace(/^"(.*)"$/, '$1')}`,
      },
      data: {
        id,
        serviceName,
        serviceDescription,
        serviceImage,
        servicePrice,
        deleted,
      },
    })

    return response.data.status
  }
}
export default new ServiceService()
