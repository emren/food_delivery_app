About:
A Food delivery app. It has a shopping bag and a favorites list included.

Intro:
For this crossplatform app I am going to use the Flutter framework with Dart language.
I am choosing Flutter due to the higher native like performance over other crossplatform frameworks like React.
This performance edge comes from the fact that unlike React, Flutter compiles into native code.
React uses bridge to native code.
Also Flutter uses Skia Graphics Library which gives 60 frames per second therefore Flutter UI is very fast and smooth.

Flutter vs React:
The papers below linked find very close performances and no significant difference between Flutter and React.
https://www.theseus.fi/bitstream/handle/10024/146232/thesis.pdf?sequence=1
https://www.diva-portal.org/smash/get/diva2:1349917/FULLTEXT01.pdf
But authors point out that architecture wise, the Flutter engine’s C/C++ code is compiled
with Android’s NDK and LLVM on iOS respectively, and any Dart code is AOT-compiled
into native code during compilation. Thus giving a better structure than React as it uses bridge to native.
Since React is a more mature technology and Flutter is younger technology, we may see Flutter using more of its structural edge in the coming years.

Flutter vs Native:
According to this paper https://www.diva-portal.org/smash/get/diva2:1442804/FULLTEXT01.pdf Flutter has very small performance difference when compared to native.
Same study finds that sample app took less code to build with Flutter than native languages.
Appearancevise study finds very little difference to native looks at Flutter.
Also points out that Flutter is new and animations space doesn't match yet the native.
Conclusion part of the study is below which you can find also on page 37;

    Flutter is a useful toolkit that enables easy ways of creating new applications. It
    has gotten more and more popular recently and is talked about in the application
    development industry as a possible replacement of React Native and how it can
    be compared with native applications.
    The experiment of this report revealed that there is a small difference between
    the CPU performance of Flutter iOS and native Swift iOS respective Flutter
    android and flutter native. There seem to be a difference between the performance of iOS and android but when it comes to how well Flutter can perform
    in CPU usage compared to native applications, there is barely a difference. The
    summery for this is that Flutter can perform up to par with a native application for the type of application size that was tested. To verify these results
    and determine that Flutter can keep up with native, further testing needs to be
    carried out. There are multiple other metrics that are needed in order to fully
    display how Flutter compares to native applications in performance.
    When it came down to code size, the Flutter application had a low amount of
    code needed (125 lines) compared to iOS (363 lines) and android (217 lines).
    Flutter do not split its functionality code and visual code which lowers the
    amount of code and files. The Flutter code had similarities to web languages
    and often only required replicating to create new parts. The complexity of code
    that is needed for flutter, is simpler than the code that was needed for the native
    builds. This can however, not be fully concluded since additional methods of
    measuring code complexity has to be carried out for a better answer regarding
    the complexity and code size of all the code bases.
    Appearance wise, Flutter and native seem to differentiate little to a majority
    of users. It is able to mimic the native looks and behaviour to a certain point.
    The biggest difference showed to be around the behaviour and animations of
    the application where the difference was noticeable on items such as list, menu,
    default spacing and font. Animations are however something that can be added
    according their documentation[40] although it requires more of the developer
    and application as it is not something that is accompanied by the default in
    Flutter.
    To conclude the answers and ideas of Flutter, it is a tool with a promising
    feature if the community continue to grow in the direction that it is right now.
    The line to drawn when to choose Flutter over two separate native builds, can
    be chosen at the development of smaller to medium applications which are
    more flexible. Considering that Flutters strong side is being a cross-platform
    solution, Flutter still performs good on a single application base if compared to
    native applications. Flutter may not beat native for developing applications at
    this point but the results show good potential for the future although further
    studies needs to be done in these areas to conclude safer answers.


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

DB:
Regarding DB I am going to use shared preferences package.
https://pub.dev/packages/shared_preferences
Methods to load and save will be under FoodProvider to be able to notify listeners.

Size Configuration:
A Config file is under services folder. This will allow resize to different screensizes including tablets without losing design qualities.

Api:
I could not find any free food api so I wrote my own on Node Js using
https://www.npmjs.com/package/json-server Json Server package at npm.
The app currently is set to use the this server which can be found at my
github https://github.com/emren/fake-server-for-food_delivery-app

But if you want to use it without the server you can do it with the
embedded food.json file. To do that just uncomment the methods at FoodProvider.
Also you need to uncomment the foodProvider.initFoodList() method at the
Splashscreen. You should as well comment the service.takeData methods at
Splashscreen to avoid conflict.

Icons:
Icons are used from the following links
<a target="_blank" href="https://icons8.com/icons/set/pizza">Pizza icon</a> icon by <a target="_blank" href="https://icons8.com">Icons8</a>
<a target="_blank" href="https://icons8.com/icons/set/pizza">Pizza icon</a> icon by <a target="_blank" href="https://icons8.com">Icons8</a>
<a target="_blank" href="https://icons8.com/icons/set/salad-bowl">Salad Bowl icon</a> icon by <a target="_blank" href="https://icons8.com">Icons8</a>
<a target="_blank" href="https://icons8.com/icons/set/salad-bowl">Salad Bowl icon</a> icon by <a target="_blank" href="https://icons8.com">Icons8</a>
<a target="_blank" href="https://icons8.com/icons/set/bar">Bar icon</a> icon by <a target="_blank" href="https://icons8.com">Icons8</a>
<a target="_blank" href="https://icons8.com/icons/set/bar">Bar icon</a> icon by <a target="_blank" href="https://icons8.com">Icons8</a>
<a target="_blank" href="https://icons8.com/icons/set/add-to-favorites">Add to Favorites icon</a> icon by <a target="_blank" href="https://icons8.com">Icons8</a>
<a target="_blank" href="https://icons8.com/icons/set/add-to-favorites">Add to Favorites icon</a> icon by <a target="_blank" href="https://icons8.com">Icons8</a>
<a target="_blank" href="https://icons8.com/icons/set/shopping-bag">Shopping Bag icon</a> icon by <a target="_blank" href="https://icons8.com">Icons8</a>
<a target="_blank" href="https://icons8.com/icons/set/shopping-bag">Shopping Bag icon</a> icon by <a target="_blank" href="https://icons8.com">Icons8</a>