import 'package:flutter/material.dart';

int currentQuestionIndex = 0;

List<String> correctAnswers = [
  'Paris',
  'Tokyo',
  'Dubai',
  'Hong Kong',
  'Moscow'
];

List<Map<String, dynamic>> questions = [
  {
    'question': 'What is the meaning of Flutter?',
    'answers': ['Paris', 'New York City', 'London', 'Barcelona']
  },
  {
    'question': 'What is the capital city of Japan?',
    'answers': ['Tokyo', 'Dubai', 'Los Angeles', 'Moscow']
  },
  {
    'question': 'What is the capital city of the United Arab Emirates?',
    'answers': ['Dubai', 'Hong Kong', 'Singapore', 'Paris']
  },
  {
    'question': 'What is the capital city of China?',
    'answers': ['Hong Kong', 'Moscow', 'Barcelona', 'New York City']
  },
  {
    'question': 'What is the capital city of China?',
    'answers': ['Hong Kong', 'Moscow', 'Barcelona', 'New York City']
  }
];
