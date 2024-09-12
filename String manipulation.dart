import 'dart:io';

// String Manipulation: Concatenation, Interpolation, Substring, Case conversion, Reverse, and Length
String manipulateString(String input) {
  // Concatenation (For demonstration)
  String concatenated = input + ' Dart is awesome!';

  // Interpolation
  String interpolated = "Original input: $input";

  // Substring extraction
  String substring = input.length >= 5 ? input.substring(0, 5) : input;

  // Case conversion
  String upper = input.toUpperCase();
  String lower = input.toLowerCase();

  // Reversing string
  String reversed = input.split('').reversed.join('');

  // String length
  int length = input.length;

  // Return a summary of the manipulations
  return '''
Concatenated: $concatenated
Interpolated: $interpolated
Substring: $substring
Uppercase: $upper
Lowercase: $lower
Reversed: $reversed
Length: $length
  ''';
}

// Collections (List, Set, Map) Demonstration
void collectionsDemo() {
  // List demonstration
  List<String> items = ['Apple', 'Banana', 'Mango'];
  items.add('Orange');
  print("Fruits List: $items");

  // Set demonstration (ensuring no duplicates)
  Set<int> numbers = {1, 2, 3, 3};
  print("Numbers Set (no duplicates): $numbers");

  // Map demonstration (key-value pairs)
  Map<String, String> capitals = {'US': 'Washington', 'IN': 'New Delhi', 'JP': 'Tokyo'};
  print("Countries and Capitals Map: $capitals");
}

// File Handling: Read and write files with error handling
void fileHandlingDemo(String content) async {
  try {
    // Writing to a file
    await File('output.txt').writeAsString(content, mode: FileMode.append);
    print("Content saved to output.txt");

    // Reading from a file
    String fileContent = await File('output.txt').readAsString();
    print("File content: \n$fileContent");
  } catch (e) {
    print('Error during file operations: $e');
  }
}

// Date and Time Manipulation
String logDateTime() {
  DateTime now = DateTime.now();
  String formattedDate = "${now.day}-${now.month}-${now.year} ${now.hour}:${now.minute}:${now.second}";
  return formattedDate;
}

// Small application combining all the utilities
void smallApplication() async {
  List<String> manipulatedResults = []; // Store manipulated string results
  bool continueInput = true;

  while (continueInput) {
    print("Enter a string to manipulate (or 'exit' to quit):");
    String? input = stdin.readLineSync();

    if (input != null && input.toLowerCase() == 'exit') {
      continueInput = false;
    } else if (input != null) {
      // Perform string manipulation
      String manipulatedString = manipulateString(input);
      String timestamp = logDateTime();

      // Store the result in a list
      String entry = "Manipulated Result at $timestamp:\n$manipulatedString";
      manipulatedResults.add(entry);
      print(entry);

      // Save the data to a file
      await fileHandlingDemo(entry + "\n");
    }
  }

  print("\nProgram Ended. Final List of Manipulated Results:");
  for (var entry in manipulatedResults) {
    print(entry);
  }

  // Run collections demo
  print("\nCollections Demo:");
  collectionsDemo();
}

void main() {
  // Running the combined small application
  smallApplication();
}
