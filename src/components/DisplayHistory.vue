<template>
  <section class="container">
    <div class="col-12 mx-0 px-0 ">
      <table class="table table-striped px-0 mx-0">
        <thead>
          <tr>
            <th class="text-left">Date Completed</th>
            <th class="text-center">Total Time</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="workout in singleWorkout" v-bind:key="workout.id">
            <td class="text-left">
              <router-link
                v-bind:to="{
                  name: 'ViewSavedWorkoutDetailsView',
                  params: { id: workout.workoutId },
                }"
              >
                {{ workout.dateSaved }}</router-link
              >
            </td>
            <td class="text-center">{{ workout.totalTime }}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </section>
</template>

<script>
import workoutService from "@/services/WorkoutService.js";
export default {
  name: "display-history",
  created() {
    workoutService
      .getSavedUserWorkouts()
      .then((response) => {
        this.$store.commit("SAVE_USER_WORKOUTS", response.data);
        this.savedWorkouts = response.data;
      })
      .catch((error) => {
        alert("Sorry we're unable to locate your workout history. Please log your workouts to access this page");
        console.log(error);
      });
  },
  data() {
    return {
      savedWorkouts: [],
    };
  },
  computed: {
    singleWorkout() {
      let workout = [];
      for (let i = 0; i < this.savedWorkouts.length; i++) {
        if (
          workout.findIndex(
            (w) => w.workoutId == this.savedWorkouts[i].workoutId
          ) == -1
        ) {
          workout.push(this.savedWorkouts[i]);
        }
      }
      return workout;
    },
  },
};
</script>

<style></style>
