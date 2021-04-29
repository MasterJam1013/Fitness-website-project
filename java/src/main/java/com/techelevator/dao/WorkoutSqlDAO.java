package com.techelevator.dao;


import com.techelevator.model.Authority;
import com.techelevator.model.Exercise;
import com.techelevator.model.ExerciseTrainer;
import com.techelevator.model.Workout;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

@Component
public class WorkoutSqlDAO implements WorkoutDAO {

    private JdbcTemplate jdbcTemplate;

    public WorkoutSqlDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public boolean saveCompletedWorkout(List<ExerciseTrainer> exerciseTrainers, Principal principal) {

        int workoutUpdated= 0;
        int newWorkoutId = getNewWorkoutId();
        for (ExerciseTrainer exerciseTrainer : exerciseTrainers) {
            String sql = "INSERT INTO workout(workout_id, exercise_id, trainer_id, sets_completed, reps_completed, weight_completed, time_completed, total_time, username, date_saved) "
                        +"VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
             workoutUpdated = jdbcTemplate.update(sql, newWorkoutId, exerciseTrainer.getId(), exerciseTrainer.getTrainerId(), exerciseTrainer.getSets(), exerciseTrainer.getReps(),
                    exerciseTrainer.getSuggestedWeight(), exerciseTrainer.getTime(), getTotalTime(exerciseTrainers), principal.getName(), LocalDate.now());
        }
        return (workoutUpdated== 1);
    }

    @Override
    public List<ExerciseTrainer> generateWorkout(int[] trainerIds, int[] bodyTargetIds, int totalTime) {
        List<ExerciseTrainer> allExerciseTrainers = new ArrayList<>();

        String SQL = "SELECT * FROM exercise " +
                "INNER JOIN trainers_exercises ON trainers_exercises.exercise_id = exercise.id " +
                "INNER JOIN trainer ON trainer.trainer_id = trainers_exercises.trainer_id ";

        SqlRowSet sqlRowSet = jdbcTemplate.queryForRowSet(SQL);

        while (sqlRowSet.next()) {
            allExerciseTrainers.add(mapRowToExercise(sqlRowSet));
        }

        //filter by trainer
        if(trainerIds.length > 0) {
            allExerciseTrainers = filterByTrainer(allExerciseTrainers, trainerIds);
        }

        //filter by body target
        if (bodyTargetIds.length > 0){
            allExerciseTrainers = filterByBodyTarget(allExerciseTrainers, bodyTargetIds);
        }

        allExerciseTrainers = removeDuplicates(allExerciseTrainers);

        Collections.shuffle(allExerciseTrainers);
        int timeCounter = 0;
        List<ExerciseTrainer> filteredExerciseTrainers = new ArrayList<>();

        //filter by time
        for (int i = 0; i < allExerciseTrainers.size(); i++){
            timeCounter += allExerciseTrainers.get(i).getTime();
            filteredExerciseTrainers.add(allExerciseTrainers.get(i));
            if (totalTime - timeCounter < 10 || totalTime - timeCounter < -10){
                return filteredExerciseTrainers;
            }
        }
        return filteredExerciseTrainers;
    }

    @Override
    public List<Workout> getUserWorkouts(String username){

        List<Workout> userWorkouts = new ArrayList<>();
        String sql= "SELECT workout.workout_id, exercise.exercise_name, trainer.trainer_name, workout.sets_completed, " +
                "workout.reps_completed, workout.weight_completed, workout.time_completed, workout.total_time, workout.date_saved, workout.exercise_id, workout.trainer_id " +
                " FROM workout " +
                "INNER JOIN exercise ON exercise.id = workout.exercise_id " +
                "INNER JOIN trainer ON trainer.trainer_id = workout.trainer_id " +
                "WHERE username = ? ORDER BY workout.workout_id";
        SqlRowSet sqlRowSet= jdbcTemplate.queryForRowSet(sql, username);
        while(sqlRowSet.next()){
            userWorkouts.add(mapRowToWorkout(sqlRowSet));
        }
        return userWorkouts;
    }

//    @Override
//    public List<Workout> getTrainerWorkouts(String username){
//
//        List<Workout> userWorkouts = new ArrayList<>();
//        String sql= "SELECT workout.workout_id, exercise.exercise_name, trainer.trainer_name, workout.sets_completed, " +
//              "workout.reps_completed, workout.weight_completed, workout.time_completed, workout.total_time, workout.date_saved, workout.exercise_id, workout.trainer_id " +
//              " FROM workout " +
//              "INNER JOIN exercise ON exercise.id = workout.exercise_id " +
//              "INNER JOIN trainer ON trainer.trainer_id = workout.trainer_id " +
//              "WHERE trainer.trainer_id = ? ORDER BY workout.workout_id";
//        SqlRowSet sqlRowSet= jdbcTemplate.queryForRowSet(sql, username);
//        while(sqlRowSet.next()){
//            userWorkouts.add(mapRowToWorkout(sqlRowSet));
//        }
//        return userWorkouts;
//    }


    private List<ExerciseTrainer> removeDuplicates(List<ExerciseTrainer> exercises) {

        //sort the exercises using a comparator
        exercises.sort( (left, right) -> {
        //sort the exercises by exercise id using a lambda
            if (left.getId() > right.getId()) {
                return 1;
            } else if (right.getId() > left.getId()) {
                return -1;
            }
            return 0;
        });

        List<ExerciseTrainer> noDupes = new ArrayList<>();
        //Iterate through the array looking for duplicate exercises
        for(int i = 0; i < exercises.size(); i++) {
            int ii = 1;
            //find the number of exercises that share the same id. that value is ii+1
            while(ii+i < exercises.size() && exercises.get(i).getId() == exercises.get(i+ii).getId()) {
                ii++;
            }
            //remove one from ii because last duplicate exercise is exercises.get(i-ii-ONE)
            ii--;
            //generate a random number based on the number of duplicate exercises. IE three duplicate exercises will get a number from 0 to 2
            int rando = (int)(Math.random()*ii);
            //add only one of the duplicates to the array to be returned.
            noDupes.add(exercises.get(i+rando));
            i+=ii;
        }

        return noDupes;
    }


    private List<ExerciseTrainer> filterByTrainer(List<ExerciseTrainer> allExerciseTrainers, int[] trainerIds){
        List<ExerciseTrainer> updatedExerciseTrainers = new ArrayList<>();
        for(int i = 0; i < allExerciseTrainers.size(); i++){
            for(int j=0; j< trainerIds.length; j++){
                if(trainerIds[j] == allExerciseTrainers.get(i).getTrainerId()){
                    updatedExerciseTrainers.add(allExerciseTrainers.get(i));
                }
            }
        }
        return updatedExerciseTrainers;

    }
    private List<ExerciseTrainer> filterByBodyTarget(List<ExerciseTrainer> allExerciseTrainers, int[] bodyTargetIds){
        List<ExerciseTrainer> updatedExerciseTrainers = new ArrayList<>();
        for(int i = 0; i < allExerciseTrainers.size(); i++){
            for(int j=0; j< bodyTargetIds.length; j++){
                if(bodyTargetIds[j] == allExerciseTrainers.get(i).getBodyTargetId()){
                    updatedExerciseTrainers.add(allExerciseTrainers.get(i));
                }
            }
        }
        return updatedExerciseTrainers;
    }
    private int getNewWorkoutId(){
        String sql = "SELECT workout_id FROM workout ORDER BY workout_id DESC LIMIT 1 "; //max workout id
        SqlRowSet sqlRowSet = jdbcTemplate.queryForRowSet(sql);
        int newWorkoutId = 1;
        if(sqlRowSet.next()){
            newWorkoutId+= sqlRowSet.getInt("workout_id");
        }
        return newWorkoutId;
    }
    private int getTotalTime(List<ExerciseTrainer> exerciseTrainers){
        int sum = 0;
        for(ExerciseTrainer exerciseTrainer: exerciseTrainers){
            sum += exerciseTrainer.getTime();
        }
        return sum;

    }

    public ExerciseTrainer mapRowToExercise(SqlRowSet rowSet) {
        ExerciseTrainer exercise = new ExerciseTrainer();
        exercise.setId(rowSet.getInt("id"));
        exercise.setName(rowSet.getString("exercise_name"));
        exercise.setSets(rowSet.getInt("exercise_sets"));
        exercise.setReps(rowSet.getInt("exercise_reps"));
        exercise.setTime(rowSet.getInt("expected_time"));
        exercise.setBodyTargetId(rowSet.getInt("body_target_id"));
        exercise.setSuggestedWeight(rowSet.getInt("suggested_weight"));
        exercise.setDescription(rowSet.getString("description"));
        exercise.setTrainerId(rowSet.getInt("trainer_id"));
        exercise.setTrainerName(rowSet.getString("trainer_name"));
        exercise.setExerciseGif(rowSet.getString("exercise_gif"));
        return exercise;


    }

    public Workout mapRowToWorkout(SqlRowSet rowSet) {
        Workout workout = new Workout();
        workout.setWorkoutId(rowSet.getInt("workout_id"));
        workout.setExerciseId(rowSet.getInt("exercise_id"));
        workout.setSetsCompleted(rowSet.getInt("sets_completed"));
        workout.setRepsCompleted(rowSet.getInt("reps_completed"));
        workout.setTimeCompleted(rowSet.getInt("time_completed"));
        workout.setTrainerId(rowSet.getInt("trainer_id"));
        workout.setWeightCompleted(rowSet.getInt("weight_completed"));
        workout.setTotalTime(rowSet.getInt("total_time"));
        String dateAsString = rowSet.getString("date_saved");
        workout.setDateSaved(LocalDate.parse(dateAsString));
        workout.setTrainerName(rowSet.getString("trainer_name"));
        workout.setExerciseName(rowSet.getString("exercise_name"));
        return workout;
    }
}



