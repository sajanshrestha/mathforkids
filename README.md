# mathforkids

  An app for kids over 2 years old which helps them to learn counting, comparing, identifying colors, positions, classifying items and mathematical exercises like addition, subtraction, multiplication and division.
  
 <html>
 
 <hr>

<image src="https://user-images.githubusercontent.com/38868680/87585982-d5fd2380-c6ad-11ea-96b1-d4b3cf650468.png" width=100 height=200>
  
  Onboarding screen one: The user is asked to enter a user name, which will be persisted across different app launches. Since this is a simple (small size) string to be stored, I used UserDefaults. I simply extended UserDefaults class to include getUserName() and updateUserName(with:) methods.
(Concepts used: UserDefaults, Extension)

  <hr>
 
  
<image src="https://user-images.githubusercontent.com/38868680/87585984-d8f81400-c6ad-11ea-8e8b-d35484013237.png" width=100 height=200>
  
  There is not much to this screen. It simply displays greeting for the user and a welcome message. From here, the user can navigate to the game list with the tap of “Get Started” button.

Another thing, the onboarding screen only appears the first time of the app launch. After the user enters the username during the first visit of the app, there is no need to enter user name again . This condition is checked in SceneDelegate class. If UserDefaults.getUserName() returns nil, the onboarding screen appears. If it returns a username (String), you already have set the username. You are ready for the games!

  <hr>

<image src="https://user-images.githubusercontent.com/38868680/92332124-4b9bc500-f049-11ea-9402-6885a2a7d3ab.png" width=100 height=220>
  
  All the available games are displayed on this view. There is a trailing navigation item in this view which lets the user change username. For example, if the user mistypes username on the onboarding screen, it can be changed here. For each of the game rows, I have used animations. Some of them I created using SwiftUI and for some I used Lottie animations.
  
  <hr>

<image src="https://user-images.githubusercontent.com/38868680/92332126-4f2f4c00-f049-11ea-9992-55b09c6ac74a.png" width=100 height=200>
  
  This view will display available levels for each game. Initially, only first level (Level Ant) is unlocked. If the user scores 8 or more in any level, next level gets unlocked. To store levels for each game, I again used UserDefaults because all I need for this is to store a dictionary ([gameNames: String, currentLevel: Int]).
  
  
<hr>

<image src="https://user-images.githubusercontent.com/38868680/87884876-53db6a80-c9df-11ea-9dc0-9e4bad39a4d9.png" width=100 height=200> 
  The user gets 10 questions and each question has random number of items (the maximum number of items depends on the level). I have used CountingProblem struct to represent each problem in this game. The counting problem with all other problems in this app conforms to "Problem" protocol. "Problem" protocol has two requirements: (rightAnswer) and (options) properties.
  <hr>
  <image src="https://user-images.githubusercontent.com/38868680/87884879-56d65b00-c9df-11ea-9190-ebf8ad1ac100.png" width=100 height=200> 
    The comparing game has questions in which user has to choose which box has less or more items. The ComparingProblem is also a struct which conforms to "Problem" protocol.
    <hr>
    <image src="https://user-images.githubusercontent.com/38868680/92332221-1e9be200-f04a-11ea-84b1-c7f70aa2fcea.png" width=100 height=200>
      <hr>
    <image src="https://user-images.githubusercontent.com/38868680/87884884-5a69e200-c9df-11ea-86d5-efd8ab7df7ee.png" width=100 height=200>
      <hr>
      <image src="https://user-images.githubusercontent.com/38868680/87884886-5d64d280-c9df-11ea-8bbf-b3fa855d78c7.png" width=100 height=200>
        <hr>
        <image src="https://user-images.githubusercontent.com/38868680/87884887-5fc72c80-c9df-11ea-8e63-b68e41196535.png" width=100 height=200> 
          <hr>
          <img src="https://user-images.githubusercontent.com/38868680/87884889-62298680-c9df-11ea-9887-fa55038a34d3.png" width=100 height=200>
          <hr>
          <img src="https://user-images.githubusercontent.com/38868680/87884891-6655a400-c9df-11ea-9c23-d5e4ac046186.png" width=100 height=200> 
          <hr>
          <hr>
      <image src="https://user-images.githubusercontent.com/38868680/99437387-665ba700-28e0-11eb-9e55-06daf03f729c.png" width=100 height=200>
        <hr>
      <image src="https://user-images.githubusercontent.com/38868680/99437396-68be0100-28e0-11eb-8248-0d7343c44578.png" width=100 height=200>
      
  </html>
  
  
