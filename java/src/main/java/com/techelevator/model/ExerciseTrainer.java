package com.techelevator.model;

public class ExerciseTrainer {
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getSuggestedWeight() {
        return suggestedWeight;
    }

    public void setSuggestedWeight(int suggestedWeight) {
        this.suggestedWeight = suggestedWeight;
    }

    public int getReps() {
        return reps;
    }

    public void setReps(int reps) {
        this.reps = reps;
    }

    public int getSets() {
        return sets;
    }

    public void setSets(int sets) {
        this.sets = sets;
    }

    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }

    public int getTrainerId() {
        return trainerId;
    }

    public void setTrainerId(int trainerId) {
        this.trainerId = trainerId;
    }

    public String getTrainerName() {
        return trainerName;
    }

    public void setTrainerName(String trainerName) {
        this.trainerName = trainerName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    private String name;
    private int id;
    private String description;
    private int suggestedWeight;
    private int reps;
    private int sets;
    private int time;
    private int trainerId;
    private String trainerName;
    private int bodyTargetId;
    private String exerciseGif;

    public String getExerciseGif() {
        return exerciseGif;
    }

    public void setExerciseGif(String exerciseGif) {
        this.exerciseGif = exerciseGif;
    }

    public int getBodyTargetId() {
        return bodyTargetId;
    }

    public void setBodyTargetId(int bodyTargetId) {
        this.bodyTargetId = bodyTargetId;
    }
}
