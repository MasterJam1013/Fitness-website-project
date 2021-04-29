import axios from 'axios';




  export default{

    addExercise(exercise){
        return axios.post('/exercise/add', exercise);
    },

    editExercise(exercise) {
      return axios.put(`/exercise/${exercise.id}`, exercise)
    },
    listExercises() {
      return axios.get(`/exercises`);
    },
    deleteExercise(exercise){
      return axios.delete(`/exercise/${exercise.id}`);
    }
  }