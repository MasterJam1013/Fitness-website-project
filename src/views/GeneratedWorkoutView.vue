<template>
<div>
    <generated-workout />
</div>
</template>

<script>

import GeneratedWorkout from "@/components/GeneratedWorkoutList.vue";

export default {
  components: {
 
    GeneratedWorkout
  }
};
</script>

<style>
body {
  font-family: system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
    "Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji",
    "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
    color: white;
}
</style>