# promptior_test

Promptior AI Test Answer Project
Made by Jorge A Peroza M


For this test was requested to use Generative AI to ask two different questions related to Promptior.

In my case, I'm a senior flutter developer, so I decided to create one web page in flutter, 
store it in firebase hosting, using firebase auth and firebase database to control the access of the users.

Then I can ask the two questions provided in the test (defined as radio buttons) and show the
answers received from Gemini in the web page.

Briefly: 
User sign in anonymously to connect to firebase.
Then, it moves the the main page where the user can sign out or ask one of the two questions about
Promptior.
The system need to has some kind of check, so anytime the user ask one question, the web check if 
the answer was already answered in the current session, else check if the max amount of attempts
defined in the code was already reached or not. 
In case any of these two conditions works well, it triggers one request to gemini and then it process
the answer to show in the web page.

