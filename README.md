About:
A Food delivery app. It has a shopping bag and a favorites list included.

Intro:
For this crossplatform app I am going to use the Flutter framework with Dart language.
I am choosing Flutter due to the higher native like performance over other crossplatform frameworks like React.
This performance edge comes from the fact that unlike React, Flutter compiles into native code.
React uses bridge to native code.
Also Flutter uses Skia Graphics Library which gives 60 frames per second therefore Flutter UI is very fast and smooth.
Both React and Flutter have hotreload ability which increases productivity.


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

A potential drawback for Flutter against Native is Flutter as a tool is very new,
thus there may be need to native implementation at some point. Although pub dev,
https://pub.dev/ the package site is growing every day, and new packages coming,
still there may be a point where Flutter widgets or packages does not meet client
requirement and native calls has to be implemented.


Dart vs Native:
As a former Java developer I find the syntax of Dart and Java very similar.
But Dart is a more modern language and is less verbose than Java. Hotreload
is a time saver when compared to compiling.

Design:
As a freelancer I am used to work with designers and receive xd files to implement it
pixel by pixel. In this project I was provided none so I tried to make the design
as minimalistic as I can and focused more on clean code.
The App has a splashscreen and then lands to the main page where a bottomnavigationbar
gives the user to choose different food categories as well as favorite and basket screen access.
Additionally the drawer lists all categories and routes to the according category.
Category screens list food cards with pictures and with minimal detail.
On users press to the cards a detail screen will open with a transition animation where the user
can add the food to his basket or add it to his favorites list. The way to add to the
favorites list is to press the star sign at the top right of the detail screen.
At the detail screen a separate order form is provided with a modalbottomsheet and user is asked
to choose order quantity. Depending the quantity the price will change.
Basketscreen has clear basket option and shows the total basket value. User can delete items
in basket by swiping any side. This will pop up a confirm dialog.
Favoritesscreen as well has clear favorites option.

This Apps design is adaptive to different screensizes including tablets.
To achieve adaption without losing any design qualities I implemented
a SizeConfig file which can be found under services folder. Any width and height
is implemented with the original designs multiplier. Therefore if screen gets bigger,
widgets, text, images get bigger too.

Api:
I could not find any free food api so I wrote my own on Node Js using
https://www.npmjs.com/package/json-server Json Server package at npm.
The app currently is set to use the this server which can be found at my
github https://github.com/emren/fake-server-for-food_delivery-app
Just type npm run server to start the server on Localhost.

But if you want to use it without the server you can do it with the
embedded json/food.json file. To do that just uncomment the methods at FoodProvider.
Also you need to uncomment the foodProvider.initFoodList() method at the
Splashscreen. You should as well comment the service.takeData methods at
Splashscreen to avoid conflict.


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

    widgets folder:
    Custom made widgets go here.
    These widgets will be used by files at the pages folder.

Packages Used:

    Provider
    For state management

    After_init
    After init adds didinit method which comes after init and before widget build just once.
    Here context can be passed therefore it is best used with Provider to init states.

    Google_fonts
    App uses fonts from this library

    Shared_preferences
    To save and read data to the phone cache

    Http
    To make http calls to api

    Equatable
    To make object comparison at the hash level.
    Favorites objects that are loaded from prefs needed to be compared to newly created objects.

    Wave_drawer
    A customizable drawer package

State Management:
For the state management I am going to use Provider package.
https://pub.dev/packages/provider

For this app there will be two models to hold state.
BasketItemModel and FoodModel states will be passed down the widget tree with their providers.
I will use multiprovider of the Provider package at the main.dart file.

DB:
Regarding DB I am going to use shared preferences package.
https://pub.dev/packages/shared_preferences
Methods to load and save will be under FoodProvider to be able to notify listeners.

What could be improved:
This is an open end question when it comes to coding but I feel the following
can be the most important areas to improve for this app:
1) Design:
A good design is what sells an app and this app can use more design ideas.
2) Backend:
Current backend is serving a json with url links to images. If had time I could try
to write a node js server which serves images instead of urls thus making the app
downloading the images at the splahscreen and holding those at state.
This would solve the picture loading waiting phase at categories pages and it would
improve user experience.
3) Animations:
Additional animations can be implemented
4) IOS style:
This app is build on Materialapp. To give it a more ios feeling Cupertinoapp can be implemented
where necessary and depending the device where the app is running, app can show either material or cupertino widgets.

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