int currentQuestionIndex = 0;

//Screen own
List<Map<String, dynamic>> questions = [
  {
    'question': 'What is Flutter?',
    'answers': [
      'A mobile app development framework',
      'A social media platform',
      'A new programming language',
      'A video game'
    ],
    'correctAnswer': 'A mobile app development framework'
  },
  {
    'question':
        'What is the name of the Flutter widget used for building responsive layouts?',
    'answers': ['GridView', 'ListView', 'Wrap', 'Row'],
    'correctAnswer': 'Wrap'
  },
  {
    'question':
        'What is the name of the package used for building responsive layouts in Flutter?',
    'answers': [
      'responsive_layout',
      'flutter_responsive',
      'flutter_layout',
      'flutter_screenutil'
    ],
    'correctAnswer': 'flutter_screenutil'
  },
  {
    'question':
        'Which widget can be used to specify a percentage-based width in Flutter?',
    'answers': ['Expanded', 'Flexible', 'SizedBox', 'AspectRatio'],
    'correctAnswer': 'Expanded'
  },
  {
    'question':
        'What is the name of the Flutter widget used for building responsive dialogs?',
    'answers': [
      'AlertDialog',
      'SimpleDialog',
      'CustomDialog',
      'ResponsiveDialog'
    ],
    'correctAnswer': 'AlertDialog'
  },
  {
    'question':
        'Which package can be used for building adaptive layouts in Flutter?',
    'answers': [
      'flutter_adaptive',
      'adaptive_layout',
      'flutter_adaptive_layout',
      'flutter_layout_builder'
    ],
    'correctAnswer': 'flutter_adaptive_layout'
  },
  {
    'question':
        'What is the most common screen size used for mobile devices in Flutter development?',
    'answers': ['360x640', '1080x1920', '1440x2960', '750x1334'],
    'CorrectAnswer': '360x640'
  },
  {
    'question': 'What is the purpose of the Spacer widget in Flutter?',
    'answers': [
      'To add padding to a widget',
      'To create a flexible space between widgets',
      'To add margin to a widget',
      'None of the above'
    ],
    'correctAnswer': 'To create a flexible space between widgets'
  },
  {
    'question': 'What is a MediaQuery in Flutter?',
    'answers': ['A widget', 'A class', 'A package', 'A plugin'],
    'correctAnswer': 'A class'
  },
  {
    'question': 'What is the purpose of a Flexible widget in Flutter?',
    'answers': [
      'To make a widget draggable',
      'To change the size of a widget based on available space',
      'To add a margin to a widget',
      'To add padding to a widget'
    ],
    'correctAnswer': 'To change the size of a widget based on available space'
  },
  {
    'question': 'What is the purpose of a SafeArea widget in Flutter?',
    'answers': [
      'To add padding to a widget',
      'To make a widget scrollable',
      'To ensure a widget is not hidden behind system UI elements',
      'To create a responsive layout'
    ],
    'correctAnswer':
        'To ensure a widget is not hidden behind system UI elements'
  },
  {
    'question': 'What is the purpose of a LayoutBuilder widget in Flutter?',
    'answers': [
      'To create a responsive layout',
      'To add a margin to a widget',
      'To make a widget draggable',
      'To change the size of a widget based on available space'
    ],
    'correctAnswer': 'To create a responsive layout'
  },
  {
    'question': 'What is a responsive design in Flutter?',
    'answers': [
      'A design that adjusts to fit any screen size',
      'A design that looks good on a specific screen size',
      'A design that only works on iOS devices',
      'A design that only works on Android devices'
    ],
    'correctAnswer': 'A design that adjusts to fit any screen size'
  },
  {
    'question': 'What is the purpose of a Expanded widget in Flutter?',
    'answers': [
      'To add padding to a widget',
      'To make a widget draggable',
      'To change the size of a widget based on available space',
      'To create a responsive layout'
    ],
    'correctAnswer': 'To change the size of a widget based on available space'
  },
  {
    'question':
        'What is the purpose of a SingleChildScrollView widget in Flutter?',
    'answers': [
      'To make a widget scrollable',
      'To add padding to a widget',
      'To create a responsive layout',
      'To change the size of a widget based on available space'
    ],
    'correctAnswer': 'To make a widget scrollable'
  },
  {
    'question':
        'What is the purpose of a MediaQuery.of(context).size in Flutter?',
    'answers': [
      'To get the size of the device screen',
      'To get the size of a widget',
      'To create a responsive layout',
      'To make a widget scrollable'
    ],
    'correctAnswer': 'To get the size of the device screen'
  },
  {
    'question': 'What is the purpose of a IntrinsicWidth widget in Flutter?',
    'answers': [
      'To make a widget draggable',
      'To change the size of a widget based on available space',
      'To ensure a widget has a minimum width',
      'To add padding to a widget'
    ],
    'correctAnswer': 'To ensure a widget has a minimum width'
  },
  {
    'question': 'What is the purpose of a SizedBox widget in Flutter?',
    'answers': [
      'To create a fixed size box',
      'To make a widget draggable',
      'To change the size of a widget based on available space',
      'To ensure a widget has a minimum width'
    ],
    'correctAnswer': 'To create a fixed size box'
  },
  {
    'question':
        'What is the purpose of a FractionallySizedBox widget in Flutter?',
    'answers': [
      'To make a widget draggable',
      'To create a fixed size box',
      'To ensure a widget has a minimum width',
      'To change the size of a widget based on available space'
    ],
    'correctAnswer': 'To change the size of a widget'
  },
  {
    'question': 'What is the purpose of the TextEditingController in Flutter?',
    'answers': [
      'To manage the text input of a TextField widget',
      'To create custom text editors in Flutter',
      'To access the text of a Text widget',
      'To create and manage animations in Flutter'
    ],
    'correctAnswer': 'To manage the text input of a TextField widget'
  },
];

List<Map<String, dynamic>> questionsAPI = [
  {
    'question': 'What is the purpose of the Navigator class in Flutter?',
    'answers': [
      'To manage a stack of pages or routes',
      'To manage the state of widgets',
      'To manage network requests',
      'To manage device sensors'
    ],
    'correctAnswer': 'To manage a stack of pages or routes'
  },
  {
    'question': 'What is an API in Flutter?',
    'answers': [
      'A set of protocols and tools for building user interfaces',
      'A platform for creating mobile apps',
      'A set of tools for managing database connections',
      'A set of functions and protocols for interacting with external services'
    ],
    'correctAnswer':
        'A set of functions and protocols for interacting with external services'
  },
  {
    'question': 'What is the purpose of the http package in Flutter?',
    'answers': [
      'To create animations and graphics',
      'To manage user interface elements',
      'To manage device sensors',
      'To make HTTP requests and handle responses'
    ],
    'correctAnswer': 'To make HTTP requests and handle responses'
  },
  {
    'question':
        'What is the purpose of the shared_preferences package in Flutter?',
    'answers': [
      'To manage user authentication and authorization',
      'To store and retrieve small amounts of data',
      'To create animations and graphics',
      'To manage device sensors'
    ],
    'correctAnswer': 'To store and retrieve small amounts of data'
  },
  {
    'question': 'What is the purpose of the geolocator package in Flutter?',
    'answers': [
      'To manage user authentication and authorization',
      'To create animations and graphics',
      'To make HTTP requests and handle responses',
      'To get the current location of the device'
    ],
    'correctAnswer': 'To get the current location of the device'
  },
  {
    'question': 'What is the purpose of the geocoding package in Flutter?',
    'answers': [
      'To create animations and graphics',
      'To manage device sensors',
      'To convert a geographic coordinate to an address and vice versa',
      'To make HTTP requests and handle responses'
    ],
    'correctAnswer':
        'To convert a geographic coordinate to an address and vice versa'
  },
  {
    'question': 'What is the purpose of the flutter_map package in Flutter?',
    'answers': [
      'To create animations and graphics',
      'To manage device sensors',
      'To render maps and handle user interaction with them',
      'To make HTTP requests and handle responses'
    ],
    'correctAnswer': 'To render maps and handle user interaction with them'
  },
  {
    'question':
        'What is the purpose of the web_socket_channel package in Flutter?',
    'answers': [
      'To manage device sensors',
      'To make HTTP requests and handle responses',
      'To create animations and graphics',
      'To handle WebSocket communication'
    ],
    'correctAnswer': 'To handle WebSocket communication'
  },
  {
    'question': 'What is the purpose of the url_launcher package in Flutter?',
    'answers': [
      'To make HTTP requests and handle responses',
      'To manage device sensors',
      'To create animations and graphics',
      'To launch URLs in the platform\'s default browser or app'
    ],
    'correctAnswer': 'To launch URLs in the platform\'s default browser or app'
  },
  {
    'question': 'What is the purpose of the FutureBuilder widget in Flutter?',
    'answers': [
      'To build a widget based on a Future that is resolved asynchronously',
      'To build a widget that returns a Future when it is tapped',
      'To build a widget that has a loading spinner until its data is available',
      'To build a widget that is displayed for a certain duration and then disappears'
    ],
    'correctAnswer':
        'To build a widget based on a Future that is resolved asynchronously'
  },
  {
    'question': 'What is the purpose of the Image.asset() method in Flutter?',
    'answers': [
      'To load an image from the application\'s asset bundle',
      'To load an image from the internet',
      'To create a new image asset in Flutter',
      'To manipulate an existing image asset in Flutter'
    ],
    'correctAnswer': 'To load an image from the application\'s asset bundle'
  },
  {
    'question':
        'What is the purpose of the Navigator.push() method in Flutter?',
    'answers': [
      'To push a new route onto the navigator stack',
      'To pop the current route from the navigator stack',
      'To replace the current route on the navigator stack with a new one',
      'To go back to the previous route in the navigator stack'
    ],
    'correctAnswer': 'To push a new route onto the navigator stack'
  },
  {
    'question': 'What is the purpose of the DateTime class in Flutter?',
    'answers': [
      'To represent a point in time',
      'To format dates and times in Flutter',
      'To perform calculations with dates and times in Flutter',
      'To represent time intervals in Flutter'
    ],
    'correctAnswer': 'To represent a point in time'
  },
  {
    'question': 'What is the purpose of the http package in Flutter?',
    'answers': [
      'To make HTTP requests to a server',
      'To manage local storage in a Flutter application',
      'To create and manage animations in Flutter',
      'To build and manage user interfaces in Flutter'
    ],
    'correctAnswer': 'To make HTTP requests to a server'
  },
];

List<Map<String, dynamic>> questionsSTATEManagemnt = [
  {
    'question': 'What is state in Flutter?',
    'answers': [
      'Data that changes over time',
      'A type of widget',
      'A function that builds widgets',
      'A way to style widgets'
    ],
    'correctAnswer': 'Data that changes over time'
  },
  {
    'question':
        'What is the difference between StatefulWidget and StatelessWidget in Flutter?',
    'answers': [
      'StatefulWidget can hold mutable state, while StatelessWidget cannot',
      'StatelessWidget can hold mutable state, while StatefulWidget cannot',
      'StatelessWidget is a type of StatefulWidget',
      'StatefulWidget is a type of StatelessWidget'
    ],
    'correctAnswer':
        'StatefulWidget can hold mutable state, while StatelessWidget cannot'
  },
  {
    'question': 'What is setState() in Flutter?',
    'answers': [
      'A function that updates the state of a widget',
      'A function that creates a new widget',
      'A function that destroys a widget',
      'A function that builds a widget'
    ],
    'correctAnswer': 'A function that updates the state of a widget'
  },
  {
    'question': 'What is an InheritedWidget in Flutter?',
    'answers': [
      'A widget that passes data down the widget tree',
      'A widget that creates a new widget',
      'A widget that updates the state of a widget',
      'A widget that destroys a widget'
    ],
    'correctAnswer': 'A widget that passes data down the widget tree'
  },
  {
    'question': 'What is Provider in Flutter?',
    'answers': [
      'A package for state management',
      'A type of widget',
      'A function that builds widgets',
      'A way to style widgets'
    ],
    'correctAnswer': 'A package for state management'
  },
  {
    'question':
        'What is the difference between ValueNotifier and ChangeNotifier in Flutter?',
    'answers': [
      'ValueNotifier only notifies listeners when its value changes, while ChangeNotifier can notify listeners when any of its fields change',
      'ChangeNotifier only notifies listeners when its value changes, while ValueNotifier can notify listeners when any of its fields change',
      'ValueNotifier and ChangeNotifier are the same thing',
      'ValueNotifier can hold multiple values, while ChangeNotifier can only hold one'
    ],
    'correctAnswer':
        'ValueNotifier only notifies listeners when its value changes, while ChangeNotifier can notify listeners when any of its fields change'
  },
  {
    'question': 'What is BLoC in Flutter?',
    'answers': [
      'A pattern for state management',
      'A type of widget',
      'A function that builds widgets',
      'A way to style widgets'
    ],
    'correctAnswer': 'A pattern for state management'
  },
  {
    'question': 'What is Redux in Flutter?',
    'answers': [
      'A package for state management',
      'A type of widget',
      'A function that builds widgets',
      'A way to style widgets'
    ],
    'correctAnswer': 'A package for state management'
  },
  {
    'question': 'What is a Stream in Flutter?',
    'answers': [
      'A sequence of asynchronous events',
      'A type of widget',
      'A function that builds widgets',
      'A way to style widgets'
    ],
    'correctAnswer': 'A sequence of asynchronous events'
  },
  {
    'question': 'What is a StreamBuilder in Flutter?',
    'answers': [
      'A widget that rebuilds itself when it receives new data from a stream',
      'A widget that builds itself based on a predefined layout',
      'A widget that displays a list of items in a scrollable view',
      'A widget that displays a modal dialog box'
    ],
    'correctAnswer':
        'A widget that rebuilds itself when it receives new data from a stream'
  },
  {
    'question': 'What is an InheritedWidget in Flutter?',
    'answers': [
      'A widget that passes data down the widget tree to its descendants',
      'A widget that displays a list of items in a scrollable view',
      'A widget that displays a modal dialog box',
      'A widget that animates its children'
    ],
    'correctAnswer':
        'A widget that passes data down the widget tree to its descendants'
  },
  {
    'question': 'What is the purpose of ValueNotifier in Flutter?',
    'answers': [
      'To hold a single value and notify its listeners when its value changes',
      'To manage the state of an entire application',
      'To display a list of items in a scrollable view',
      'To display a modal dialog box'
    ],
    'correctAnswer':
        'To hold a single value and notify its listeners when its value changes'
  },
  {
    'question': 'What is a ChangeNotifier in Flutter?',
    'answers': [
      'A class that extends ValueNotifier and provides methods to change its value',
      'A widget that displays a list of items in a scrollable view',
      'A widget that displays a modal dialog box',
      'A class that holds a single value and notifies its listeners when its value changes'
    ],
    'correctAnswer':
        'A class that extends ValueNotifier and provides methods to change its value'
  },
  {
    'question':
        'What is the difference between InheritedWidget and Provider in Flutter?',
    'answers': [
      'InheritedWidget is a low-level API, while Provider is a high-level API built on top of it',
      'InheritedWidget and Provider both provide the same functionality',
      'InheritedWidget is used for state management, while Provider is used for navigation',
      'InheritedWidget is used for navigation, while Provider is used for state management'
    ],
    'correctAnswer':
        'InheritedWidget is a low-level API, while Provider is a high-level API built on top of it'
  },
  {
    'question': 'What is the purpose of the StreamController in Flutter?',
    'answers': [
      'To create a stream and add data to it manually',
      'To manage the state of an entire application',
      'To display a list of items in a scrollable view',
      'To display a modal dialog box'
    ],
    'correctAnswer': 'To create a stream and add data to it manually'
  },
  {
    'question': 'What is a BLoC in Flutter?',
    'answers': [
      'A design pattern used for state management',
      'A widget that can be used to create streams of data',
      'A way to define custom events in Flutter',
      'A tool for debugging widgets'
    ],
    'correctAnswer': 'A design pattern used for state management'
  },
  {
    'question': 'What is Provider in Flutter?',
    'answers': [
      'A third-party package used for state management',
      'A widget that can be used to create streams of data',
      'A way to define custom events in Flutter',
      'A tool for debugging widgets'
    ],
    'correctAnswer': 'A third-party package used for state management'
  }
];

List<Map<String, dynamic>> questionsWidget = [
  {
    'question': 'What is the purpose of the Scaffold widget in Flutter?',
    'answers': [
      'To create a basic visual structure for a Flutter app.',
      'To handle routing and navigation within a Flutter app.',
      'To manage state for a Flutter app.',
      'To handle network requests in a Flutter app.',
    ],
    'correctAnswer': 'To create a basic visual structure for a Flutter app.'
  },
  {
    'question': 'What is the purpose of the MaterialApp widget in Flutter?',
    'answers': [
      'To create a basic visual structure for a Flutter app.',
      'To handle routing and navigation within a Flutter app.',
      'To manage state for a Flutter app.',
      'To handle network requests in a Flutter app.',
    ],
    'correctAnswer': 'To handle routing and navigation within a Flutter app.'
  },
  {
    'question': 'What is the purpose of the ListView widget in Flutter?',
    'answers': [
      'To display a list of items in a scrollable view.',
      'To manage state for a Flutter app.',
      'To handle network requests in a Flutter app.',
      'To create a basic visual structure for a Flutter app.',
    ],
    'correctAnswer': 'To display a list of items in a scrollable view.'
  },
  {
    'question': 'What is the purpose of the Text widget in Flutter?',
    'answers': [
      'To display static text on the screen.',
      'To display dynamic text on the screen.',
      'To manage state for a Flutter app.',
      'To handle network requests in a Flutter app.',
    ],
    'correctAnswer': 'To display static text on the screen.'
  },
  {
    'question': 'What is the purpose of the InkWell widget in Flutter?',
    'answers': [
      'To handle user taps on a widget.',
      'To display a list of items in a scrollable view.',
      'To create a basic visual structure for a Flutter app.',
      'To manage state for a Flutter app.',
    ],
    'correctAnswer': 'To handle user taps on a widget.'
  },
  {
    'question': 'What is the purpose of the SizedBox widget?',
    'answers': [
      'Adding fixed space between widgets',
      'Creating boxes with custom sizes',
      'Defining widget constraints',
      'Laying out widgets in a grid'
    ],
    'correctAnswer': 'Adding fixed space between widgets'
  },
  {
    'question': 'What is the purpose of the Expanded widget?',
    'answers': [
      'Expanding widgets to fill available space',
      'Creating flexible layouts',
      'Adding padding around widgets',
      'Centering widgets within a container'
    ],
    'correctAnswer': 'Expanding widgets to fill available space'
  },
  {
    'question': 'What is the purpose of the ListView widget?',
    'answers': [
      'Displaying a scrollable list of widgets',
      'Creating a grid of widgets',
      'Laying out widgets in a row',
      'Adding padding around widgets'
    ],
    'correctAnswer': 'Displaying a scrollable list of widgets'
  },
  {
    'question': 'What is the purpose of the GestureDetector widget?',
    'answers': [
      'Detecting user gestures on a widget',
      'Displaying an image',
      'Creating a grid of widgets',
      'Adding padding around widgets'
    ],
    'correctAnswer': 'Detecting user gestures on a widget'
  },
  {
    'question': 'What is the purpose of the Positioned widget?',
    'answers': [
      'Positioning a widget within a Stack',
      'Creating a flexible layout',
      'Displaying a scrollable list of widgets',
      'Adding padding around widgets'
    ],
    'correctAnswer': 'Positioning a widget within a Stack'
  },
  {
    'question': 'What is the purpose of the Hero widget?',
    'answers': [
      'Animating transitions between screens',
      'Creating a grid of widgets',
      'Laying out widgets in a row',
      'Adding padding around widgets'
    ],
    'correctAnswer': 'Animating transitions between screens'
  },
  {
    'question': 'What is the purpose of the TextField widget?',
    'answers': [
      'Accepting user input',
      'Displaying text',
      'Creating a grid of widgets',
      'Laying out widgets in a row'
    ],
    'correctAnswer': 'Accepting user input'
  },
  {
    'question': 'What is the purpose of the SafeArea widget?',
    'answers': [
      'Ensuring widgets are not obscured by device insets',
      'Creating a grid of widgets',
      'Laying out widgets in a row',
      'Adding padding around widgets'
    ],
    'correctAnswer': 'Ensuring widgets are not obscured by device insets'
  },
  {
    'question': 'What is the purpose of the FloatingActionButton widget?',
    'answers': [
      'Creating a button for common actions',
      'Displaying a scrollable list of widgets',
      'Laying out widgets in a row',
      'Adding padding around widgets'
    ],
    'correctAnswer': 'Creating a button for common actions'
  },
  {
    'question': 'What is the purpose of the Card widget?',
    'answers': [
      'Creating a styled container for content',
      'Creating a grid of widgets',
      'Laying out widgets in a row',
      'Adding padding around widgets'
    ],
    'correctAnswer': 'Creating a styled container for content'
  },
  {
    'question': 'What is the purpose of the PositionedDirectional widget?',
    'answers': [
      'Positioning a widget within a Stack in a specific direction',
      'Creating a flexible layout',
      'Displaying a scrollable list of widgets',
      'Adding padding around widgets'
    ],
    'correctAnswer':
        'Positioning a widget within a Stack in a specific direction'
  },
];

List<Map<String, dynamic>> questionsFlutterLayout = [
  {
    'question': 'What is the purpose of a Spacer widget in Flutter?',
    'answers': [
      'To create empty space between widgets',
      'To adjust the size of a widget',
      'To add a border around a widget',
      'To create a responsive layout'
    ],
    'correctAnswer': 'To create empty space between widgets'
  },
  {
    'question': 'What is the main axis in a Row or Column layout in Flutter?',
    'answers': [
      'The direction in which the widgets are laid out',
      'The direction perpendicular to the widgets',
      'The direction of the device screen',
      'The direction of the device camera'
    ],
    'correctAnswer': 'The direction in which the widgets are laid out'
  },
  {
    'question': 'What is the purpose of a SizedBox widget in Flutter?',
    'answers': [
      'To create a box with a specific size',
      'To add padding around a widget',
      'To create a border around a widget',
      'To create a responsive layout'
    ],
    'correctAnswer': 'To create a box with a specific size'
  },
  {
    'question': 'What is the purpose of the SafeArea widget in Flutter?',
    'answers': [
      'To ensure that content is not obscured by device-specific features',
      'To create a border around a widget',
      'To add padding around a widget',
      'To create a responsive layout'
    ],
    'correctAnswer':
        'To ensure that content is not obscured by device-specific features'
  },
  {
    'question':
        'What is the purpose of the crossAxisAlignment property in a Row or Column layout in Flutter?',
    'answers': [
      'To control the horizontal alignment of the widgets',
      'To control the vertical alignment of the widgets',
      'To control the size of the widgets',
      'To control the color of the widgets'
    ],
    'correctAnswer': 'To control the horizontal alignment of the widgets'
  },
  {
    'question':
        'What is the purpose of the mainAxisAlignment property in a Row or Column layout in Flutter?',
    'answers': [
      'To control the vertical alignment of the widgets',
      'To control the horizontal alignment of the widgets',
      'To control the size of the widgets',
      'To control the color of the widgets'
    ],
    'correctAnswer': 'To control the vertical alignment of the widgets'
  },
  {
    'question': 'What is the purpose of an Expanded widget in Flutter?',
    'answers': [
      'To expand a widget to fill the available space',
      'To shrink a widget to fit its content',
      'To create a border around a widget',
      'To create a responsive layout'
    ],
    'correctAnswer': 'To expand a widget to fill the available space'
  },
  {
    'question': 'What is the purpose of a Flexible widget in Flutter?',
    'answers': [
      'To make a widget flexible and allow it to take up only the space it needs',
      'To make a widget fixed and prevent it from resizing',
      'To create a border around a widget',
      'To create a responsive layout'
    ],
    'correctAnswer':
        'To make a widget flexible and allow it to take up only the space it needs'
  },
  {
    'question': 'What is the purpose of a Wrap widget in Flutter?',
    'answers': [
      'To wrap its children to the next line when they exceed the width of the container',
      'Allows widgets to be wrapped and displayed in multiple lines, like a flow layout',
      'To wrap its children to the next column when they exceed the height of the container',
      'To wrap its children to the next screen when they exceed the width of the container'
    ],
    'correctAnswer':
        'Allows widgets to be wrapped and displayed in multiple lines, like a flow layout'
  },
  {
    'question':
        'What is the difference between mainAxisAlignment and crossAxisAlignment in Flutter?',
    'answers': [
      'mainAxisAlignment controls the vertical positioning of widgets, while crossAxisAlignment controls the horizontal positioning of widgets',
      'crossAxisAlignment controls the vertical positioning of widgets, while mainAxisAlignment controls the horizontal positioning of widgets',
      'mainAxisAlignment and crossAxisAlignment both control the vertical positioning of widgets',
      'mainAxisAlignment and crossAxisAlignment both control the horizontal positioning of widgets'
    ],
    'correctAnswer':
        'mainAxisAlignment controls the vertical positioning of widgets, while crossAxisAlignment controls the horizontal positioning of widgets'
  },
  {
    'question': 'What is the purpose of a SizedBox widget in Flutter?',
    'answers': [
      'To add a fixed width and height gap between widgets',
      'To make the widgets stretch and fill the available space',
      'To display a list of items in a grid-like fashion',
      'To position a widget relative to its parent'
    ],
    'correctAnswer': 'To add a fixed width and height gap between widgets'
  },
  {
    'question': 'What is a Spacer widget in Flutter?',
    'answers': [
      'A widget that takes up remaining space in a Row or Column',
      'A widget that positions its children relative to its parent',
      'A widget that applies padding to its children',
      'A widget that displays a list of items'
    ],
    'correctAnswer': 'A widget that takes up remaining space in a Row or Column'
  },
  {
    'question': 'What is the purpose of the Expanded widget in Flutter?',
    'answers': [
      'To expand a child widget to fill the available space in the main axis',
      'To add padding around a widget',
      'To display a list of items in a grid-like fashion',
      'To position a widget relative to its parent'
    ],
    'correctAnswer':
        'To expand a child widget to fill the available space in the main axis'
  },
  {
    'question': 'What is the purpose of the Flexible widget in Flutter?',
    'answers': [
      'To allow a child widget to have flexible width or height within a Row or Column',
      'To add padding around a widget',
      'To position a widget relative to its parent',
      'To display a list of items in a grid-like fashion'
    ],
    'correctAnswer':
        'To allow a child widget to have flexible width or height within a Row or Column'
  },
  {
    'question': 'What is the purpose of the LayoutBuilder widget in Flutter?',
    'answers': [
      'To provide information about the constraints passed to its parent widget',
      'To position a widget relative to its parent',
      'To display a list of items in a grid-like fashion',
      'To create a responsive layout'
    ],
    'correctAnswer':
        'To provide information about the constraints passed to its parent widget'
  },
  {
    'question': 'What is the purpose of the MediaQuery widget in Flutter?',
    'answers': [
      'To retrieve information about the device size and orientation',
      'To add padding around a widget',
      'To position a widget relative to its parent',
      'To retrieve information about the device battery level'
    ],
    'correctAnswer':
        'To retrieve information about the device size and orientation',
  }
];
