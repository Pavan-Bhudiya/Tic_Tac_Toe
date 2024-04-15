import 'dart:io';

// Define constants for players
const String playerX = 'X';
const String playerO = 'O';

// Define the game board
List<List<String>> board = [
  ['', '', ''],
  ['', '', ''],
  ['', '', '']
];

// Current player
String currentPlayer = playerX;

// Function to display the game board
void displayBoard() {
  for (var row in board) {
    print(row.join(' | '));
    print('---------');
  }
}

// Function to check if the game is over
bool isGameOver() {
  // Check rows
  for (var row in board) {
    if (row.every((cell) => cell == playerX) || row.every((cell) => cell == playerO)) {
      return true;
    }
  }
  // Check columns
  for (var i = 0; i < 3; i++) {
    if (board[0][i] == board[1][i] && board[1][i] == board[2][i] && board[0][i] != '') {
      return true;
    }
  }
  // Check diagonals
  if ((board[0][0] == board[1][1] && board[1][1] == board[2][2] && board[0][0] != '') ||
      (board[0][2] == board[1][1] && board[1][1] == board[2][0] && board[0][2] != '')) {
    return true;
  }
  // Check for a tie
  if (board.every((row) => row.every((cell) => cell != ''))) {
    print('It\'s a tie!');
    return true;
  }
  return false;
}

// Function to handle player's move
void makeMove(int row, int col) {
  if (board[row][col] == '') {
    board[row][col] = currentPlayer;
    currentPlayer = currentPlayer == playerX ? playerO : playerX;
  } else {
    print('Cell already occupied. Try again.');
  }
}

// Main function to start the game
void main() {
  print('Welcome to Tic Tac Toe!');
  displayBoard();

  while (!isGameOver()) {
    print('Player $currentPlayer\'s turn');
    stdout.write('Enter row (0-2): ');
    int row = int.parse(stdin.readLineSync()!);
    stdout.write('Enter column (0-2): ');
    int col = int.parse(stdin.readLineSync()!);
    
    if (row < 0 || row > 2 || col < 0 || col > 2) {
      print('Invalid input. Row and column must be between 0 and 2.');
      continue;
    }

    makeMove(row, col);
    displayBoard();
  }
}
