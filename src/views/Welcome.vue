<template>
  <section>
    <div class="container">
    </div>
    <div class="container">
      <div class="row mt-4">
        <div class="col-lg-12 col-xs-12" style="background-image: url('images/steps.jpeg'); background-size: cover;">
          <!-- <img src="images/steps.jpeg" /> -->
          <h1 class="text-center" style="color: #FFFFFF;">
            Push your body-- <br />
            You'll pull the rewards!
            <br>
            <br>
            <br>
            <br>
          </h1>
        </div>
        <div class="col-lg-4 col-xs-12" style="background-image: url('images/steps.jpeg')">
          <!-- <img src="images/steps.jpeg" width="auto"/> -->
        </div>
      </div>
      <hr>
      <div class="row">
        <div class="col-lg-6 col-xs-12">
          <h2>Our Story</h2>
          <p id="welcome-slogan">
            While there is nothing better than spending hours creating original
            code and watching it take shape over time, this profession is often paired with
            hours of sitting and minimal movement. <br />
            Founded by five passionate and talented software developers based in
            Cincinnati, OH, we understand the need and importance of a balanced
            lifestyle through physical exercise. <br />
            Whether you are starting from day 1, or just wanting to shed or tone up that
            pandemic poundage, we will be as attentive to your needs as we are
            to our own code!<br />We specialize in a variety of physical
            fitness styles tailored to your needs, goals, and individual
            lifestyle.
          </p>
        </div>
        <div class="col-lg-6 col-xs-12">
          <h2 class="welcome-header">Why Git?</h2>
          <p class="content" id="welcome-slogan">
            GIT is an open source software for tracking and coordinating changes,
            often used by programmers and software developers. No better name describes our mentality
            towards your fitness goals.<br />
            We will add our unique and experienced perspective as we
            track your development and chart your progress. We are Commited to tackling all your
            physical fitness goals, and we will Push you to be the best Version of yourself.
          </p>
        </div>
      </div>

      <hr>
      <div class="row">
        <div class="col-12 mx-4 mb-2">
          <h2>Our trainers</h2>
        </div>
      </div>
      <div class="trainer-photos">
        
        <div class="photo mx-3">
          <router-link :to="{ path: '/trainerbio', hash: '#zack'}">
          <img
            class="trainer-image"
            src="/images/trainer/zack.jpg"
            width="100%"
            height="100%"
          />
          <div class="overlay">
            <div class="zack_description">
              Trainer Zack <br>
              Arm Assassin
              </div>
          </div>
          </router-link>
        </div>
        <div class="photo mx-3">
          <router-link v-bind:to="{ path: '/trainerbio', hash: '#dom'}">
          <img
            class="trainer-image"
            src="images/trainer/dom.jpg"
            width="100%"
            height="100%"
          />
          <div class="overlay">
            <div class="zack_description">
              Trainer Dom <br>
              Ab Ambassador
              </div>
          </div>
          </router-link>
        </div>
        <div class="photo mx-3">
          <router-link v-bind:to="{ path: '/trainerbio', hash: '#john'}">
          <img
            class="trainer-photo"
            src="images/trainer/john.jpg"
            width="100%"
            height="100%"
          />
          <div class="overlay">
            <div class="zack_description">
              Trainer John <br>
              Chest Crusader
              </div>
          </div>
           </router-link>
        </div>
        <div class="photo mx-3">
          <router-link v-bind:to="{ path: '/trainerbio', hash: '#jac'}">
          <img
            class="trainer-photo"
            src="images/trainer/jaclyn.jpg"
            width="100%"
            height="100%"
          />
          <div class="overlay">
            <div class="zack_description">
              Trainer Jac <br />
              Cardio Queen <br />
            </div>
          </div>
           </router-link>
        </div>
        <div class="photo mx-3">
          <router-link v-bind:to="{ path: '/trainerbio', hash: '#jac'}">
          <img
            class="trainer-photo"
            src="images/trainer/jamal.jpg"
            width="100%"
            height="100%"
          />
          <div class="overlay">
            <div class="zack_description">
              Trainer Jamal <br>
              Back Behemoth
              </div>
          </div>
           </router-link>
        </div>
      </div>

    </div>
  </section>
</template>

<script>


export default {
  name: "welcome",
  created() {
  },
  methods: {
    }
}
</script>

<style scoped>
p#welcome-slogan {
  color: black;
  size: 10rem;
  animation: none;
  font-family: "Times New Roman", Times, serif;
  line-height: 1.5rem;
  font-size: 110%;
  /*font-style: italic;*/
}

h2 {
  text-shadow: 0.05px 0.05px #5e62d1;
}

.content {
  align-content: left;
}
.col-6,
.col-5 {
  background-color: #f8f9fa;
  border-radius: 25px;
  border: 2px solid #5e62d1;
  padding: 20px;
}
.trainer-photos {
  display: flex;
}
.photo {
  flex: 20%;
  padding: 2px;
}
.photo,
.photo * {
  box-sizing: border-box;
}
.photo {
  position: relative;
  display: inline-block;
  overflow: hidden;
  max-width: auto;
  height: auto;
}
.photo img {
  max-width: 100%;
}
.photo .trainer-photo {
  display: block;
}
.photo .overlay {
  opacity: 0;
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.6);
  color: #fff;
  padding: 15px;
  -moz-transition: all 0.4s ease-in-out 0s;
  -webkit-transition: all 0.4s ease-in-out 0s;
  -ms-transition: all 0.4s ease-in-out 0s;
  transition: all 0.4s ease-in-out 0s;
}
.photo:hover .overlay,
.photo.active .overlay {
  opacity: 1;
}
.photo .trainer-photo {
  text-align: center;
  font-size: 18px;
  display: inline-block;
  position: absolute;
  top: 50%;
  left: 50%;
  -moz-transform: translate(-50%, -50%);
  -webkit-transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
}

/*h2.welcome-header {
  align-items: left;
}
*/
</style>
