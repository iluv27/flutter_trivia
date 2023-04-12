int currentQuestionIndex = 0;

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
  }
];
