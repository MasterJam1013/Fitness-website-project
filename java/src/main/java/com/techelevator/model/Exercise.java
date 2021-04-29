package com.techelevator.model;

public class Exercise {
    private String name;
    private int id;
    private String description;
    private int suggestedWeight;
    private int reps;
    private int sets;
    private int time;
//    private String bodyTarget;
    private int bodyTargetId;
    private String exerciseGif;

    public String getExerciseGif() {
        return exerciseGif;
    }

    public void setExerciseGif(String exerciseGif) {
        this.exerciseGif = exerciseGif;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

//    public String getBodyTarget() {
//        return bodyTarget;
//    }
//
//    public void setBodyTarget(String bodyTarget) {
//        this.bodyTarget = bodyTarget;
//    }

    public int getBodyTargetId() {
        return bodyTargetId;
    }

    public void setBodyTargetId(int bodyTargetId) {
        this.bodyTargetId = bodyTargetId;
    }
}
