<template>
<div>
    <display-workout-list />
    
</div>
</template>

<script>
import DisplayWorkoutList from "@/components/DisplayWorkoutList.vue"; 



export default {
  components: {
    DisplayWorkoutList
    
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