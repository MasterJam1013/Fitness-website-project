package com.techelevator.model;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

public class Workout {


    private int workoutId;
    private int exerciseId;
    private int trainerId;
    private int setsCompleted;
    private int repsCompleted;
    private int weightCompleted;
    private int timeCompleted;
    private LocalDate dateSaved;
    private int totalTime;
    private String exerciseName;
    private String trainerName;

    public String getTrainerName() {
        return trainerName;
    }

    public void setTrainerName(String trainerName) {
        this.trainerName = trainerName;
    }

    public String getExerciseName() {
        return exerciseName;
    }

    public void setExerciseName(String exerciseName) {
        this.exerciseName = exerciseName;
    }

    public int getWeightCompleted() {
        return weightCompleted;
    }

    public void setWeightCompleted(int weightCompleted) {
        this.weightCompleted = weightCompleted;
    }

    public int getWorkoutId() {
        return workoutId;
    }

    public void setWorkoutId(int workoutId) {
        this.workoutId = workoutId;
    }

    public int getExerciseId() {
        return exerciseId;
    }

    public void setExerciseId(int exerciseId) {
        this.exerciseId = exerciseId;
    }

    public int getTrainerId() {
        return trainerId;
    }

    public void setTrainerId(int trainerId) {
        this.trainerId = trainerId;
    }

    public int getSetsCompleted() {
        return setsCompleted;
    }

    public void setSetsCompleted(int setsCompleted) {
        this.setsCompleted = setsCompleted;
    }

    public int getRepsCompleted() {
        return repsCompleted;
    }

    public void setRepsCompleted(int repsCompleted) {
        this.repsCompleted = repsCompleted;
    }

    public int getTimeCompleted() {
        return timeCompleted;
    }

    public void setTimeCompleted(int timeCompleted) {
        this.timeCompleted = timeCompleted;
    }

    public LocalDate getDateSaved() {
        return dateSaved;
    }

    public void setDateSaved(LocalDate dateSaved) {
        this.dateSaved = dateSaved;
    }

    public int getTotalTime() {
        return totalTime;
    }

    public void setTotalTime(int totalTime) {
        this.totalTime = totalTime;
    }
}
