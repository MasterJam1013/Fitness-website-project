import axios from 'axios';



  export default{
    listTrainers() {
        return axios.get(`/workout`);
      },

    generateWorkout(totalTime, trainerID, bodyPartID) {
      let query = "?totalTime=" + totalTime + "&trainerID=" + trainerID +
      "&bodyPartID=" + bodyPartID;
        return axios.get(`/workout/generate` + query);
    },

    saveCompletedWorkoutToDatabase(exercises) {
        return axios.post('workout/save/',exercises);

    },
    getSavedUserWorkouts(){
      return axios.get('/workout/history');
    },
    getAllUsers(){
      return axios.get('/allUsers');
    },
    getIdFromUsername(username){
      return axios.get('/user/' + username);
    },
    getWorkoutsFromUser(username) {
      return axios.get('/workout/history/' + username);
    }
    
  }