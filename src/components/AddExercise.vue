<template>
  <section>
    <div class="container text-center">
      <div class="row justify-content-center">
        <div class="col-xs-12 col-lg-6">
          <h1 class="mt-4">{{ Title }}</h1>
          <form id="add-exercise-form">
            <div class="add-workout-form my-3" id="name-div">
              <!-- <label for="name">Name:</label> -->
              <label for="name" class="sr-only">Name</label>
              <input
                type="name"
                id="name"
                class="form-control"
                placeholder="Name"
                v-model="exercise.name"
              />
              <!-- <input id="name" type="text"  /> -->
            </div>
            <div class="add-workout-form my-3" id="description-div">
              <label for="description" class="sr-only">Description</label>
              <input
                type="description"
                id="description"
                class="form-control"
                placeholder="Description of Exercises"
                v-model="exercise.description"
              />
            </div>

            <div class="add-workout-form my-3" id="weight-div">
              <label for="weight" class="sr-only">Weight</label>
              <input
                type="number"
                id="weight"
                class="form-control"
                placeholder="Weight"
                v-model="exercise.suggestedWeight"
              />
            </div>

            <div class="add-workout-form my-3" id="sets-div">
              <label for="sets" class="sr-only">Sets</label>
              <input
                type="number"
                id="sets"
                class="form-control"
                placeholder="How Many Sets?"
                v-model="exercise.sets"
              />
            </div>

             <div class="add-workout-form my-3" id="reps-div">
              <label for="reps" class="sr-only">Reps</label>
              <input
                type="number"
                id="reps"
                class="form-control"
                placeholder="How Many Reps?"
                v-model="exercise.reps"
              />
            </div>
              <div class="add-workout-form my-3" id="time-div">
              <label for="time" class="sr-only"></label>
              <input
                type="number"
                id="time"
                class="form-control"
                placeholder="Amount of Time for Exercise in minutes?"
                v-model="exercise.time"
              />
            </div>
            <div class="add-workout-form" id="bodypart-div">
              <label for="bodyTargetId" class="sr-only">Body Part Target</label>
              <select id="bodyTargetId" class="form-control" v-model="exercise.bodyTargetId">
                <option value="" disabled selected>Select the primary target</option>
                <option value="1">Legs</option>
                <option value="2">Back</option>
                <option value="3">Chest</option>
                <option value="4">Arms</option>
                <option value="5">Cardio</option>
                <option value="6">Full Body</option>
                 <option value="7">Abs</option>
              </select>
            </div>
            <div class="actions" id="exercise-submit">
         <button type="submit" v-on:click.prevent="saveExercise()" class="btn btn-lg btn-primary btn-block my-2">Save Exercise</button>

            </div>
          </form>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
import ExerciseService from "@/services/ExerciseService.js";

export default {
  name: "add-exercise",
  data() {
    return {
      exercise: {
        name: "",
        description: "",
        suggestedWeight: "",
        reps: "",
        sets: "",
        time: "",
        bodyTargetId: "",
        id: 0,
      },
    };
  },
  mounted() {
    this.exercise.id = this.$route.params.id;
    ExerciseService.listExercises().then((response) => {
      response.data.filter((e) => {
        if (e.id === this.$route.params.id) {
          this.exercise = e;
        }
      });
    });
    if (this.$route.path == "/exercise/add") {
      this.exercise.name = "";
      this.exercise.description = "";
      this.exercise.suggestedWeight = "";
      this.exercise.reps = "";
      this.exercise.sets = "";
      this.exercise.time = "";
      this.exercise.bodyTargetId = "";
      this.exercise.id = 0;
    }
  },
  created() {
    this.exercise.id = this.$route.params.id;
    ExerciseService.listExercises().then((response) => {
      response.data.filter((e) => {
        if (e.id === this.$route.params.id) {
          this.exercise = e;
        }
      });
    });
    if (this.$route.path == "/exercise/add") {
      console.log("here");
      this.exercise.name = "";
      this.exercise.description = "";
      this.exercise.suggestedWeight = "";
      this.exercise.reps = "";
      this.exercise.sets = "";
      this.exercise.time = "";
      this.exercise.bodyTargetId = "";
      this.exercise.id = 0;
    }
  },
  methods: {
    saveExercise() {
      if (this.exercise.id === 0) {
        //add Exercise
        ExerciseService.addExercise(this.exercise)
          .then((response) => {
            if (response.status === 201) {
              this.$router.push("/exercises");
            }
          })
          .catch((error) => {
            this.handleErrorResponse(error, "adding");
          });
        //Edit Exercise(update)
      } else {
        ExerciseService.editExercise(this.exercise)
          .then((response) => {
            if (response.status === 200) {
              this.$router.push(`/exercises`);
            }
          })
          .catch((error) => {
            console.log(error);
            this.handleErrorResponse(error, "editing");
          });
      }
    },
    //delete an exercise
    deleteExercise() {
      if (
        confirm(
          "Are you sure you want to delete this exercise? Your body may regret this."
        )
      ) {
        ExerciseService.deleteExercise(this.exercise.id)
          .then((response) => {
            if (response.status === 200) {
              alert("Exercise successfully deleted (Remember to stay healthy)");
              this.$router.push("/exercises");
            }
          }) //if error occurs deleting exercise on server or request
          .catch((error) => {
            if (error.response) {
              this.errorMsg =
                "Error deleting your exercise . Response received was '" +
                error.response.statusText +
                "'.";
            } else if (error.request) {
              this.errorMsg =
                "Error deleting exercise. Server could not be reached.";
            } else {
              this.errorMsg =
                "Error deleting exercise. Request could not be created.";
            }
          });
      }
    },

    handleErrorResponse(error, verb) {
      if (error.response) {
        this.errorMsg =
          "Error " +
          verb +
          " exercise. Response received was '" +
          error.response.statusText +
          "'.";
      } else if (error.request) {
        this.errorMsg =
          "Error " + verb + " exercise. Server could not be reached.";
      } else {
        this.errorMsg =
          "Error " + verb + " exercise. Request could not be created.";
      }
    },
  },
  computed: {
    Title() {
      return this.$route.path == "/exercise/add"
        ? "Add an exercise"
        : "Edit an exercise";
    },
  },
};
</script>

<style>
label {
  font-weight: 500;
  font-size: 1.5rem;
  color: black;
  padding: 1rem 0 0 0;
}

input,
textarea {
  width: 50%;
}

#exercise-submit {
  margin-top: 2em;
}
#bodyTargetId:hover {
  cursor: pointer;
}
</style>
