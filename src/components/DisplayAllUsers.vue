<template>
  <div class="container">
    <div class="col-12">
      <table class="table table-striped">
        <thead>
          <tr>
            <th class="text-left col-1">Username</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="user in loadUserNames" v-bind:key="user.username">
            <td class="text-left">
              <router-link
                v-bind:to="{
                  name: 'user-details',
                  params: { username: user.username },
                }"
              >
                {{ user.username }}
              </router-link>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
import workoutService from "@/services/WorkoutService.js";
export default {
  name: "display-all-users",
  data() {
    return {
      users: [],
    };
  },
  created() {
    workoutService
      .getAllUsers()
      .then((response) => {
        this.users = response.data;
        console.log(this.users);
      })
      .catch((error) => {
        console.log(error);
        workoutService
          .getAllUsers()
          .then((response) => {
            this.users = response.data;
            console.log(this.users);
          })
          .catch((error) => {
            console.log(error);
          });
      });
  },
  computed: {
    loadUserNames() {
      this.getUserId;
      return this.users;
    }
  },
  methods: {
    getUserId(username) {
      console.log(username);
      let userId = 0;
      workoutService
        .getIdFromUsername(username)
        .then((response) => {
          userId = response.data;
        })
        .catch((error) => {
          console.log(error);
        });
      return userId;
    },
  },
};
</script>

<style></style>
