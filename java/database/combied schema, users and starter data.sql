BEGIN TRANSACTION;

DROP table if exists trainers_exercises;
Drop table if exists users_workout;
DROP TABLE IF EXISTS users;
DROP SEQUENCE IF EXISTS seq_user_id;


DROP table if exists workout_exercise;
DROP table if exists workout;
DROP table if exists trainer;
drop table if exists Exercise;
drop table if exists body_target;


CREATE SEQUENCE seq_user_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;


CREATE TABLE users (
	user_id int DEFAULT nextval('seq_user_id'::regclass) NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');





                
create table body_target ( 
                body_target_id serial PRIMARY KEY unique,
                body_target varchar(64) NOT NULL);


CREATE table Exercise ( 
                id serial PRIMARY KEY unique,
                exercise_name varchar(64) NOT NULL,
                description varchar(2000) NOT NULL,
                suggested_weight int,
                exercise_reps int,
                exercise_sets int,
                expected_time int NOT NULL,
                body_target_id int NOT NULL,
                exercise_gif varchar(64),
                constraint fk_body_target FOREIGN KEY (body_target_id) references body_target(body_target_id) );
                
CREATE table trainer(
                trainer_id serial PRIMARY KEY unique,
                trainer_name varchar(64) NOT NULL,
                bio varchar(2000),
                picture varchar(300));
                
CREATE table workout(
                workout_id int ,
                exercise_id int , 
                trainer_id int,
                sets_completed int,
                reps_completed int,
                weight_completed int,
                time_completed int,
                total_time int,
                username varchar(50),
                date_saved DATE,
                constraint fk_trainer_id FOREIGN KEY (trainer_id) references trainer(trainer_id),
                constraint fk_exercise_id FOREIGN KEY (exercise_id) references exercise(id),
                PRIMARY KEY(workout_id, exercise_id));
                
/*CREATE table workout_exercise(
                exercise_id int NOT NULL,
                workout_id int NOT NULL,
                Primary key (exercise_id, workout_id),
                constraint fk_exercise_id FOREIGN KEY (exercise_id) references exercise(id),
                constraint fk_workout_id FOREIGN KEY (workout_id) references workout(workout_id));  
                
CREATE table users_workout(
                user_id int NOT NULL,
                workout_id int NOT NULL,
                Primary key (user_id, workout_id),
                constraint fk_user_id FOREIGN KEY (user_id) references users(user_id),
                constraint fk_workout_id FOREIGN KEY (workout_id) references workout(workout_id));  */
                
                
                
CREATE table trainers_exercises(
                exercise_id int NOT NULL,
                trainer_id int NOT NULL,
                Primary key (exercise_id, trainer_id),
                constraint fk_exercise_id FOREIGN KEY (exercise_id) references exercise(id),
                constraint fk_trainer_id FOREIGN KEY (trainer_id) references trainer(trainer_id)); 
                
                
                
INSERT INTO trainer(trainer_name)
VALUES('Jaclyn'), ('John'), ('Zack'), ('Jamal'), ('Domenic');

 
                
INSERT INTO body_target(body_target)
VALUES('legs'), ('back'), ('chest'), ('arms'), ('cardio'), ('full body'), ('abs');
                        
INSERT INTO Exercise(exercise_name, description, suggested_weight, exercise_reps, exercise_sets, expected_time, body_target_id, exercise_gif)
VALUES('chest press', 'Lie face up on a flat bench, and grip a barbell with the hands slightly wider than shoulder-width. Press the feet into the ground and the hips into the bench while lifting the bar off the rack. Slowly lower the bar to the chest by allowing the elbows to bend out to the side. Stop when the elbows are just below the bench, and press feet into the floor to press the weight straight up to return to the starting position.',
145, 10, 3, 10, 3, '/images/1-chest-press.gif');  


INSERT INTO exercise(exercise_name, suggested_weight, exercise_reps, exercise_sets, expected_time, body_target_id, description, exercise_gif)
VALUES ('Chest Press', 45, 10, 3, 10, 3 ,'Lie face up on a flat bench, and grip a barbell with the hands slightly wider than shoulder-width. Press the feet into the ground and the hips into the bench while lifting the bar off the rack. Slowly lower the bar to the chest by allowing the elbows to bend out to the side. Stop when the elbows are just below the bench, and press feet into the floor to press the weight straight up to return to the starting position.', '/images/1-chest-press.gif'),
        ( 'Bottom-up Press', 25, 10, 3, 10, 3, 'Stand with the feet hip-width apart so that the right foot is slightly in front of the left and hold a kettlebell in the right hand in a ‘bottom-up’ position by holding the top of the handle so that the bottom of the kettlebell is facing up. Keep a strong grip to maintain balance of the kettlebell. Push the right foot into the ground to shift the weight of the body forward while pressing the right arm straight overhead. Pull the right elbow back down to the rib cage to lower the weight.', '/images/3-bottom-up-press.gif'),
        ('Close-grip Bench Press', 25, 10, 3, 10, 3, 'Lie face up on a barbell bench, then reach up and grip the bar with the hands directly in line with the shoulders and the elbows pointed towards the feet. Unrack the bar and bring it towards the chest by bending the elbows and keeping them close to the ribs. Push the feet into the floor, and press the hips into the bench as the bar is pushed away from the chest to return to the starting position.', '/images/4-close-grip-bench-press.gif'),
        ('Plank-ups', 0, 10, 3, 10, 3, 'Start in a push-up position with the hands under the shoulders and the legs stretched out directly behind. Squeeze the thigh and glute muscles to keep body and legs in a straight line, and lower down to the elbows one elbow at a time. From this position on the elbows, press the hands into the floor one at a time to return to the push-up position.', '/images/5-plank-up.gif'),
        ('Push-up with Staggered Hands', 0, 10, 3, 10, 3, 'Start in a push-up position with the hands wider than shoulder-width apart and the legs straight out directly behind the body about hip-width apart. Squeeze the thighs and glutes while moving the right hand forward a couple of inches and the left hand out a couple of inches to the left side. This will create an uneven hand position. Slowly lower the body toward the ground then back up to return to the starting position.', '/images/6-push-up-staggered-hands.gif'),
         ('Squat Jump', 0, 3, 8, 8, 1, 'With your feet hip-width apart, squat until your thighs are parallel to the floor, and then jump as high as you can. Allow your knees to bend 45 degrees when you land, pause in deep squat position for one full second, and then jump again.', '/images/7-jumping-squats.gif');
 

 INSERT INTO exercise(exercise_name, suggested_weight, exercise_reps, exercise_sets, expected_time, body_target_id, description, exercise_gif) 
 VALUES ('Walking Single-leg Straight-leg Deadlift Reach', 0, 3, 8, 10, 1, 'Stand with your feet hip-width apart and your arms hanging to the side of your thighs. Lift your right leg behind you. Keeping your lower back naturally arched, bend forward at your hips and lower your torso until it’s nearly parallel to the floor while you reach your opposite hand to the floor. Return to the starting position, take two steps forward, then repeat the movement with the opposite leg.', '/images/8-single-leg-reach.gif'),
 ('Side Lunge', 0, 3, 12, 8, 1, 'Stand with your feet about twice shoulder-width apart. Keeping your right leg straight, push your hips back and to the left. Then bend your left knee and lower your body until your left thigh is parallel to the floor. Your feet should remain flat on the floor at all times. Pause for two seconds, and then return to the starting position. Complete all reps and switch sides.', '/images/9-side-lunge.gif'),
 ('Single-Leg Hip Raise', 5, 3, 12, 5, 1, 'Single-Leg Hip Raise (10)
Lie faceup, arms out to your sides at 45-degree angles, left foot flat on the floor with that knee bent, and your right leg straight. Raise your right leg until it’s in line with your left thigh. Then squeeze your glutes and push your hips up—your lower back will elevate. Pause, and return to the starting position.','/images/10-Single-Leg-raise.gif'),
 ('Alternating Drop Lunge', 0, 3, 10, 5, 1, 'Stand with your feet hip-width apart, hands on hips. Keep your chest and eyes up, shoulders squared. Cross your right leg behind your left, and bend both knees, lowering your body until your left thigh is nearly parallel to the floor. Return to start and repeat, switching sides.','/images/11-drop-lunge.gif'),
 ('Box Squat Jumps', 0, 1, 10, 10, 1, 'Perform 10 box squat jumps every minute on the minute for 10 minutes. That means that you should set a time for 10 minutes, then do 1o reps every time a new minute starts. Rest during the remainder time for each period.','/images/12-box-squat-jumps.gif'),
 ('Deadlift', 60, 5, 8, 10, 1, 'Stand tall with the barbell in front of you, then squat down and grasp it with an overhand grip. Keeping your chest up and core braced, press down through your heels to stand up. Push your hips forwards at the top, then lower.','/images/13-deadlift.gif'),
 ('Leg Press', 45, 5, 8, 10, 1, 'Sit in the machine positioned correctly according to the instructions. Place your feet lower and closer together to work your quads more, or higher and wider to hit your hamstrings and glutes more directly. Bend your knees to bring them towards your chest, then press back to the start.','/images/14-leg-press.gif'),
 ('Dumbell Lunge', 30, 3, 8, 5, 1, ' Stand tall, holding a dumbbell in each hand. With your chest up and core braced, take a big step forwards with your left leg and lunge down until both knees are bent at 90°. Push off your front foot to return to the start, then repeat with your right leg. Alternate your leading leg with each rep.','/images/15-dumbell-lunge.gif'),
 ('Front Squat', 60, 3, 10, 8, 1, 'Set a barbell on a power rack at about shoulder height. Grab the power with an overhand grip at shoulder width and raise your elbows until your upper arms are parallel to the floor. Take the bar out of the rack and let it rest on your fingertips. Your elbows should be all the way up throughout the movement. Step back and set your feet at shoulder width with toes turned out slightly. Squat as low as you can without losing the arch in your lower back.','/images/16-front-squat.gif'),
 ('Walking Lunge', 20, 3, 12, 10, 1, 'Stand with your feet hip width, holding a dumbbell in each hand. Step forward with one leg and lower your body until your rear knee nearly touches the floor and your front thigh is parallel to the floor. Step forward with your rear leg to perform the next rep.','/images/17-walking-lunges.jfif'),
 ('Reverse Lunge', 30, 3, 10, 5, 1, 'Stand with the dumbbells still in your hands and step back with your right foot. Lower your body until your front thigh is parallel to the floor and your rear knee nearly touches the floor. Keep your torso upright. Step forward to return to the starting position. Complete all reps on one leg, then switch legs. That’s one set.','/images/18-reverse-lunge.gif'),
 ('Kettle Bell Swing', 30, 3, 8, 5, 1, 'Stand with feet hip-width apart and the kettlebell on the floor. Grasp the weight with both hands (palms facing you) and, keeping your lower back flat, extend your hips to raise it off the floor. From there, take a deep breath and bend your hips back, allowing the weight to swing back between your legs. Explosively extend your hips and exhale—allowing the momentum to swing the weight up to shoulder level. Control the descent, but use the momentum to begin the next rep.','/images/19-kettle-bell-swing.gif'),
 ('Jump Squat', 0, 4, 8, 8, 1, 'Stand with feet shoulder-width apart and squat down until your thighs are about parallel to the floor but no deeper. Jump as high as you can. Land with soft knees and begin the next rep.','/images/7-jumping-squats.gif'),
 ('Kneeling Hip Flexor Stretch', 0, 3, 15, 5, 1, 'Kneel down in a lunge position with your right leg in front, and rest your back knee on a towel or mat, if available. Extend your left hand above your head and let your right hand hang at your side. Contract your left glute and push your hips forward until you feel a stretch in the front of your hip. Hold for 30 seconds.','/images/21-Kneeling-Hip-Flexor-Stretch.gif');
 

INSERT INTO exercise(exercise_name, suggested_weight, exercise_reps, exercise_sets, expected_time, body_target_id, description, exercise_gif)
VALUES ('Hammer Curl', 25, 12, 3, 10, 4 ,'Stand holding a pair of dumbbells at arms length by your sides with your palms facing each other. Keeping your elbows tucked, your upper arms locked in place (only your hands and forearms should move), and your palms facing inward, curl the dumbbells as close to your shoulders as you can.Pause, and then slowly lower the weights back to the starting position.', '/images/22-hammer-curl.gif'),
        ( 'Dumbbell Skull Crushers', 25, 10, 3, 10, 4, 'Lie down on a bench or the floor holding a pair of dumbbells directly above your chest with your palms facing each other. Your feet should be flat on the floor. Without moving your upper arms, bend your elbows and slowly lower the weights toward the sides of your head. Avoid flaring your elbows. Reverse the move to return to the starting position.', '/images/23-dumbbell-skull-crushers.gif'),
        ('Dumbbell Bicep Curl', 30, 12, 3, 10, 4, 'Begin standing tall with your feet about hip-width apart. Keep your abdominal muscles engaged. Hold one dumbbell in each hand. Let your arms relax down at the sides of your body with palms facing forward. Keeping your upper arms stable and shoulders relaxed, bend at the elbow and lift the weights so that the dumbbells approach your shoulders. Your elbows should stay tucked in close to your ribs. Exhale while lifting. Lower the weights to the starting position.', '/images/24-dumbbell-bicep-curl.gif'),
        ('Tricep Pushdown', 80, 12, 4, 10, 4, 'Set the cable machine up with the bar at head height. Grab the bar and stand upright with your back straight and your elbows tucked in to your sides. Stand with your feet hip-width apart. Pull the cable down until the bar touches your thighs and pause to squeeze your triceps at the bottom of the move. Then slowly raise the bar back to the starting position. Make sure you don’t lean forwards to aid the press and don’t let your elbows leave your sides, otherwise you’ll lose some of the focus on the triceps.', '/images/25-tricep-pushdown.gif'),
        ('Reverse Dumbbell Bicep Curl', 15, 10, 3, 10, 4, 'Stand holding a dumbbell in each hand using an overhand grip. Your arms should be fully extended and your feet shoulder width apart. Keeping your upper arms stationary and your back straight, curl the weights up towards your shoulders. Continue curling the dumbbells up until they are at shoulder level and your biceps are fully contracted. Hold for a count of one as you squeeze your biceps. Return to the starting position in a smooth arc.', '/images/26-reverse-dumbbell-curl.gif'),
        
        ('Chin Ups', 0, 10, 3, 8, 4 ,'Starting Position: Stand under the chin-up bar and reach your arms overhead with your palms facing you.  Reach, jump or lift your body off the floor to grasp the handles firmly with a full grip position (thumbs wrapped around the handles).  Gently cross one leg over the other to stabilize your lower extremity and then stiffen ("brace") your abdominal muscles to stabilize your spine. Depress and retract your scapulae (pull shoulders back and down) and attempt to hold this position throughout the exercise. Slowly exhale and slowly pull your body upwards by flexing (bending) your elbows and pulling your arms down to your sides  Attempt to pull in a motion that drives your elbows directly down towards the floor, keeping your elbows in front of your body. Attempt to keep your body aligned vertically to the floor and avoid swinging your body during your upward pull. Continue pulling upward until your chin is level with the bar or your hands.  Pause momentarily then slowly return to your starting position by allowing your arms to extend back overhead until your arms are fully extended. Repeat the movement', '/images/27-chin-up.gif'),
        ('Wrist Curl - Extension', 15, 15, 3, 7, 4, 'Holding two dumbbells, kneel and rest your elbows on a bench with approximately a 90 degree bend at the elbows and the dumbbells hanging freely off the edge of the pad. Pronate your forearms (rotate forearms to face palms downward and the bottom of the forearms are resting on the bench) while keeping your wrists in a neutral position (not in flexion or extension). Inhale and slowly allow the wrists to move into flexion (allow dumbbells to move towards the floor) without releasing your grip, extending your arms or leaning forward / backward. Hold this end position briefly. Upward Phase: Exhale and slowly contract your forearm extensor muscles (along the top of the forearm) and roll your wrists to pull the weight up and return the dumbbells back to the starting position.', '/images/28-wrist-curl-extension.gif'),
        ('Wrist Curl - Flexion', 10, 15, 3, 7, 4, 'Holding two dumbbells, kneel and rest your elbows on a bench with approximately a 90 degree bend at the elbows and the dumbbells hanging freely off the edge of the pad. Supinate your forearms (rotate the forearms so that the tops are along the bench and the palms are facing upward) keep your wrists in a neutral position. Inhale and slowly allow the wrists to move into extension (allow dumbbells to move towards the floor) without releasing your grip, extending your arms or leaning forward / backward. Hold this end position briefly. Exhale and slowly contract your forearm flexor muscles (along the top of the forearm) rolling your wrists towards you in order to return the dumbbells back to the starting position.', '/images/29-wrist-curl-flexion.gif'),
        ('Tricep Dips', 0, 12, 3, 10, 4, 'Hoist yourself up on parallel bars with your torso perpendicular to the floor, you will maintain this posture throughout the exercise. (Leaning forward will shift emphasis to your chest and shoulders.) Bend your knees and cross your ankles. Slowly lower your body until your shoulder joints are below your elbows. Push back up until your elbows are nearly straight but not locked.', '/images/57-dips.gif'),
        ('Isolated Tricep Extension', 20, 10, 3, 10, 4, 'Sit on a bench and grab one dumbbell. Form a diamond shape with both hands to grip the top end of the weight. Raise the dumbbell over your head, keeping your elbows up and your core tight. Lower the dumbbell down the top of your back by bending at the elbow, maintaining your strong chest and keeping your shoulders still. Raise the weight by fully extending your arms, pausing for a count to squeeze at the top of the movement.', '/images/31-isolated-tricep-extension.gif');


--back
INSERT INTO exercise(exercise_name, suggested_weight, exercise_reps, exercise_sets, expected_time, body_target_id, description, exercise_gif)
        VALUES('Bent-over Row', 45, 10, 3, 12, 2, 'Grip a barbell with palms down so that the wrists, elbows, and shoulders are in a straight line. Lift the bar from the rack, bend forward at the hips, and keep the back straight with a slight bend in the knees. Lower the bar towards the floor until the elbows are completely straight, and keep the back flat as the bar is pulled towards the belly button. Then slowly lower the bar to the starting position and repeat', '/images/32-bent-over-row.gif'),
        ('Standing Shrugs', 135, 10, 3, 12, 2, 'Hold a barbell with a palms-down grip with the hands about shoulder-width apart. Keep the knees slightly bent, the hips straight, and the back tall, and raise the shoulders directly upwards to the ears as high as possible, lowering slowly to the original starting position. (Tip: grip the bar and think about pulling the hands apart from one another and focus on only raising/lowering the shoulders - DO NOT roll the shoulders.)', '/images/33-standing-shrugs.gif'),
        ('Incline Reverse Flys', 40, 10, 3, 12, 2, 'Holding two dumbbells, sit on a bench facing the backrest angled at 45 to 60 degrees. Hold your torso against the backrest and keep your feet firmly placed on the floor. Allow your arms to hang towards the floor with your elbows slightly flexed and palms facing each other. Stiffen your core and abdominal muscles (“bracing”) to stabilize your spine.
           Upward Phase: Exhale and slowly raise the dumbbells up and out to the sides, raising the upper arms, elbows and dumbbells in unison until the arms are near level with the shoulders. Squeeze your scapulae (shoulder blades) together as you reach the end position. In the raised position, the dumbbells should be aligned with, or slightly in front of your ears. Avoid arching your back during the upward phase by keeping your torso firmly pressed into the backrest.
                ', '/images/34-incline-reverse-fly.gif'),
         ('Single Arm Row', 40, 10, 3, 12, 2, 'Holding a dumbbell in your right hand, bend over to place your left knee and left hand on a bench to support your body weight. Your hand should be placed directly under your shoulder and your knees should be positioned directly under your hips. Gently contract your abdominal / core muscles ("bracing") to stiffen your torso and stabilize your spine. Your back should be flat and head aligned with your spine. Depress and retract your scapulae (pull your shoulders down and back) without arching your low back and maintain this shoulder position throughout the exercise. Extend your right arm (holding the dumbbell) towards the floor without allowing your torso to rotate or shoulder to move towards the floor.
            Upward Movement: Exhale and slowly pull the dumbbell upwards, bending your elbow and pulling your upper arm backwards. Keep your arm close to the side of your body and continue pulling the dumbbell upwards until you are unable to lift any further without rotating your torso. Avoid rotating your body or changing the position of your spine throughout the lift.
                ', '/images/35-single-arm-row.gif'),
         ('Deadlift (Barbell)', 135, 10, 3, 12, 2, 'Holding a barbell with both hands so that it rests on the front of the thighs, keep a slight bend in both knees and a straight back. Push the hips back while lowering the weight towards the floor until feeling some tension along the back of the legs. To return to standing, push the heels into the floor and pull the knees backwards, keeping the bar very close to the body while standing.
                ', '/images/36-deadlift.gif');
                
--abs       
INSERT INTO Exercise(exercise_name, suggested_weight, exercise_reps, exercise_sets, expected_time, body_target_id, description, exercise_gif)
VALUES('Arms High Partial Sit Up', 0, 12, 3, 5, 7, 'Lie on your back, knees bent at 90 degrees, and raise your arms straight overhead, keeping them pointing up throughout the exercise. Sit up halfway, then steadily return to the floor. That’s one rep.', '/images/37-arms-high-sit-up.gif'),
       ('Forearm Plank', 0, 1, 3, 5, 7, 'Place your forearms on the floor, elbows directly underneath your shoulders, hands facing forward so that your arms are parallel. Extend your legs behind you, feet hip-width apart. Tuck your tailbone and engage your core, butt, and quads. Hold here for a set amount of time.', '/images/38-forearm-plank.gif'),
       ('Side Plank', 0, 1, 3, 6, 7, 'Lie on your right side with your right hand directly underneath your right shoulder. Extend your legs and stack your left foot on top of your right, and squeeze your abs and glutes to lift your hips off the floor. Extend your left hand straight up towards the ceiling and hold for a set amount of time. This is one rep. Be sure to alternate between left and right sides.', '/images/39-side-plank.gif'),
       ('Leg Lift', 0, 12, 3, 6, 7, 'Lie faceup with your legs extended and your arms on the floor by your sides. If your lower back needs some extra support, you can place your hands right underneath your butt on each side. This is the starting position. Slowly lift your legs up and toward your face, keeping them together and stopping when they are about vertical. Then, slowly lower them back down to the ground. Be sure to keep your back flat on the floor. If you are having trouble with that or feel tension in your lower back, do not lower your legs as far down.', '/images/40-leg-lift.gif');

--cardio 
INSERT INTO Exercise(exercise_name, suggested_weight, exercise_reps, exercise_sets, expected_time, body_target_id, description, exercise_gif)
VALUES ('Jumping Jacks', 0, 50, 2, 3, 5, 'Begin with the feet hip-width apart and arms down. Raise the arms out to the sides, straight in the air while jumping with the feet apart. Jump back to the starting position and land softly on the balls of your feet, bringing arms back into body. Increase intensity as needed by jumping higher or performing faster.', '/images/41-jumping-jacks.gif'),
        ('Squat Jumps', 0, 20, 3, 6, 5, 'Stand with feet hip-width apart and arms at sides. Bend at the knees to squat. Jump in the air and extend hips until body is straight. Land softly on balls of the feet, rolling backwards to absorb shock in the heels. Repeat using different arm movements to adjust difficulty.', '/images/7-squat-jump.gif'),
        ('Jump Rope', 0, 100, 2, 4, 5, 'Jump through the rope, increasing speed or alternating between jumping on two feet and one foot.', '/images/43-jump-rope.gif'),
        ('Mountain Climbers', 0, 25, 3, 4, 5, 'Start in pushup position with the right leg extended backward and the left leg near the chest with toes on the ground. Keep the hands on the ground and hips level, quickly sqitch position of legs. Continue to alternate legs, increasing speed to increase difficulty.', '/images/44-mountain-climbers.gif');


--abs
INSERT INTO Exercise(exercise_name, suggested_weight, exercise_reps, exercise_sets, expected_time, body_target_id, description, exercise_gif)
VALUES('Grounded Russian Twist', 0, 30, 3, 6, 7, 'Sit on the floor with your knees bent and heels resting on the ground. Lean back so that your torso is at 45°. Keep your chest up to stop you from hunching your back. Interlock your fingers and extend your arms in front of you. Turn your torso to the left or right, bringing your hands to touch the ground on that side. Rotate back to centre and then carry on to touch the opposite side. Once you’ve mastered the movement, make it more difficult by raising your heels off the floor and/or holding a weight.','/images/45-grounded-russian-twist.gif'),
      ('Dumbbell Woodchop', 15, 12, 3, 6, 7, 'Stand holding a dumbbell in both hands. Squat down and move the dumbbell over to the outside of your left thigh. Stand up and raise the dumbbell with straight arms, twisting to take it across your torso to finish above your right shoulder. In the final position you should have twisted your entire torso to face the dumbbell and be up on your toes, using your core to hold the position. Twist back to return the dumbbell to the starting position. Do all the required reps on one side and then swap.','/images/46-dumbbell-woodchop.gif'),
      ('Medicine Ball Crunch', 13, 15, 3, 7, 7, 'Lie on your back with your knees bent and feet flat on the floor. Hold a medicine ball – 6kg to 10kg should be fine – to your chest. Raise your torso off the floor and press the medicine ball above your head with straight arms. To encourage good form, bring your head forwards between your arms and keep your chest up as your torso reaches vertical. Slowly lower under control, keeping your arms extended so the medicine ball touches the floor behind your head. Keep the movement smooth and controlled.','/images/47-medicine-ball-crunch.gif'),
      ('Flutter Kicks', 0, 1, 3, 6, 7, 'Sometimes known as scissor kicks, this movement will certainly feel like it’s carving out your abs. Lie on your back and raise your legs so that they’re roughly 15cm above the ground. Keeping your legs straight throughout, move your legs up and down in a kicking motion, with the movement coming from your hips. Go at a pace that’s comfortable and allows you to keep your legs off the ground for the duration, and make smooth and controlled movements. Work for between 30 and 60 seconds at a time.','/images/48-flutter-kicks.gif'),          
   ('Back Squat', 65, 3, 6, 6, 1, 'Grip the bar with the hands wider than shoulder-width apart. Lift the chest up and squeeze the shoulder blades together to keep the straight back throughout the entire movement. Stand up to bring the bar off the rack and step backwards, then place the feet so that they are a little wider than shoulder-width apart. Sit back into hips and keep the back straight and the chest up, squatting down so the hips are below the knees. From the bottom of the squat, press feet into the ground and push hips forward to return to the top of the standing position.','/images/49-back-squat.gif'),
 ('Front Squat', 30, 4, 5, 10, 1, ' Stand with your feet slightly wider than hip-width, facing outward or turned slightly outwards while holding a dumbbell in each hand by your sides, with palms facing inwards.Continue to lower yourself until your thighs are parallel or almost parallel with the floor, or until your heels begin to lift off the floor, or until your torso begins to round or flex forward. Push back up to starting position.','/images/50-front-squat.gif'),
 ('Hip Hinge', 65, 3, 10, 5, 1, 'While standing, position your feet shoulder-width apart, side-by-side, with your toes pointed forward or slightly outward. Take a light bar and place it behind your head grasping the end with one hand above your head and the other end with your opposite hand in the small of your back. Push your hips backwards towards the wall behind you and hinge forward at the hips. Gently inhale and return to upright positun contracting your glutes.','/images/51-hip-hinge.gif'),
 ('Leg Crossover Stretch', 0, 1, 5, 5, 1, 'Lie flat on your back on the floor / mat in a bent-knee position. Gently exhale and slowly press the knee of the crossed leg away from your body, continue pushing your knee away from you until you reach the point of tension, avoid bouncing or pushing to the point of pain. Hold this position for 15 – 30 seconds then relax and return to your starting position.  Perform 2 – 4 repetitions then repeat to the opposite side.','/images/52-leg-crossover-stretch.gif'),
('Burpees', 0, 15, 3, 6, 6, 'Stand up straight, then get into a squat position with your hands on the floor in front of you. Kick your feet back into a push up position and lower your body so that your chest touches the floor. Jump and return your feet to the squat position as fast as possible. Immediately jump up into the air as high as you can. Add a little clap for pizazz!','/images/53-burpees.gif'),
              ('Squats', 0, 15, 3, 6, 6, 'Stand with your feed hip-width apart while pulling your shoulders back and engaging your abs. Push your butt and hips back as if you were sitting in a chair. While keeping your weight on your heels, lower down until your thighs are parallel or lower to the floor. Raise back up to the starting position, squeezing your butt and pushing your knees outward as you straighten. Hold weight for an additional challenge.','/images/54-squats.gif'),
              ('Step Ups', 0, 12, 3, 6, 6, 'Stand in front of a box or an elevated surface, pulling your shoulders back and keeping your abs tight. Set your left leg onto the box, then step to top of the box making sure your feet are flat. Step back down with the same leg, then repeat with your right leg.','/images/55-step-ups.gif'),
              ('Pull Ups', 0, 10, 3, 6, 6, 'Start by hanging from a pull up bar with your palms facing away from you. Keeping your chest up and your shoulders back, squeeze your glutes and cross your feet, then pull yourself up so that your chin rests over the bar. Lower back down with control.','/images/56-pull-up.gif'),
              ('Dips', 0, 12, 3, 5, 6, 'Stand in between a set of parallel bars. Grab the bars, straighten your arms, and hoist yourself up off the ground while slightly crossing your legs. While pulling your shoulders back and keeping your chest up, lower yourself down so that your elbows are parallel to the floor. Raise yourself back up to the starting position so that your arms are straight.','/images/57-dips.gif'),
              ('Kettlebell Swings', 10, 15, 3, 6, 6, 'Stand with your legs hip-width apart, holding a kettlebell between them. Allow the kettlebell to swing slightly behind your legs, then propel your hips forward, bringing the kettlebell straight over your head. Keep your eyes on the kettlebell and point it straight up or slightly forward. Pull the kettlebell down from the sky and repeat.','/images/19-kettle-bell-swing.gif');      
--more chest4
INSERT INTO Exercise(exercise_name, suggested_weight, exercise_reps, exercise_sets, expected_time, body_target_id, description, exercise_gif)
VALUES ('Incline Dumbbell Flye', 25, 10, 3, 5, 3, 'Set an adjustable bench to a 30°-45° angle, and lie back on it with a dumbbell in each hand. Turn your wrists so your palms face each other. Press the weights straight over your chest, then, keeping a slight bend in your elbows, spread your arms open as if you were going for a big bear hug. Lower your arms until you feel a stretch in your pecs, then bring the weights back together over your chest.','/images/59-incline-dumbbell-flye.gif'),
         ('Cable Crossover', 25, 8, 3, 6, 3, 'Stand between two facing cable stations with both pulleys set midway between the top and bottom of the station. Attach a D-handle to each pulley and hold one in each hand. Keep your elbows slightly bent, and step forward so there’s tension on the cables. Flex your pecs as you bring your hands together out in front of your chest. Alternate stretching and flexing after each set.','/images/60-cable-crossover.gif'),
         ('Low-Cable Crossover', 25, 8, 3, 6, 3, 'Stand between two facing cable stations and attach a D-handle to the low pulleys on each. With a handle in each hand and elbows slightly bent, raise your arms from waist height to out in front of your chest, flexing your pecs as you bring them together.','/images/61-low-cable-crossover.gif'),
         ('Landmine Press', 50, 10, 4, 7, 3, 'Wedge the end of the barbell into a corner of the room (to avoid damage to the walls, you may have to wrap a towel around it). Load the opposite end with weight and grasp it toward the end of the barbell sleeve with your right hand. Stagger your stance so your left leg is in front. Press the bar straight overhead.','/images/62-landmine-press.gif'),
         ('Prone Flye', 0, 10, 4, 7, 3, 'Hold a dumbbell in each hand and get into pushup position on the floor with palms facing each other. Spread your arms apart as in a normal dumbbell flye and lower your body until you feel a stretch in your chest, then squeeze the dumbbells and bring your hands back to pushup position. Keep your abs and glutes braced and your back flat throughout. If you’re using plate-loaded dumbbells, you may be able to roll the weight plates on the floor during the flye. Otherwise, you can place a towel under each dumbbell to facilitate sliding. If this is too difficult, perform the exercise on your knees.','/images/63-prone-flye.gif');
  
      
      --john's exercises first chest then others
      INSERT INTO trainers_exercises(exercise_id, trainer_id)
VALUES(1,2),(2,2),(3,2),(4,2),(5,2),(58,2),(59,2),(60,2),(61,2),(62,2);

INSERT INTO trainers_exercises(exercise_id, trainer_id)
VALUES(22,2),(33,2),(13,2),(45,2),(19,2),(35,2),(29,2),(28,2),(51,2);

--zack's arms
  INSERT INTO trainers_exercises(exercise_id, trainer_id)
  VALUES(23,3), (30, 3), (25, 3), (24,3), (22,3), (32, 3), (33, 3), (39, 3), (45, 3), (47, 3), (38, 3), (40, 3), (34, 3), (49, 3), (50,3), (26,3), (31,3), (36, 3), (37, 3);
  
  --jamal back

                  INSERT INTO trainers_exercises(exercise_id, trainer_id)
                  VALUES(1,4), (8,4), (12,4), (10,4), (6,4), (13,4), (18,4), (22,4), (2,4), (24,4), (30,4), (11,4), (32,4), (29,4), (25,4), (43,4), (46,4), (38,4), (40,4), (23,4), (4,4);      
                  
                  --dom
                  INSERT INTO trainers_exercises(exercise_id, trainer_id)
VALUES (37,5), (38,5), (39,5), (40,5), (45,5), (46, 5), 
        (47, 5), (48, 5), (53,5), (54,5), (55, 5), (56,5),
        (57,5), (58,5), (41,5), (42,5), (43,5), (44,5), (7,5), (12,5);
        
        --jaclyn
         INSERT INTO trainers_exercises(exercise_id, trainer_id)
 VALUES(41, 1),(42, 1),(43, 1),(44,1), (4, 1), 
        (5, 1), (7, 1), (9, 1), (12, 1), (15, 1),
        (19, 1), (20, 1), (21, 1), (34, 1), (39, 1),
        (45, 1), (48, 1), (47, 1), (57, 1);
        
        INSERT INTO workout (workout_id, exercise_id, trainer_id, sets_completed, reps_completed, weight_completed, time_completed, total_time, username, date_saved) VALUES (1, 38, 3, 3, 1, 0, 5, 54, 'user', '2021-04-11');
INSERT INTO workout (workout_id, exercise_id, trainer_id, sets_completed, reps_completed, weight_completed, time_completed, total_time, username, date_saved) VALUES (1, 58, 5, 3, 15, 10, 6, 54, 'user', '2021-04-11');
INSERT INTO workout (workout_id, exercise_id, trainer_id, sets_completed, reps_completed, weight_completed, time_completed, total_time, username, date_saved) VALUES (1, 36, 3, 3, 10, 135, 12, 54, 'user', '2021-04-11');
INSERT INTO workout (workout_id, exercise_id, trainer_id, sets_completed, reps_completed, weight_completed, time_completed, total_time, username, date_saved) VALUES (1, 45, 1, 3, 30, 0, 6, 54, 'user', '2021-04-11');
INSERT INTO workout (workout_id, exercise_id, trainer_id, sets_completed, reps_completed, weight_completed, time_completed, total_time, username, date_saved) VALUES (1, 10, 4, 12, 3, 5, 5, 54, 'user', '2021-04-11');
INSERT INTO workout (workout_id, exercise_id, trainer_id, sets_completed, reps_completed, weight_completed, time_completed, total_time, username, date_saved) VALUES (1, 20, 1, 8, 4, 0, 8, 54, 'user', '2021-04-11');
INSERT INTO workout (workout_id, exercise_id, trainer_id, sets_completed, reps_completed, weight_completed, time_completed, total_time, username, date_saved) VALUES (1, 11, 4, 10, 3, 0, 5, 54, 'user', '2021-04-11');
INSERT INTO workout (workout_id, exercise_id, trainer_id, sets_completed, reps_completed, weight_completed, time_completed, total_time, username, date_saved) VALUES (1, 29, 4, 3, 15, 10, 7, 54, 'user', '2021-04-11');
INSERT INTO workout (workout_id, exercise_id, trainer_id, sets_completed, reps_completed, weight_completed, time_completed, total_time, username, date_saved) VALUES (2, 42, 1, 3, 20, 0, 6, 22, 'user', '2021-04-11');
INSERT INTO workout (workout_id, exercise_id, trainer_id, sets_completed, reps_completed, weight_completed, time_completed, total_time, username, date_saved) VALUES (2, 40, 5, 3, 12, 0, 6, 22, 'user', '2021-04-11');
INSERT INTO workout (workout_id, exercise_id, trainer_id, sets_completed, reps_completed, weight_completed, time_completed, total_time, username, date_saved) VALUES (2, 25, 4, 4, 12, 80, 10, 22, 'user', '2021-04-11');
INSERT INTO workout (workout_id, exercise_id, trainer_id, sets_completed, reps_completed, weight_completed, time_completed, total_time, username, date_saved) VALUES (3, 37, 5, 3, 12, 0, 5, 25, 'user', '2021-04-11');
INSERT INTO workout (workout_id, exercise_id, trainer_id, sets_completed, reps_completed, weight_completed, time_completed, total_time, username, date_saved) VALUES (3, 1, 4, 3, 10, 145, 10, 25, 'user', '2021-04-11');
INSERT INTO workout (workout_id, exercise_id, trainer_id, sets_completed, reps_completed, weight_completed, time_completed, total_time, username, date_saved) VALUES (3, 22, 4, 3, 12, 25, 10, 25, 'user', '2021-04-11');
INSERT INTO workout (workout_id, exercise_id, trainer_id, sets_completed, reps_completed, weight_completed, time_completed, total_time, username, date_saved) VALUES (4, 36, 3, 3, 10, 135, 12, 28, 'user', '2021-04-11');
INSERT INTO workout (workout_id, exercise_id, trainer_id, sets_completed, reps_completed, weight_completed, time_completed, total_time, username, date_saved) VALUES (4, 39, 3, 3, 1, 0, 6, 28, 'user', '2021-04-11');
INSERT INTO workout (workout_id, exercise_id, trainer_id, sets_completed, reps_completed, weight_completed, time_completed, total_time, username, date_saved) VALUES (4, 6, 4, 3, 10, 0, 10, 28, 'user', '2021-04-11');
INSERT INTO workout (workout_id, exercise_id, trainer_id, sets_completed, reps_completed, weight_completed, time_completed, total_time, username, date_saved) VALUES (5, 43, 1, 2, 100, 0, 4, 10, 'user', '2021-04-11');
INSERT INTO workout (workout_id, exercise_id, trainer_id, sets_completed, reps_completed, weight_completed, time_completed, total_time, username, date_saved) VALUES (5, 46, 5, 3, 12, 15, 6, 10, 'user', '2021-04-11');
INSERT INTO workout (workout_id, exercise_id, trainer_id, sets_completed, reps_completed, weight_completed, time_completed, total_time, username, date_saved) VALUES (6, 42, 5, 3, 20, 0, 6, 32, 'user', '2021-04-11');
INSERT INTO workout (workout_id, exercise_id, trainer_id, sets_completed, reps_completed, weight_completed, time_completed, total_time, username, date_saved) VALUES (6, 23, 3, 3, 10, 25, 10, 32, 'user', '2021-04-11');
INSERT INTO workout (workout_id, exercise_id, trainer_id, sets_completed, reps_completed, weight_completed, time_completed, total_time, username, date_saved) VALUES (6, 48, 5, 3, 1, 0, 6, 32, 'user', '2021-04-11');
INSERT INTO workout (workout_id, exercise_id, trainer_id, sets_completed, reps_completed, weight_completed, time_completed, total_time, username, date_saved) VALUES (6, 45, 2, 3, 30, 0, 6, 32, 'user', '2021-04-11');
INSERT INTO workout (workout_id, exercise_id, trainer_id, sets_completed, reps_completed, weight_completed, time_completed, total_time, username, date_saved) VALUES (6, 44, 1, 3, 25, 0, 4, 32, 'user', '2021-04-11');



DELETE FROM workout
WHERE exercise_id = 1 OR exercise_id = 42 OR exercise_id = 20;

DELETE FROM trainers_exercises
WHERE exercise_id = 1 OR exercise_id = 42 OR exercise_id = 20;

DELETE FROM exercise
WHERE id = 1 OR id = 42 OR id = 20;
 
 
COMMIT;





CREATE USER final_capstone_owner
WITH PASSWORD 'finalcapstone';

GRANT ALL
ON ALL TABLES IN SCHEMA public
TO final_capstone_owner;

GRANT ALL
ON ALL SEQUENCES IN SCHEMA public
TO final_capstone_owner;

CREATE USER final_capstone_appuser
WITH PASSWORD 'finalcapstone';

GRANT SELECT, INSERT, UPDATE, DELETE
ON ALL TABLES IN SCHEMA public
TO final_capstone_appuser;

GRANT USAGE, SELECT
ON ALL SEQUENCES IN SCHEMA public
TO final_capstone_appuser;






