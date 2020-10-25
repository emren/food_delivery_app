
Intro:
For this crossplatform app I am going to use the Flutter framework with Dart language.
I am choosing Flutter due to the higher native like performance over other crossplatform frameworks like React.
This performance edge comes from the fact that unlike React, Flutter compiles into native code.
React uses bridge to native code.
Also Flutter uses Skia Graphics Library which gives 60 frames per second therefore Flutter UI is very fast and smooth.

Project Structure:
I will be separating my code into folders depending their use cases.
Below are folder descriptions.

    models folder:
    This is where state management is happening.
    All the model files and notifiers will be put here.

    pages folder:
    This is where main UI pages will be put.

    services folder:
    Any tool or service related things go here.
    Backend services, size configurations, http etc.

    unused folder:
    Dead code

    widgets folder:
    Custom made widgets go here.
    These widgets will be used by files at the pages folder.

State Management:
For the state management I am going to use Provider package.
https://pub.dev/packages/provider

For this app there will be two models to hold state.
Basket and favorite states will be passed down the widget tree.
To do that I will use multiprovider at the main.dart file.

