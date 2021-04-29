<template>
  <section>
    <div id="register" class="text-center row justify-content-center mt-4 mx-4">
      <div class="col-md-6 xs-10 mx-auto">
        <form class="form-register" @submit.prevent="login">
          <h1 class="h3 mb-3 font-weight-normal">Login</h1>
            <div
              class="alert alert-danger"
              role="alert"
              v-if="invalidCredentials"
            >
              Invalid username and password!
            </div>
            <div
              class="alert alert-success"
              role="alert"
              v-if="this.$route.query.registration"
            >
              Thank you for registering, please sign in.
            </div>
            <input
              type="text"
              id="username"
              class="form-control my-2"
              placeholder="Username"
              v-model="user.username"
              required
              autofocus
            />
            <label for="password" class="sr-only">Password</label>
            <input
              type="password"
              id="password"
              class="form-control my-2"
              placeholder="Password"
              v-model="user.password"
              required
            />

            <div class="mt-2">
              <button
                class="btn btn-lg btn-primary btn-block my-2"
                type="submit"
              >
                Sign in
              </button>
            </div>
            <div class="mt-2">
              <router-link
                :to="{ name: 'register' }"
                tag="button"
                class="btn btn-lg btn-primary btn-block my-2"
                >Need an account?</router-link
              >
            </div>
          </form>
      </div>
    </div>
  </section>
</template>

<script>
import authService from "../services/AuthService";

export default {
  name: "login",
  components: {},
  data() {
    return {
      user: {
        username: "",
        password: "",
      },
      invalidCredentials: false,
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then((response) => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            this.$router.push("/");
          }
        })
        .catch((error) => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    },
  },
};
</script>
<style scoped></style>
