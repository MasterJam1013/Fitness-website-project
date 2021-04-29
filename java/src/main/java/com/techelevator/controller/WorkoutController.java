
package com.techelevator.controller;


import com.techelevator.dao.ExerciseDAO;
import com.techelevator.dao.WorkoutDAO;
import com.techelevator.model.Exercise;
import com.techelevator.model.ExerciseTrainer;
import com.techelevator.model.Workout;
import org.springframework.context.annotation.Role;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;

@RestController
@CrossOrigin
@PreAuthorize("isAuthenticated()")

public class WorkoutController {

    private WorkoutDAO workoutDAO;
    public WorkoutController(WorkoutDAO workoutDAO){

        this.workoutDAO= workoutDAO;
    }


    @RequestMapping(path= "/workout/generate", method = RequestMethod.GET)
    public List<ExerciseTrainer> generatedWorkout(@RequestParam(required = false) int[] trainerIds, @RequestParam(required = false) int[] bodyTargetIds, @RequestParam int totalTime){
        if(trainerIds == null){
            trainerIds = new int[0];
        }
        if(bodyTargetIds == null){
            bodyTargetIds = new int[0];
        }
        return workoutDAO.generateWorkout(trainerIds, bodyTargetIds, totalTime);
    }

    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path = "/workout/save", method = RequestMethod.POST)
    public boolean addExercise(@RequestBody List<ExerciseTrainer> exerciseTrainers, Principal principal){
        return workoutDAO.saveCompletedWorkout(exerciseTrainers, principal);
    }

    @PreAuthorize("hasRole('ROLE_USER')")
    @RequestMapping(path = "/workout/history", method = RequestMethod.GET)
    public List<Workout> getWorkouts(Principal principal){
        String username = principal.getName();
        return workoutDAO.getUserWorkouts(username);
    }


    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @RequestMapping(path = "/workout/history/{username}", method = RequestMethod.GET)
    public List<Workout> getTrainerWorkouts(@PathVariable String username){
        return workoutDAO.getUserWorkouts(username);
    }




}

