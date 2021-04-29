package com.techelevator.dao;

import com.techelevator.model.Exercise;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;


@Component
public class ExerciseSqlDAO implements ExerciseDAO{

private JdbcTemplate jdbcTemplate;

public ExerciseSqlDAO(JdbcTemplate jdbcTemplate){
    this.jdbcTemplate= jdbcTemplate;
}
    @Override
    public boolean addExercise(Exercise exercise) {
        int exerciseCreated = 0;
        String insertExercise= "INSERT INTO Exercise(exercise_name, description, suggested_weight, exercise_reps, exercise_sets, expected_time, body_target_id, exercise_gif) "
                + "VALUES(?, ?, ?, ?, ?, ?, ?, ?) ";
        exerciseCreated= jdbcTemplate.update(insertExercise, exercise.getName(), exercise.getDescription(), exercise.getSuggestedWeight(),
                exercise.getReps(), exercise.getSets(), exercise.getTime(), exercise.getBodyTargetId(), exercise.getExerciseGif());


        return exerciseCreated != 0;
    }

    @Override
    public boolean updateExercise(Exercise exercise, int id) {
        int exerciseUpdated = 0;
        String insertExercise= "UPDATE exercise " +
                               "SET  exercise_name = ?, description = ?, suggested_weight = ?, exercise_reps = ?, "
                                + "exercise_sets = ?, expected_time = ?, body_target_id = ?, exercise_gif = ? " +
                                 "WHERE id = ?";

        exerciseUpdated= jdbcTemplate.update(insertExercise, exercise.getName(), exercise.getDescription(), exercise.getSuggestedWeight(),
              exercise.getReps(), exercise.getSets(), exercise.getTime(), exercise.getBodyTargetId(), exercise.getExerciseGif(), id);

        return exerciseUpdated != 0;
    }

    @Override
    public boolean deleteExercise(int id) {
        int exerciseDeleted = 0;

        String deleteExercise = "DELETE FROM exercise WHERE id = ?";
        exerciseDeleted= jdbcTemplate.update(deleteExercise, id);
        return exerciseDeleted != 0;
    }

    @Override
    public List<Exercise> listAllExercises() {
        List<Exercise> allExercises = new ArrayList<>();

        String exerciseSQL = "SELECT * FROM exercise ORDER BY id;";

        SqlRowSet sqlRowSet = jdbcTemplate.queryForRowSet(exerciseSQL);

        while(sqlRowSet.next()) {
            allExercises.add(mapRowToExercise(sqlRowSet));
        }
        return allExercises;
    }

    public Exercise mapRowToExercise(SqlRowSet rowSet) {
        Exercise exercise = new Exercise();
        exercise.setId(rowSet.getInt("id"));
        exercise.setName(rowSet.getString("exercise_name"));
        exercise.setSets(rowSet.getInt("exercise_sets"));
        exercise.setReps(rowSet.getInt("exercise_reps"));
        exercise.setTime(rowSet.getInt("expected_time"));
        exercise.setBodyTargetId(rowSet.getInt("body_target_id"));
        exercise.setSuggestedWeight(rowSet.getInt("suggested_weight"));
        exercise.setDescription(rowSet.getString("description"));
        exercise.setExerciseGif(rowSet.getString("exercise_gif"));
        return exercise;
    }
}
