<template>
  <section>
    <div class="container text-center">
      <div class="row justify-content-center">
        <div class="col-12">
          <div class="display-4 my-4">Choose your workout filters</div>
          <form class="generate-workout-form">
            <h3>Trainer(s):</h3>
            <table class="table" style="border: none; color: white">
              <tr style="border: none">
                <td style="border: none">Jaclyn</td>
                <td style="border: none">John</td>
                <td style="border: none">Zack</td>
                <td style="border: none">Jamal</td>
                <td style="border: none">Dom</td>
              </tr>
              <tr style="border: none">
                <td style="border: none">
                  <label class="switch">
                    <input type="checkbox" v-model="filterJaclyn" />
                    <span class="slider round"></span>
                  </label>
                </td>
                <td style="border: none">
                  <label class="switch">
                    <input type="checkbox" v-model="filterJohn" />
                    <span class="slider round"></span>
                  </label>
                </td>
                <td style="border: none">
                  <label class="switch">
                    <input type="checkbox" v-model="filterZack" />
                    <span class="slider round"></span>
                  </label>
                </td>
                <td style="border: none">
                  <label class="switch">
                    <input type="checkbox" v-model="filterJamal" />
                    <span class="slider round"></span>
                  </label>
                </td>
                <td style="border: none">
                  <label class="switch">
                    <input type="checkbox" v-model="filterDom" />
                    <span class="slider round"></span>
                  </label>
                </td>
              </tr>
            </table>

            <h3>Body Target(s)</h3>
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
              <tr style="border: none">
                <td colspan="7" style="border: none">
                  <select v-model="maxLength" class="custom-select">
                    <option value="30">20-40 minutes</option>
                    <option value="60" selected="selected"
                      >50-70 minutes</option
                    >
                    <option value="90">80-100 minutes</option>
                    <option value="110">MAX 120 minutes</option>
                  </select>
                </td>
              </tr>
            </table>

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
              <select class="custom-select" v-model="maxLength">
                    <option value="30">20-40 minutes</option>
                    <option value="60" selected="selected"
                      >50-70 minutes</option
                    >
                    <option value="90">80-100 minutes</option>
                    <option value="110">MAX 120 minutes</option>
                  </select>
            </div>
            <div></div>
          </form>

          <div class="mt-4">
            <button
              class="col-12 p-4"
              type="button"
              v-on:click="generateFilteredWorkout()"
            >
              Generate Workout
            </button>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
import workoutService from "@/services/WorkoutService";
export default {
  data() {
    return {
      trainers: [],
      filterTrainers: [true, true, true, true, true],
      filterZack: true,
      filterJaclyn: true,
      filterDom: true,
      filterJamal: true,
      filterJohn: true,
      filterArms: true,
      filterChest: true,
      filterBack: true,
      filterCardio: true,
      filterFullBody: true,
      filterLegs: true,
      filterAbs: true,
      maxLength: 90,
      filterBodyTargetId: [],
    };
  },
  created() {
    // this.getTrainers();
  },
  methods: {
    generateFilteredWorkout() {
      this.filterBodyTargetId = [];
      this.trainers = [];
      if (this.filterJaclyn) {
        this.trainers.push(1);
      }
      if (this.filterJohn) {
        this.trainers.push(2);
      }
      if (this.filterZack) {
        this.trainers.push(3);
      }
      if (this.filterJamal) {
        this.trainers.push(4);
      }
      if (this.filterDom) {
        this.trainers.push(5);
      }
      if (this.filterLegs) {
        this.filterBodyTargetId.push(1);
      }
      if (this.filterBack) {
        this.filterBodyTargetId.push(2);
      }
      if (this.filterChest) {
        this.filterBodyTargetId.push(3);
      }
      if (this.filterArms) {
        this.filterBodyTargetId.push(4);
      }
      if (this.filterCardio) {
        this.filterBodyTargetId.push(5);
      }
      if (this.filterFullBody) {
        this.filterBodyTargetId.push(6);
      }
      if (this.filterAbs) {
        this.filterBodyTargetId.push(7);
      }
      workoutService
        .generateWorkout(this.maxLength, this.trainers, this.filterBodyTargetId)
        .then((response) => {
          this.$store.commit("SET_WORKOUT", response.data);
          if (response.status == 200) {
            this.$router.push("/myworkout");
          }
        })
        .catch((error) => {
          console.log(error);
        });
    },
    filterTrainer(e) {
      switch (e) {
        case 1:
          return this.filterJamal;
        case 2:
          return this.filterDom;
        case 3:
          return this.filterJohn;
        case 4:
          return this.filterZach;
        case 5:
          return this.filterJaclyn;
        default:
          return false;
      }
    },
    trainerIdToWord(id) {
      switch (id) {
        case 1:
          return "Jamal";
        case 2:
          return "Dom";
        case 3:
          return "John";
        case 4:
          return "Zach";
        case 5:
          return "Jaclyn";
        case 7:
          return "Other";
      }
    },
    getTrainers() {
      workoutService.listTrainers().then((response) => {
        this.trainers = response.data;
        this.trainers.forEach((e) => {
          switch (e.trainer_id) {
            case 1:
              e.trainer_id = "Jamal";
              break;
            case 2:
              e.body_target = "Dom";
              break;
            case 3:
              e.body_target = "John";
              break;
            case 4:
              e.body_target = "Zach";
              break;
            case 5:
              e.body_target = "Jaclyn";
              break;
            default:
              e.body_target = "Other";
          }
        });
      });
    },
  },
  computed: {
    getTrainersArray() {
      this.getTrainers();
      return this.trainers;
    },
    //Adding total time value for workout
    totalTime: function() {
      let sum = 0;
      this.time.forEach((e) => {
        sum += e.time;
      });
      return sum;
    },
  },
};
</script>

<style>
p {
  color: black;
}

.generate-workout-form .table {
  display: inline;
}
</style>
