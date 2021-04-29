import Vue from 'vue'
import Router from 'vue-router'
import Home from '../views/Home.vue'
import Login from '../views/Login.vue'
import Logout from '../views/Logout.vue'
import Register from '../views/Register.vue'
import store from '../store/index'
import Exercise from '@/views/ExerciseView.vue'
import List from '@/views/List.vue'
import Welcome from '@/views/Welcome.vue'
import Workout from '@/views/WorkoutView.vue'
import Bio from '@/views/BioView.vue'
import GeneratedWorkout from '@/views/GeneratedWorkoutView.vue'
import ExerciseDetails from '@/views/ExerciseDetails.vue'

import HistoryView from '@/views/HistoryView.vue'
import ViewSavedWorkoutDetailsView from '@/views/ViewSavedWorkoutDetailsView.vue'
import AllUsers from '@/views/AllUsers.vue'
import UserDetails from '@/views/UserDetails.vue'



Vue.use(Router)

/**
 * The Vue Router is used to "direct" the browser to render a specific view component
 * inside of App.vue depending on the URL.
 *
 * It also is used to detect whether or not a route requires the user to have first authenticated.
 * If the user has not yet authenticated (and needs to) they are redirected to /login
 * If they have (or don't need to) they're allowed to go about their way.
 */

const router = new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/home',
      name: 'home',
      component: Home,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: '/',
      name: 'welcome',
      component: Welcome,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/login",
      name: "login",
      component: Login,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/logout",
      name: "logout",
      component: Logout,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/register",
      name: "register",
      component: Register,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/exercise/add",
      name: "Exercise",
      component: Exercise,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: "/exercise/edit/:id",
      name: "edit",
      component: Exercise,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: "/exercises",
      name: "List",
      component: List,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/exercise/delete/:id",
      name: "delete",
      component: Exercise,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: "/workout",
      name: "workout",
      component: Workout,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/trainerbio",
      name: "trainerbio",
      component: Bio,
      meta: {
        requiresAuth: false
      }
    },
    {
      path:"/myworkout",
      name: "generatedWorkout",
      component: GeneratedWorkout,
      meta: {
        requiresAuth :true
      }

    },
    {
      path:"/myworkout/:id",
      name: "exerciseDetails",
      component: ExerciseDetails,
      meta: {
        requiresAuth :true
      }
    },
    {
      // user logged in history
    path: "/history",
    name: "historyView",
    component: HistoryView,
    meta: {
      requiresAuth :true
    }
  },
  {
    path: "/history/:id",
    name: "ViewSavedWorkoutDetailsView",
    component: ViewSavedWorkoutDetailsView,
    meta: {
      requiresAuth: true
    }
  },
  {
    //logged in as trainer getting full list of users
    path: "/allUsers",
    name: "all-users",
    component: AllUsers,
    meta: {
      requiresAuth :true
    }
  },
  {
    //logged in as a trainer getting user details 
  path: "/allUsers/:username",
  name: "user-details",
  component: UserDetails,
  meta: {
    requiresAuth :true
  }
  }
  ]
})

router.beforeEach((to, from, next) => {
  // Determine if the route requires Authentication
  const requiresAuth = to.matched.some(x => x.meta.requiresAuth);

  // If it does and they are not logged in, send the user to "/login"
  if (requiresAuth && store.state.token === '') {
    next("/login");
  } else {
    // Else let them go to their next destination
    next();
  }
});

export default router;
