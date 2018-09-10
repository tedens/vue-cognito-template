<template>
  <div class="row marketing">
    <h2>Welcome</h2>
    <p>You are logged {{ loggedIn ? 'in' : 'out' }}</p>
  </div>
</template>

<script>
export default {
  props: ['loggedIn'],
  created: function () {
    this.$cognitoAuth.isAuthenticated((err, loggedIn) => {
      if (err) {
        console.err("Home: Couldn't get the session:", err, err.stack)
        return
      }
      this.loggedIn = loggedIn
    })
  }
}
</script>
