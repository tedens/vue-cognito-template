<template>
  <div class="row marketing">
    <h2>Dashboard</h2>
    <p>Welcome {{ user.username }}, you may find your api token below.</p>
    <h2>Api Token</h2>
    <pre>{{ apikey }}</pre>
    <button class="btn btn-primary" @click="generateNewApiKey">Generate New Api Key</button>
    <h2>Manage Account</h2>
    <button class="btn btn-primary" @click="changePassword">Change Password</button>
  </div>
</template>

<script>
import jwtDecode from 'jwt-decode'
import { ApiService } from 'services'

export default {
  data () {
    return {
      token: 'Loading token..',
      user: {},
      apikey: '',
      email: ''
    }
  },
  created () {
    this.$cognitoAuth.getIdToken((err, jwtToken) => {
      if (err) {
        console.log("Dashboard: Couldn't get the session:", err, err.stack)
        return
      }
      this.token = jwtDecode(jwtToken)
      this.email = this.token.email
      this.user = this.$cognitoAuth.getCurrentUser()
      this.getApiKey()
    })
  },
  methods: {
    changePassword(){
      this.$router.push({ path: "/change_password"})
    },
    async getApiKey(){
      let response = {};
      response = await ApiService.getApiKey(this.email)
      this.apikey = response.body;
    },
    async generateNewApiKey(){
      let response = {};
      response = await ApiService.newApiKey(this.email)
      this.getApiKey()
    }
  }
}
</script>
