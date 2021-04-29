
package com.techelevator.dao;

import com.techelevator.model.Exercise;
import com.techelevator.model.ExerciseTrainer;
import com.techelevator.model.Workout;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;
import java.util.List;

public interface WorkoutDAO {

    List<ExerciseTrainer> generateWorkout(int[] trainerIds, int[] bodyTargetIds, int totalTime);
    boolean saveCompletedWorkout(List<ExerciseTrainer> exerciseTrainers, Principal principal);
    List<Workout> getUserWorkouts(String username);
}

