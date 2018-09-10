import Vue from 'vue'

export default {
    getApiKey(email){
      let payload = {
        "Email": email
      };
      return Vue.http.post('ApiKey/getapi', payload)
    },
    newApiKey(email){
      let payload = {
        "Email": email
      };
      return Vue.http.post('ApiKey/newapi', payload)
    }
}
