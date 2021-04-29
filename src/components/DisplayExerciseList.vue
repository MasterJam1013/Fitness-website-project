<template>
  <section>
    <div class="container text-center">
      <div class="row justify-content-center">
        <div class="col-12">
          <form>
            <div class="display-4 my-4">Choose your exercise filters</div>
            <div class="row d-md-none">
              <div class="col-lg-6 col-xs-12">
                <div class="row">
                  <div class="col">
                    <p class="mb-1">Legs</p>
                    <label class="switch">
                      <input type="checkbox" v-model="filterLegs" />
                      <span class="slider round"></span>
                    </label>
                  </div>
                  <div class="col">
                    <p class="mb-1">Back</p>
                    <label class="switch">
                      <input type="checkbox" v-model="filterLegs" />
                      <span class="slider round"></span>
                    </label>
                  </div>
                  <div class="col">
                    <p class="mb-1">Chest</p>
                    <label class="switch">
                      <input type="checkbox" v-model="filterLegs" />
                      <span class="slider round"></span>
                    </label>
                  </div>
                </div>
              </div>
              <div class="col-lg-6 col-xs-12 my-3">
                <div class="row">
                  <div class="col">
                    <p class="mb-1">Arms</p>
                    <label class="switch">
                      <input type="checkbox" v-model="filterLegs" />
                      <span class="slider round"></span>
                    </label>
                  </div>
                  <div class="col">
                    <p class="mb-1">Cardio</p>
                    <label class="switch">
                      <input type="checkbox" v-model="filterLegs" />
                      <span class="slider round"></span>
                    </label>
                  </div>
                  <div class="col">
                    <p class="mb-1">Abs</p>
                    <label class="switch">
                      <input type="checkbox" v-model="filterLegs" />
                      <span class="slider round"></span>
                    </label>
                  </div>
                  <div class="col">
                    <p class="mb-1">Full Body</p>
                    <label class="switch">
                      <input type="checkbox" v-model="filterLegs" />
                      <span class="slider round"></span>
                    </label>
                  </div>
                </div>
              </div>
            </div>
            <table
              class="table d-none d-md-inline"
              style="border: none; color: white;"
            >
              <tr style="border: none;">
                <td style="border: none;">Legs</td>
                <td style="border: none;">Back</td>
                <td style="border: none;">Chest</td>
                <td style="border: none;">Arms</td>
                <td style="border: none;">Cardio</td>
                <td style="border: none;">Abs</td>
                <td style="border: none;">Full Body</td>
              </tr>
              <tr style="border: none;">
                <td style="border: none;">
                  <label class="switch">
                    <input type="checkbox" v-model="filterLegs" />
                    <span class="slider round"></span>
                  </label>
                </td>
                <td style="border: none;">
                  <label class="switch">
                    <input type="checkbox" v-model="filterBack" />
                    <span class="slider round"></span>
                  </label>
                </td>
                <td style="border: none;">
                  <label class="switch">
                    <input type="checkbox" v-model="filterChest" />
                    <span class="slider round"></span>
                  </label>
                </td>
                <td style="border: none;">
                  <label class="switch">
                    <input type="checkbox" v-model="filterArms" />
                    <span class="slider round"></span>
                  </label>
                </td>
                <td style="border: none;">
                  <label class="switch">
                    <input type="checkbox" v-model="filterCardio" />
                    <span class="slider round"></span>
                  </label>
                </td>
                <td style="border: none;">
                  <label class="switch">
                    <input type="checkbox" v-model="filterAbs" />
                    <span class="slider round"></span>
                  </label>
                </td>
                <td style="border: none;">
                  <label class="switch">
                    <input type="checkbox" v-model="filterFullBody" />
                    <span class="slider round"></span>
                  </label>
                </td>
              </tr>
              <tr style="border: none;">
                <td colspan="7" style="border:none">
                  <select v-model="maxLength" class="custom-select mb-4">
                    <option value="3">Less than three minutes</option>
                    <option value="6">Less than six minutes</option>
                    <option value="10">Less than ten minutes</option>
                    <option value="99999">All lengths of time</option>
                  </select>
                </td>
              </tr>
            </table>

            <div></div>
          </form>

          <table class="table table-striped">
            <thead>
              <tr>
                <th class="text-left col-1">Name</th>
                <th class="text-center">Target</th>
                <th class="text-center">Sets</th>
                <th class="text-center">Reps</th>
                <th class="text-center">Time</th>
                <th class="text-center" v-if="admin"></th>
                <th class="text-center" v-if="admin"></th>
              </tr>
            </thead>
            <tbody>
              <tr
                v-for="e in this.exercises"
                v-bind:key="e.id"
                v-show="
                  filterExerciseBodyPart(e.bodyTargetId) &&
                    filterExerciseTime(e.time)
                "
              >
                <td class="text-left">{{ e.name }}</td>
                <td class="text-center">
                  {{ bodyTargetIdToWord(e.bodyTargetId) }}
                </td>
                <td class="text-center">{{ e.sets }}</td>
                <td class="text-center">{{ e.reps }}</td>
                <td class="text-center">{{ e.time }}</td>
                <td v-if="admin" class="text-center">
                  <router-link
                    v-bind:to="{ name: 'edit', params: { id: e.id } }"
                  >
                    <i class="fas fa-edit" alt="edit"></i>
                  </router-link>
                </td>
                <td v-if="admin" class="text-center">
                  <i
                    class="fas fa-trash-alt"
                    alt="delete"
                    v-on:click="deleteExercise(e)"
                  ></i>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
import exerciseService from "@/services/ExerciseService";
export default {
  data() {
    return {
      exercises: [],
      filterExercises: [true, true, true, true, true, true, true],
      filterArms: true,
      filterChest: true,
      filterBack: true,
      filterCardio: true,
      filterFullBody: true,
      filterLegs: true,
      filterAbs: true,
      maxLength: 99999,
    };
  },
  created() {
    this.getExercises();
  },
  methods: {
    bodyTargetIdToWord(id) {
      switch (id) {
        case 1:
          return "Legs";
        case 2:
          return "Back";
        case 3:
          return "Chest";
        case 4:
          return "Arms";
        case 5:
          return "Cardio";
        case 6:
          return "Full Body";
        case 7:
          return "Abs";
        default:
          return "Other";
      }
    },
    getExercises() {
      exerciseService.listExercises().then((response) => {
        this.exercises = response.data;
        this.exercises.forEach((e) => {
          switch (e.body_target_id) {
            case 1:
              e.body_target = "Legs";
              break;
            case 2:
              e.body_target = "Back";
              break;
            case 3:
              e.body_target = "Chest";
              break;
            case 4:
              e.body_target = "Arms";
              break;
            case 5:
              e.body_target = "Cardio";
              break;
            case 6:
              e.body_target = "Full Body";
              break;
            case 7:
              e.body_target = "Abs";
              break;
            default:
              e.body_target = "Other";
          }
        });
        //end for
      });
    },
    // saveExercise() {
    //   exerciseService
    //     .addExercise(this.exercise)
    //     .then((response) => {
    //       if (response.status === 201) {
    //         this.$router.push("/");
    //       }
    //     })
    //     .catch((error) => {
    //       this.handleErrorResponse(error, "adding");
    //     });
    // },
    deleteExercise(exercise) {
      exerciseService
        .deleteExercise(exercise)
        .then((response) => {
          if (response.status === 204) {
            alert("Exercise successfully deleted.");
            this.getExercises();
          }
        })
        .catch((error) => {
          alert("Cannot delete exercises that are saved in workouts!");
          this.handleErrorResponse(error, "adding");
        });
      exerciseService.listExercises().then((response) => {
        this.exercises = response.data;
        this.exercises.forEach((e) => {
          switch (e.body_target_id) {
            case 1:
              e.body_target = "Legs";
              break;
            case 2:
              e.body_target = "Back";
              break;
            case 3:
              e.body_target = "Chest";
              break;
            case 4:
              e.body_target = "Arms";
              break;
            case 5:
              e.body_target = "Cardio";
              break;
            case 6:
              e.body_target = "Full Body";
              break;
            case 7:
              e.body_target = "Abs";
              break;
            default:
              e.body_target = "Other";
          }
        });
        //end for
      }); //end promise
    },
    filterExerciseBodyPart(e) {
      switch (e) {
        case 1:
          return this.filterLegs;
        case 2:
          return this.filterBack;
        case 3:
          return this.filterChest;
        case 4:
          return this.filterArms;
        case 5:
          return this.filterCardio;
        case 6:
          return this.filterFullBody;
        case 7:
          return this.filterAbs;
        default:
          return false;
      }
    },
    filterExerciseTime(e) {
      return e <= this.maxLength;
    },
  },
  computed: {
    getExercisesArray() {
      return this.exercises;
    },
    admin() {
      if (this.$store.state.token != "") {
        return this.$store.state.user.authorities[0].name === "ROLE_ADMIN";
      }
      return false;
    },
  },
};
</script>

<style>
/* The switch - the box around the slider */
.switch {
  position: relative;
  display: inline-block;
  width: 60px;
  height: 34px;
}

/* Hide default HTML checkbox */
.switch input {
  opacity: 0;
  width: 0;
  height: 0;
}

/* The slider */
.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: 0.4s;
  transition: 0.4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 26px;
  width: 26px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: 0.4s;
  transition: 0.4s;
}

input:checked + .slider {
  background-color: #2196f3;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196f3;
}

input:checked + .slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
  border-radius: 34px;
}

.slider.round:before {
  border-radius: 50%;
}

.fas {
  color: black;
}

.fas:hover {
  cursor: pointer;
  color: blue;
}
</style>
