# cook_now
A  Flutter project.

## ABOUT ##
This is a custom user by user cook book app.
Each user upon registering gets their own entry in the FireBase Firestore database.
This entry contains 3 collections for breakfast, lunch and dinner respectively.
Here, is where their recipe lists are stored. When they click the breakfast, lunch or dinner tab,
that collection is received from the database and displayed to the user in real time. If they add a new recipe,
it instantly appears on the page since this app utilizes a Stream to the firestore database.
This app also utilizes Firebase Auth to register users to the database and sign in users that have already registered.utilizes
This login information is also persistent throughout the app using a stream listener for any auth changes (ie the logout button is pressed)
and by passing the current uid to each respective page.

## WHY I CHOSE THIS ##
I chose to code an app in flutter/dart to demonstrate how quickly I can pick up a new language and code a meaningful app in just a weeks time.
While i had been learning flutter for a few weeks before the in person interview, those apps/programs were nothing compared to
coding a real app with authentication and database connections. This was a fantastic learning experience as it forced me to challenge myself
to get this app done in just a weeks time. I hope this conveys my ability to adapt and learn when presented with a task.


## HOW TO RUN ##
1. Install Android studio IDE
2. Ensure git is installed on the system
    - can be found here if it is not already installed: https://git-scm.com/downloads
3. Install the Flutter SDK
    - multiple options to install
    - can use git with: git clone -b stable https://github.com/flutter/flutter.git
    - or install it from the flutter.dev site
    - using the flutter bat file located in the install run the flutter console
        - run >>flutter doctor
        - this will clean, update, and ensure flutter is installed properly
    - now in the normal command prompt ensure that the command 'flutter --version' returns the flutter version
        - if it does, everything is set up correctly. if it doesn't refer to a video on setting up flutter Android Studio
        - you may need to add flutter to your system environment variables
4. Open Android and create an android emulator
    - I used the Nexus 6 for testing with API Level 28 (i believe its option Pie)
    - can optionally change the emulator performance to hardware for faster rendering
5. Navigate to plugins and then the marketplace
    - install the 'Flutter' plugin
    - will install the dart plugin automatically
6. import my 'cook_now' project
7. select the emulator in the 'Flutter Device Selection' drop down then run the app!
8. The emulator should come up with the app loaded on to it

**this is my first time sharing a flutter/dart project so if there is any issues let me know and I will try to help.
**if i need to i can release the app for download straight to a real android phone but the above method should work.Android

**IMPORTANT**
When copying or importing the project ENSURE that all files and folders are imported not just the lib folder