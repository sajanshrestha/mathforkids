# mathforkids

  An app for kids over 2 years old which helps them to learn counting, comparing, identifying colors, positions, classifying items and mathematical exercises like addition, subtraction, multiplication and division.
  
  <hr>

<image src="https://user-images.githubusercontent.com/38868680/87585982-d5fd2380-c6ad-11ea-96b1-d4b3cf650468.png" width=100 height=200>
  
  Onboarding screen one: The user is asked to enter a user name, which will be persisted across different app launches. Since this is a simple (small size) string to be stored, I used UserDefaults. I simply extended UserDefaults class to include getUserName() and updateUserName(with:) methods.
(Concepts used: UserDefaults, Extension)

  <hr>
 
  
<image src="https://user-images.githubusercontent.com/38868680/87585984-d8f81400-c6ad-11ea-8e8b-d35484013237.png" width=100 height=200>
  
  There is not much to this screen. It simply displays greeting for the user and a welcome message. From here, the user can navigate to the game list with the tap of “Get Started” button.

Another thing, the onboarding screen only appears the first time of the app launch. After the user enters the username during the first visit of the app, there is no need to enter user name again . This condition is checked in SceneDelegate class. If UserDefaults.getUserName() returns nil, the onboarding screen appears. If it returns a username (String), you already have set the username. You are ready for the games!

  <hr>

<image src="https://user-images.githubusercontent.com/38868680/87585995-dc8b9b00-c6ad-11ea-911d-624aaa023a90.png" width=100 height=200>
  
  All the available games are displayed on this view. There is a trailing navigation item in this view which lets the user change username. For example, if the user mistypes username on the onboarding screen, it can be changed here. For each of the game rows, I have used animations. Some of them I created using SwiftUI and for some I used Lottie animations.
  
  <hr>

<image src="https://user-images.githubusercontent.com/38868680/87585999-deedf500-c6ad-11ea-9feb-e5d16a9adcee.png" width=100 height=200>
  
  This view will display available levels for each game. Initially, only level one is unlocked. If the user scores 8 or more in any level, next level gets unlocked. To store levels for each game, I again used UserDefaults because all I need for this is to store a dictionary ([gameNames: String, currentLevel: Int]).
  
  
<hr>

<image src="https://user-images.githubusercontent.com/38868680/87586008-e31a1280-c6ad-11ea-9d29-f4cd335e2fc7.png" width=100 height=200> <image src="https://user-images.githubusercontent.com/38868680/87586013-e4e3d600-c6ad-11ea-986b-df590fe0fd79.png" width=100 height=200> <image src="https://user-images.githubusercontent.com/38868680/87586021-e90ff380-c6ad-11ea-9966-9e5993072c61.png" width=100 height=200> <image src="https://user-images.githubusercontent.com/38868680/87586034-ed3c1100-c6ad-11ea-916d-1720efdd3903.png" width=100 height=200> <image src="https://user-images.githubusercontent.com/38868680/87586039-ee6d3e00-c6ad-11ea-9315-eb5a5aa9d19e.png" width=100 height=200> <image src="https://user-images.githubusercontent.com/38868680/87586048-f0370180-c6ad-11ea-8a40-7b6bd2fdb961.png" width=100 height=200>
