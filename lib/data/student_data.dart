class StudentData {
  final List<Map<String, dynamic>> courseData = [
    {
      'name': 'Introduction to Computer Science',
      'courseCode': 'CS 101',
      'grade': 'A-',
      'credits': 4,
      'gradePoints': [3.7, 3.0, 2.3, 2.0],
    },
    {
      'name': 'Calculus I',
      'courseCode': 'MATH 121',
      'grade': 'A',
      'credits': 4,
      'gradePoints': [4.0, 3.7, 3.0, 2.3, 2.0],
    },
    {
      'name': 'English Composition',
      'courseCode': 'ENG 101',
      'grade': 'A-',
      'credits': 3,
      'gradePoints': [3.7, 3.0, 2.3, 2.0],
    },

    {
      'name': 'Data Structures',
      'courseCode': 'CS 201',
      'grade': 'B+',
      'credits': 4,
      'gradePoints': [3.3, 3.0, 2.3, 2.0],
    },
    {
      'name': 'Discrete Mathematics',
      'courseCode': 'MATH 202',
      'grade': 'A-',
      'credits': 3,
      'gradePoints': [3.7, 3.0, 2.3, 2.0],
    },
    {
      'name': 'Physics I',
      'courseCode': 'PHYS 101',
      'grade': 'B+',
      'credits': 4,
      'gradePoints': [3.3, 3.0, 2.3, 2.0],
    },

    {
      'name': 'Algorithms',
      'courseCode': 'CS 301',
      'grade': 'B',
      'credits': 4,
      'gradePoints': [3.0, 2.3, 2.0],
    },
    {
      'name': 'Computer Organization',
      'courseCode': 'CS 210',
      'grade': 'B+',
      'credits': 3,
      'gradePoints': [3.3, 3.0, 2.3, 2.0],
    },
    {
      'name': 'Linear Algebra',
      'courseCode': 'MATH 221',
      'grade': 'A-',
      'credits': 3,
      'gradePoints': [3.7, 3.0, 2.3, 2.0],
    },

    {
      'name': 'Web Development',
      'courseCode': 'CS 250',
      'grade': 'A',
      'credits': 3,
      'gradePoints': [4.0, 3.7, 3.0, 2.3, 2.0],
    },
    {
      'name': 'Database Systems',
      'courseCode': 'CS 320',
      'grade': 'A-',
      'credits': 3,
      'gradePoints': [3.7, 3.0, 2.3, 2.0],
    },
  ];

  //exam data
  final Map<String, dynamic> examData = {
    'courseCode': 'CS 101',
    'courseName': 'Introduction to Computer Science',
    'examName': 'Midterm 1',
    'startsIn': '2 days',
    'duration': '2 hours',
    'numberOfQuestions': 20,
    'totalMarks': 100,
    'passingMarks': 60,
    'format': 'Multiple Choice',
    'date': '2024-01-15',
    'time': '10:00 AM',
    'location': 'Room 101',
    'status': 'Upcoming',
    'questions': [
      {
        'question':
            'What is the time complexity of binary search in the worst case?',
        'options': ['O(1)', 'O(log n)', 'O(n)', 'O(n²)'],
        'answer': 'O(log n)',
      },
      {
        'question':
            'Which data structure uses LIFO (Last In First Out) principle?',
        'options': ['Queue', 'Stack', 'Array', 'Linked List'],
        'answer': 'Stack',
      },
      {
        'question': 'What does HTML stand for?',
        'options': [
          'Hyper Text Markup Language',
          'High Tech Modern Language',
          'Hyperlink and Text Markup Language',
          'Home Tool Markup Language',
        ],
        'answer': 'Hyper Text Markup Language',
      },
      {
        'question': 'Which of the following is NOT a programming paradigm?',
        'options': [
          'Object-Oriented',
          'Functional',
          'Procedural',
          'Conditional',
        ],
        'answer': 'Conditional',
      },
      {
        'question':
            'What is the output of 7 % 3 in most programming languages?',
        'options': ['1', '2', '2.33', '3'],
        'answer': '1',
      },
      {
        'question':
            'Which sorting algorithm has the best average time complexity?',
        'options': [
          'Bubble Sort',
          'Quick Sort',
          'Insertion Sort',
          'Selection Sort',
        ],
        'answer': 'Quick Sort',
      },
      {
        'question':
            'What is the correct way to declare a constant in JavaScript?',
        'options': [
          'const x = 5;',
          'let x = 5;',
          'var x = 5;',
          'constant x = 5;',
        ],
        'answer': 'const x = 5;',
      },
      {
        'question': 'Which of these is NOT a valid variable name in Python?',
        'options': ['_variable', 'variable1', '1variable', 'variable_one'],
        'answer': '1variable',
      },
      {
        'question': 'What does CSS stand for?',
        'options': [
          'Computer Style Sheets',
          'Creative Style System',
          'Cascading Style Sheets',
          'Colorful Style Sheets',
        ],
        'answer': 'Cascading Style Sheets',
      },
      {
        'question': 'Which data type is used to store true/false values?',
        'options': ['Integer', 'String', 'Boolean', 'Character'],
        'answer': 'Boolean',
      },
      {
        'question':
            'What is the correct way to comment a single line in Python?',
        'options': [
          '// Comment',
          '# Comment',
          '/* Comment */',
          '<!-- Comment -->',
        ],
        'answer': '# Comment',
      },
      {
        'question': 'Which operator is used for exponentiation in Python?',
        'options': ['^', '**', '^^', '//'],
        'answer': '**',
      },
      {
        'question': 'What is the correct way to declare a list in Python?',
        'options': [
          'list = []',
          'list = list()',
          'list = {}',
          'Both A and B are correct',
        ],
        'answer': 'Both A and B are correct',
      },
      {
        'question':
            'Which of these is NOT a primitive data type in JavaScript?',
        'options': ['String', 'Number', 'Object', 'Boolean'],
        'answer': 'Object',
      },
      {
        'question':
            'What is the correct way to write an IF statement in JavaScript?',
        'options': [
          'if (x == 5) {}',
          'if x = 5 {}',
          'if x == 5 then {}',
          'if x = 5 then {}',
        ],
        'answer': 'if (x == 5) {}',
      },
      {
        'question':
            'Which symbol is used for single-line comments in JavaScript?',
        'options': ['//', '#', '--', '/*'],
        'answer': '//',
      },
      {
        'question': 'What does API stand for?',
        'options': [
          'Application Programming Interface',
          'Advanced Programming Interface',
          'Application Process Integration',
          'Automated Programming Interface',
        ],
        'answer': 'Application Programming Interface',
      },
      {
        'question':
            'Which of these is NOT a valid way to declare a function in JavaScript?',
        'options': [
          'function myFunc() {}',
          'let myFunc = function() {}',
          'let myFunc = () => {}',
          'function = myFunc() {}',
        ],
        'answer': 'function = myFunc() {}',
      },
      {
        'question':
            'What is the correct way to add an element to the end of an array in JavaScript?',
        'options': [
          'array.add(item)',
          'array.push(item)',
          'array[array.length] = item',
          'Both B and C are correct',
        ],
        'answer': 'Both B and C are correct',
      },
      {
        'question':
            'Which method removes the last element from an array and returns it?',
        'options': ['pop()', 'shift()', 'remove()', 'delete()'],
        'answer': 'pop()',
      },
    ],
  };
}
