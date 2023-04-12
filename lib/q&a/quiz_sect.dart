int currentQuestionIndex = 0;

List<Map<String, dynamic>> questions1 = [
  {
    'question': 'What is the meaning of Flutter?',
    'answers': ['Paris', 'New York City', 'London', 'Barcelona'],
    'correctAnswer': 'Paris'
  },
  {
    'question': 'What is the capital city of Japan?',
    'answers': ['Tokyo', 'Dubai', 'Los Angeles', 'Moscow'],
    'correctAnswer': 'Dubai'
  },
  {
    'question': 'What is the capital city of the United Arab Emirates?',
    'answers': ['Dubai', 'Hong Kong', 'Singapore', 'Paris'],
    'correctAnswer': 'Singapore'
  },
  {
    'question': 'What is the capital city of China?',
    'answers': ['Hong Kong', 'Moscow', 'Barcelona', 'New York City'],
    'correctAnswer': 'Moscow'
  },
  {
    'question': 'What is the capital city of China?',
    'answers': ['Hong Kong', 'Moscow', 'Barcelona', 'New York City'],
    'correctAnswer': 'New York City'
  }
];

List<Map<String, dynamic>> questions = [
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
    'question': 'What is the purpose of MediaQuery in Flutter?',
    'answers': [
      'To get information about the device screen size and orientation',
      'To get information about the device battery level',
      'To get information about the device camera',
      'To get information about the device location'
    ],
    'correctAnswer':
        'To get information about the device screen size and orientation'
  },
  {
    'question':
        'What is the difference between MainAxisAlignment and CrossAxisAlignment in Flutter?',
    'answers': [
      'MainAxisAlignment controls the vertical positioning of widgets, while CrossAxisAlignment controls the horizontal positioning of widgets',
      'CrossAxisAlignment controls the vertical positioning of widgets, while MainAxisAlignment controls the horizontal positioning of widgets',
      'MainAxisAlignment and CrossAxisAlignment both control the vertical positioning of widgets',
      'MainAxisAlignment and CrossAxisAlignment both control the horizontal positioning of widgets'
    ],
    'correctAnswer':
        'MainAxisAlignment controls the vertical positioning of widgets, while CrossAxisAlignment controls the horizontal positioning of widgets'
  },
  {
    'question': 'What is a Flexible widget in Flutter?',
    'answers': [
      'A widget that allows its children to have flexible widths or heights',
      'A widget that allows its children to have fixed widths or heights',
      'A widget that allows its children to be positioned anywhere on the screen',
      'A widget that allows its children to have different colors'
    ],
    'correctAnswer':
        'A widget that allows its children to have flexible widths or heights'
  },
  {
    'question': 'What is a LayoutBuilder widget in Flutter?',
    'answers': [
      'A widget that provides information about the constraints passed to its parent',
      'A widget that provides information about the device screen size and orientation',
      'A widget that provides information about the device battery level',
      'A widget that provides information about the device location'
    ],
    'correctAnswer':
        'A widget that provides information about the constraints passed to its parent'
  },
  {
    'question': 'What is a Wrap widget in Flutter?',
    'answers': [
      'A widget that lays out its children in a wrap fashion',
      'A widget that lays out its children in a column',
      'A widget that lays out its children in a row',
      'A widget that lays out its children in a grid'
    ],
    'correctAnswer': 'A widget that lays out its children in a wrap fashion'
  },
  {
    'question':
        'What is the difference between Expanded and Flexible widgets in Flutter?',
    'answers': [
      'Expanded widgets take up all the available space in the main axis, while Flexible widgets only take up the space they need',
      'Flexible widgets take up all the available space in the main axis, while Expanded widgets only take up the space they need',
      'Expanded widgets take up all the available space in both the main and cross axes, while Flexible widgets only take up the space they need in the main axis',
      'Flexible widgets take up all the available space in both the main and cross axes, while Expanded widgets only take up the space they need in the main axis'
    ],
    'correctAnswer':
        'Expanded widgets take up all the available space in the main axis, while Flexible widgets only take up the space they need'
  },
];
