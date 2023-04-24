import axios from 'axios'

const URL = 'https://localhost:7207/api'

class MyCompanyService {
  GetAll = async () => {
    const res = await axios({
      url: URL + '/mycompany',
      method: 'GET',
      headers: { contentType: 'application/json' },
    })
    return res.data.responseObject
  }
}
export default new MyCompanyService()
