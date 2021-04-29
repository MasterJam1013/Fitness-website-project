<template>
  <!-- <bio/> -->
  <body>
    <div class="container">
      <h3>Jaclyn Spangler</h3>
      <div class="bio">
        <img src="images\jac-trainer.jpg" alt="Jaclyn Trainer" />
        <p>
          Jaclyn, aka<span style="color: #5e62d1; font-weight: bold"> "Cardio Queen"</span>
          knows there is more to cardio than just hitting the treadmill or Stairmaster. Jaclyn's workouts are fun, intense, and target multiple major muscle groups to strengthen them while working on cardio. She has been 
          with the Git Fit family for 6 years and loves pushing
          people to be their best version. 
        </p>
      </div>
      <h3>John Baringhaus</h3>
      <div class="bio">
        <img src="images/john-2.jpg" alt="John Trainer" />
        <p>
          John <span style="color: #5e62d1; font-weight: bold">"The Chest Crusader" </span> a Certified Strength and Condition
          Specialist (CSCS) with the National
          Strength and Conditioning Association. He has an extensive
          background from training professional 
          and amateur athletes to working professionals with nominal
          experience in fitness. John approaches fitness as a life long
          behavior modification where we have continuous improvement. He
          defines his sessions
          as simple, challenging, and efficient with an emphasis
          on proper form and mobility. His favorite client is anyone
          with a goal and a willingness to work towards it!
        </p>
      </div>
      <h3>Zack Sempsrott</h3>
      <div class="bio" id ="zack">
        <img src="images/Image from iOS.jpg" alt="Zack Trainer" />
        <p>
          Zack believes in working out with an intense "no pain,
          no gain" mindset. Though he stands behind the importance of
          working the full body, he was given the
          nickname <span style="color: #5e62d1; font-weight: bold">"The Arms Assassin"</span> when he started working his biceps
          in the fourth grade. If you need a trainer who will hold you
          accountable and push you to your limits,
          Zack would be a great choice.
        </p>
      </div>
      <h3>Jamal Stephenson</h3>
      <div class="bio">
        <img src="\images\GOPR0168[1].JPG" alt="Jamal" />
        <p> "Mamba Mentality, A constant quest to be the best version of yourself". As a trainer that is all I ask, yes it will be hard, no you can not take a break, and yes you will get great results. Come to the gym to see friends, hang out, and take selfies? Sorry not the trainer for you (selfies are for post workout to admire gains).
          You can not out work a bad diet (I've tried!) when choosing myself as your trainer not only do you get the intensity of a former D1 athlete you also recieve the nutritional guidance to upgrade to you 2.0! Known around these parts as <span style="color: #5e62d1; font-weight: bold">"The Back Behemoth"</span>, you'll find out why  </p>
      </div>
      <h3>Domenic Ceccoli</h3>
      <div class="bio">
        <img src="images\IMG_1976.jpg" alt="Dom Trainer" />
        <p>Domenic has been a lifetime advocate of core strength, and his ab workout routines have taken him all over the world, earning him the nickname <span style="color: #5e62d1; font-weight: bold">"The Abs Ambassador"</span>. Domenic believes that core strength is the baseline of physical fitness, and full body fitness stems from a solid core. Are you looking to get ripped, 6 pack abs for Hot Boy (or Girl) Summer? If so, Dom just might be the perfect trainer for you! Come see why numerous Hollywood actors and actresses have come to Dom before in preparation for their blockbuster films!</p>
      </div>
    </div>
  </body>
</template>

<script>
import bioService from "@/services/BioService";
export default {
  component: bioService,
};
</script>

<style>


body {
  margin: 20px;
  padding: 0;
  font-family: sans-serif;
}

.bio {
  padding: 20px;
  margin-bottom: 20px;
  border-radius: 25px;
  border: 2px solid #5e62d1;
  display: flex;
}

.bio img {
  width: 150px;
  border-radius: 999px;
  margin: 0 10px;
}

.bio:nth-child(2n) img {
  /*display: flex;*/
  order: 2;
}

h3 {
  align-items: center;
  justify-content: center;
  display: flex;
}
</style>




