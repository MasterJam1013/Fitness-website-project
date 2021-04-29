package com.techelevator.controller;


import com.techelevator.dao.ExerciseDAO;
import com.techelevator.dao.ExerciseSqlDAO;
import com.techelevator.model.Exercise;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin

public class ExerciseController {


    private ExerciseDAO exerciseDAO;
    public ExerciseController(ExerciseDAO exerciseDAO){
        this.exerciseDAO= exerciseDAO;
    }

    @PreAuthorize("isAuthenticated()")
    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path = "/exercise/add", method = RequestMethod.POST)
    public boolean addExercise(@RequestBody Exercise exercise){
       return exerciseDAO.addExercise(exercise);
    }

    @RequestMapping(path = "/exercise/{id}", method = RequestMethod.PUT)
    public boolean updateExercise(@RequestBody Exercise exercise, @PathVariable int id){
        return exerciseDAO.updateExercise(exercise, id);
    }

    @PreAuthorize("isAuthenticated()")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    @RequestMapping(path = "/exercise/{id}", method = RequestMethod.DELETE)
    public boolean updateExercise( @PathVariable int id){
        return exerciseDAO.deleteExercise(id);
    }

    @RequestMapping(path = "/exercises", method = RequestMethod.GET)
    public List<Exercise> getAllExercises() {
        return exerciseDAO.listAllExercises();
    }


}
