<template>
<div class="container">
<div class= "col-12">
  <!-- <div class="exercise-details"> -->
    <h1 class="mt-4">{{ exercise.name }}</h1>
    <p>{{ exercise.description }}</p>
     <div class="exercise-gif">
      <label for="gif">Proper Form</label><br />
      <img v-bind:src="exercise.exerciseGif" width="100%"/><br />
    </div>
    <label for="sets">Sets:</label>
    <br />
    <input id="sets" type="number" v-model="exercise.sets" class="form-control" />
    <br />
    <label for="reps">Reps:</label>
    <br />
    <input id="reps" type="number" v-model="exercise.reps"  class="form-control" /><br />
    <label for="time">Amount of Time &#40;min&#41;:</label>
    <br />
    <input id="time" type="number" v-model="exercise.time"  class="form-control"  /><br />
    <label for="weight">Suggested Weight &#40;lbs&#41;:</label>
    <br />
    <input id="weight" type="number" v-model="exercise.suggestedWeight"  class="form-control" /><br />
   
    <button type="button" v-on:click="saveToStore" class="btn btn-lg btn-primary btn-block my-2">
      Save Exercise Details
    </button>
  </div>
</div>
</template>

<script>
export default {
  name: "exercise-details",

  data() {
    return {
      exercise: {},
    };
  },
  created() {
    let exercises = this.$store.state.workout;
    this.exercise = exercises.find(
      (exercise) => exercise.id == this.$route.params.id
    );
  },
  methods: {
    saveToStore() {
      this.$store.commit("UPDATE_EXERCISE_IN_WORKOUT", this.exercise);
      this.$router.push("/myworkout");
    },
  },
};
</script>

<style>
/* .exercise-gif {
  display: inline-block;
}
*/
</style>
