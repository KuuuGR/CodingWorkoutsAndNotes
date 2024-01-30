
```Swift
let evenNumbers = (1...100).filter { $0 % 2 == 0 }
print(evenNumbers)
```

The provided code snippet in Swift performs the following actions:

1. **Creates a Range**: `(1...100)` creates a range of integers from 1 to 100, inclusive.
    
2. **Filters Even Numbers**: `.filter { $0 % 2 == 0 }` filters this range to include only those numbers for which the condition `$0 % 2 == 0` is true. `$0` refers to each element in the range during the filtering process. The condition checks if the number is divisible by 2 (i.e., an even number).
    
3. **Stores in `evenNumbers`**: The result of this filtering (which is an array of even numbers) is stored in the constant `evenNumbers`.
    
4. **Prints the Result**: `print(evenNumbers)` outputs the contents of `evenNumbers` to the console. This will be all even numbers between 1 and 100.

----

Write code that goes over the let numbers = [1, 5, 2, 5, 3, 5] array, counting the number of times it contains the number 5, then printing that total

```Swift
let numbers = [1, 5, 2, 5, 3, 5]
let countOfFives = numbers.filter { $0 == 5 }.count
print("The number 5 appears \(countOfFives) times.")
```

This code will output the count of how many times the number 5 appears in the `numbers` array.

----

Write code that doubles all the numbers in this array let number = [1, 3, 4, 5, 8]
```Swift
let numbers = [1, 3, 4, 5, 8]
let doubledNumbers = numbers.map { $0 * 2 }
print(doubledNumbers)
```

-----

Write code that creates an array containing all the people with the first name Terry.
let names = ["Terry Jones", "John Terry", "Terry Crews", "Terry Farrell", "Samuel Terry"]
```Swift
let names = ["Terry Jones", "John Terry", "Terry Crews", "Terry Farrell", "Samuel Terry"]
let terrys = names.filter { $0.hasPrefix("Terry") }
print(terrys)
```

This code uses `filter` to include only those names that start with "Terry". `hasPrefix` checks if the string starts with the specified substring.

----

Create a Player struct with a score integer property that has a property observer so that whenever the score has changed it prints "The score is now" followed by the new score value

```Swift
struct Player {
    var score: Int {
        didSet {
            print("The score is now \(score)")
        }
    }
}

// Example Usage
var player = Player(score: 0)
player.score = 10

```

In this code, whenever the `score` property of a `Player` instance changes, the `didSet` observer is triggered and it prints the new score.

