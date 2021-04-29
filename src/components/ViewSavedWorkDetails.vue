<template>
 <div class="container">
     <h1 class="my-3 py-3 text-center">{{getExercisesInWorkout[0].dateSaved}}</h1>
<div class= "col-12">

    <table class="table table-striped">
      <thead>
        <tr>
          <th class="text-left col-1">Name</th>
          <th class="text-center">Sets</th>
          <th class="text-center">Reps</th>
          <th class="text-center">Time</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="exercise in getExercisesInWorkout" v-bind:key="exercise.id">
          <td class="text-left">{{ exercise.exerciseName }}</td>
          <td class="text-center">{{ exercise.setsCompleted }}</td>
          <td class="text-center">{{ exercise.repsCompleted }}</td>
          <td class="text-center">{{ exercise.timeCompleted }}</td>
        </tr>
      </tbody>
    </table>
  </div>
 </div>
</template>

<script>
export default {
  name: "view-saved-work-details",
  computed: {
    getExercisesInWorkout() {
      let exercises = [];
      for (let i = 0; i < this.$store.state.savedUserWorkout.length; i++) {
        if (this.$store.state.savedUserWorkout[i].workoutId == this.$route.params.id) {
          exercises.push(this.$store.state.savedUserWorkout[i]);
          
        }
      }

      return exercises;
    },
  },
};
</script>

<style></style>
