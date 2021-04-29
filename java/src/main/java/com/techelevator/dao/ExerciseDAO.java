package com.techelevator.dao;

import com.techelevator.model.Exercise;

import java.util.List;

public interface ExerciseDAO {
    boolean addExercise(Exercise exercise);
    boolean updateExercise(Exercise exercise, int id);
    boolean deleteExercise(int id);
    List<Exercise> listAllExercises();

}
