import request from 'superagent'

class InitiativeApi {
  /* get All initiatives */
  static getInitiatives() {
    let req = request.get('/api/initiatives.json')
    return req.then(response => {
      return response
    }, error => {
      return error
    })
  }
}

export default InitiativeApi
