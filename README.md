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

<image src="https://user-images.githubusercontent.com/38868680/87884831-08c15780-c9df-11ea-8ed9-6d815d28fef8.png" width=100 height=220>
  
  All the available games are displayed on this view. There is a trailing navigation item in this view which lets the user change username. For example, if the user mistypes username on the onboarding screen, it can be changed here. For each of the game rows, I have used animations. Some of them I created using SwiftUI and for some I used Lottie animations.
  
  <hr>

<image src="https://user-images.githubusercontent.com/38868680/87585999-deedf500-c6ad-11ea-9feb-e5d16a9adcee.png" width=100 height=200>
  
  This view will display available levels for each game. Initially, only level one is unlocked. If the user scores 8 or more in any level, next level gets unlocked. To store levels for each game, I again used UserDefaults because all I need for this is to store a dictionary ([gameNames: String, currentLevel: Int]).
  
  
<hr>

<image src="https://user-images.githubusercontent.com/38868680/87884876-53db6a80-c9df-11ea-9dc0-9e4bad39a4d9.png" width=100 height=200> 
  <hr>
  <image src="https://user-images.githubusercontent.com/38868680/87884879-56d65b00-c9df-11ea-9190-ebf8ad1ac100.png" width=100 height=200> 
    <hr>
    <image src="https://user-images.githubusercontent.com/38868680/87884884-5a69e200-c9df-11ea-86d5-efd8ab7df7ee.png" width=100 height=200>
      <hr>
      <image src="https://user-images.githubusercontent.com/38868680/87884886-5d64d280-c9df-11ea-8bbf-b3fa855d78c7.png" width=100 height=200>
        <hr>
        <image src="https://user-images.githubusercontent.com/38868680/87884887-5fc72c80-c9df-11ea-8e63-b68e41196535.png" width=100 height=200> 
          <hr>
          <img alt="Screen Shot 2020-07-16 at 1 03 30 PM" src="https://user-images.githubusercontent.com/38868680/87884889-62298680-c9df-11ea-9887-fa55038a34d3.png" width=100 height=200>
          <hr>
          <img alt="Screen Shot 2020-07-16 at 1 02 50 PM" src="https://user-images.githubusercontent.com/38868680/87884891-6655a400-c9df-11ea-9c23-d5e4ac046186.png" width=100 height=200> 
          <hr>
  
  
 
  
  
  
