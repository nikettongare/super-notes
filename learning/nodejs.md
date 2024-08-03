## Globals

- console
- proccess
- global
  - setting global variable `global.myGlobalVar = 'This is a global variable';`
  - global variable stored in global object
  - stored in heap memory
- Buffer
- setInterval, clearInterval
- setTimeout, clearTimeout
- require
- module

## Event loop - Non-blocking

- JavaScript's asynchronous nature, facilitating non-blocking I/O operations and concurrency within the language. It's fundamental to how JavaScript handles asynchronous tasks.
- JavaScript is single-threaded, meaning it can only execute one operation at a time. However, it can perform asynchronous operations without blocking other code execution. These asynchronous tasks include timers (setTimeout, setInterval), I/O operations (fetch, reading files), and callbacks (promises, async/await).
  - Call Stack: JavaScript maintains a call stack to keep track of function calls and their execution contexts (where the code is).
  - Event Loop: The event loop continuously checks the call stack and the microtask queue. When the call stack is empty, it first picks tasks from the microtask queue, if there are any. If the microtask queue is empty, it then picks tasks from the event queue and pushes them onto the call stack for execution.
  - Task/Event Queue: Also known as the event queue. This is where tasks like I/O operations, timers (setTimeout, setInterval), and event handlers (e.g., click events) are queued. Tasks in this queue are generally large or long-running. (Callbacks)
  - Microtask Queue: This queue is used for tasks that need to be executed as soon as possible after the currently executing script and before any other tasks from the task queue. Examples include promise callbacks (.then(), .catch(), .finally()) and certain types of MutationObserver callbacks. Microtasks are typically smaller and quicker than tasks in the task queue.
- https://www.youtube.com/watch?v=eiC58R16hb8&ab_channel=LydiaHallie

- Synchronous Code: Executes sequentially, line by line, without waiting for external operations to complete.

- Asynchronous Code: When an asynchronous task is encountered, JavaScript offloads it to the browser (in the case of the browser) or Node.js runtime (in the case of Node.js). When the task is completed, it's placed in the event queue.

```

  NodeJS - Javascript Runtime Enverment

  V8 Engine -

  LibUV - work with cores to exicute the processess from the event queue

```

## Event Driven
- Event-driven programming is a paradigm where the flow of the program is determined by events, such as user interactions, messages from other programs, or I/O operations. In an event-driven system, functions called event handlers respond to these events.

## Garbage Collection

- Making the memory free is the process of Garbage Collection.
- There is a routine who does it, called Garbage Collector (Automatic Memory Management).

```
const a = 10; // memory allocate

a = null; // reference to location is removed

// GC will relese memory because reference removed

```

## Primitives and Non Primitives

- Primitives 
    - They are immutable, meaning their values cannot be changed once created. 
    - Primitive values are compared by their value, not by reference.

    - Types
        - Null
        - Undefined
        - Boolean
        - Number
            - Values outside the representable range are automatically converted:
                - Positive values greater than Number.MAX_VALUE are converted to +Infinity.
                - Positive values smaller than Number.MIN_VALUE are converted to +0.
                - Negative values smaller than -Number.MAX_VALUE are converted to -Infinity.
                - Negative values greater than -Number.MIN_VALUE are converted to -0.
        - BigInt
            - Number which is above the Number.MAX_VALUE range
            - denoted as `const x = 9007199254740991n` n at the end.
        - String 
            - String pool in libUV 
        - Symbol
            - `const sym = Symbol('description');`
            - each symbol is unique

- Non-primitive

  - Non-primitive types (or complex types) are more complex data structures that can hold collections of values or more complex entities.
  - They are mutable and are compared by their reference, not by their value.

  - Types
    - Object
    - Array
    - Function


## truthy & falsy values.
- ''(Empty string),0, NaN, undefined, null & false are falsy values everything else are true.

## Scopes

- Global Scope
  - Variables declared outside of any function or block are in the global scope.
- Function Scope
  - Variables declared within a function are in the function scope.
- Block Scope

  - Variables declared inside a block (e.g., within {} braces such as in loops, conditionals, or functions) are in block scope.

- Lexical Scope (Script Scope)
  - Nested functions have access to variables declared in their outer scope.
- Module Scope
  - Introduced with ES6 modules, each module has its own scope.
  - Variables, functions, and classes declared in a module are not accessible outside of that module unless explicitly exported.

## Variables
    - var (Hoisted)
    - let  (Hoisted but in Temprory Dead Zone until they Declared) (Referrence Error)
    - const (Hoisted but in Temprory Dead Zone until they Declared) (Referrence Error)
        - constant value only assign once.

## Hoisting
- Hoisting is a JavaScript mechanism where variables and function declarations are moved to the top of their containing scope during the compilation phase. This means you can use variables and functions before they are actually declared in the code.

### Variable Hoisting

#### Declarations
- Only the declarations are hoisted, not the initializations. This means that if you declare a variable using `var`, the variable is created at the top of its scope, but its value is not assigned until the code execution reaches the line where it is initialized.

#### Initialization
- The initialization remains in its original position. If you try to use the variable before its initialization, its value will be undefined.
```
console.log(x); // undefined
var x = 5;
console.log(x); // 5
```
Here, `var x` is hoisted to the top, so the code is effectively interpreted as:
```
var x;
console.log(x); // undefined
x = 5;
console.log(x); // 5
```
### Function Hoisting

#### Declarations
- Entire function declarations are hoisted, meaning you can call a function before its declaration appears in the code.
```
greet(); // "Hello"
function greet() {
  console.log("Hello");
}
```
### `let` and `const` Hoisting:

#### Temporal Dead Zone (TDZ)
- Variables declared with let and const are also hoisted, but they are not initialized until their declaration is encountered. Until then, they are in a "temporal dead zone" and trying to access them will result in a ReferenceError.
```
console.log(a); // ReferenceError: Cannot access 'a' before initialization
let a = 10;
```
Here, let a is hoisted, but accessing a before the declaration throws an error due to the TDZ.

## Clousers
- A closure is a function that retains access to its lexical scope even after the function has finished executing. This means that the inner function can access variables declared in the outer function even after the outer function has returned.
- When a function is defined, it creates a lexical environment, which includes its scope and the variables it has access to. When an inner function is returned from an outer function, it retains a reference to this lexical environment, allowing it to access the outer function’s variables.

### Key Concepts

#### Lexical Scope:
- Lexical scope refers to the scope in which a function is defined. Inner functions have access to variables and parameters of their outer functions due to lexical scoping.
#### Access to Outer Variables:
- Closures allow inner functions to access variables from their outer functions even after the outer functions have finished executing.

### Basic Closure
```
function outer() {
  let outerVariable = 'I am from outer';
  function inner() {
    console.log(outerVariable); // Accesses outerVariable
  }
  return inner;
}

const closureFunction = outer();
closureFunction(); // 'I am from outer'
```
- Here, inner is a closure that retains access to outerVariable even after outer has finished executing.

### Encapsulation
- Closures are often used to encapsulate and protect variables.
```
function createCounter() {
  let count = 0;
  return {
    increment: function() {
      count++;
      return count;
    },
    decrement: function() {
      count--;
      return count;
    },
    getCount: function() {
      return count;
    }
  };
}

const counter = createCounter();
console.log(counter.increment()); // 1
console.log(counter.increment()); // 2
console.log(counter.getCount()); // 2
console.log(counter.decrement()); // 1
```
- In this example, `count` is encapsulated within the `createCounter` function and is manipulated only through the methods provided, protecting it from being modified directly.

### Private Variables:
- Closures can be used to create private variables.
```
function Person(name) {
  let _name = name; // Private variable
  return {
    getName: function() {
      return _name;
    },
    setName: function(newName) {
      _name = newName;
    }
  };
}

const person = Person('Alice');
console.log(person.getName()); // Alice
person.setName('Bob');
console.log(person.getName()); // Bob
```
- `_name` is private and can only be accessed or modified via the `getName` and `setName` methods.

### Function Factories
- Closures are useful for creating functions with configurable behavior.
```
function multiplier(factor) {
  return function(number) {
    return number * factor;
  };
}

const double = multiplier(2);
console.log(double(5)); // 10

const triple = multiplier(3);
console.log(triple(5)); // 15
```
- The `multiplier` function creates closures that remember the `factor` and use it in the returned function.

### Benefits of Closures
- Encapsulation: Closures help in hiding and protecting the internal state and logic of a function.
- Data Privacy: Closures enable private data that can be accessed only through specific methods.
- Function Factories: They allow the creation of functions with pre-configured behavior, making code more modular and reusable.

## Operators

### Arithmetic Operators
- Used to perform basic mathematical operations.

#### Addition (+):
```
let sum = 5 + 3; // 8
```

#### Subtraction (-):
```
let difference = 5 - 3; // 2
```

#### Multiplication (*):
```
let product = 5 * 3; // 15
```

#### Division (/):
```
let quotient = 15 / 3; // 5
```

#### Modulus (%):
```
let remainder = 15 % 4; // 3
```

#### Exponentiation (**) (ECMAScript 2016):
```
let power = 2 ** 3; // 8
```

#### Unary Plus (+):
- Converts its operand to a number.
```
let num = + '42'; // 42
```

#### Unary Negation (-):
- Negates its operand.
```
let neg = -5; // -5
```

### Assignment Operators
- Used to assign values to variables.

#### Assignment (=):
```
let x = 10;
```
#### Addition Assignment (+=):
```
let x = 10;
x += 5; // 15
```
#### Subtraction Assignment (-=):
```
let x = 10;
x -= 5; // 5
```

#### Multiplication Assignment (*=):
```
let x = 10;
x *= 5; // 50
```

#### Division Assignment (/=):
```
let x = 10;
x /= 5; // 2
```

#### Modulus Assignment (%=):
```
let x = 10;
x %= 3; // 1
```

#### Exponentiation Assignment (**=):
```
let x = 2;
x **= 3; // 8
```

### Comparison Operators
- Used to compare values and return a boolean result.

#### Equal to (==):
```
5 == '5'; // true (coerced equality)
```

#### Strict Equal to (===):
```
5 === '5'; // false (no coercion)
```

#### Not Equal to (!=):
```
5 != '5'; // false (coerced inequality)
```
#### Strict Not Equal to (!==):
```
5 !== '5'; // true (no coercion)
```
#### Greater Than (>):
```
5 > 3; // true
```
#### Less Than (<):
```
5 < 3; // false
```
#### Greater Than or Equal To (>=):
```
5 >= 5; // true
```
#### Less Than or Equal To (<=):
```
5 <= 3; // false
```

### Logical Operators
- Used to perform logical operations.

#### Logical AND (&&):
```
true && false; // false
```

#### Logical OR (||):
```
true || false; // true
```

#### Logical NOT (!):
```
!true; // false
```

#### Logical AND with Short-Circuit Evaluation:
```
let a = true && (5 > 3); // true
```
#### Logical OR with Short-Circuit Evaluation:
```
let b = false || (5 > 3); // true
```

### Bitwise Operators
- Operate on the binary representations of numbers.

#### AND (&):
```
5 & 3; // 1
```
#### OR (|):
```
5 | 3; // 7
```
#### XOR (^):
```
5 ^ 3; // 6
```
#### Complement (~):
```
~5; // -6
```
#### Left Shift (<<):
```
5 << 1; // 10
```
#### Right Shift (>>):
```
5 >> 1; // 2
```
#### Unsigned Right Shift (>>>):
```
-5 >>> 1; // 2147483642
```

### Conditional (Ternary) Operator
- A shorthand for the if-else statement.
```
condition ? expressionIfTrue : expressionIfFalse;
```
```
let age = 18;
let canDrink = age >= 21 ? 'Yes' : 'No'; // 'No'
```

### Type Operators
- Used to determine the type of a value or object.

#### Typeof (typeof):
```
typeof 42; // 'number'
typeof 'hello'; // 'string'
```

#### Instanceof (instanceof):
```
let arr = [];
arr instanceof Array; // true
```

### Unary Operators
- Operators that operate on a single operand.

#### Increment (++):
```
let x = 5;
x++; // 6
```
#### Decrement (--):
```
let x = 5;
x--; // 4
```
#### Unary Plus (+):
```
let x = '5';
+x; // 5 (number)
```
#### Unary Negation (-):
```
let x = 5;
-x; // -5
```

### Spread and Rest Operators
- Used to handle iterable collections and function parameters.

#### Spread (...):
- Used to spread elements of an array or object.
```
let arr1 = [1, 2, 3];
let arr2 = [...arr1, 4, 5]; // [1, 2, 3, 4, 5]
```
#### Rest (...):
- Used to collect multiple elements into an array or to handle function parameters.
```
function sum(...numbers) {
  return numbers.reduce((acc, num) => acc + num, 0);
}
sum(1, 2, 3); // 6
```

### Destructuring Assignment
- Used to extract values from arrays or properties from objects into distinct variables.

#### Array Destructuring:
```
let [a, b] = [1, 2];
```
#### Object Destructuring:
```
let { x, y } = { x: 1, y: 2 };
```



## Type Conversions
- Type conversions in JavaScript involve converting one data type to another. 
- There are two types of type conversions: implicit (automatic) and explicit (manual).

### Implicit Type Conversion (Type Coercion)
- JavaScript automatically converts data types during certain operations, a process known as type coercion.
#### String and Number:
```
let result = '5' + 2; // '52' (number 2 is converted to string)
let result = '5' - 2; // 3 (string '5' is converted to number)
let result = '5' * '2'; // 10 (both strings are converted to numbers)
let result = '5' / '2'; // 2.5 (both strings are converted to numbers)
```
#### Boolean Conversion:
- In conditional statements, non-boolean values are coerced to booleans.
```
if (1) { console.log('True'); } // 'True' (1 is truthy)
if (0) { console.log('False'); } // (0 is falsy)
```

### Explicit Type Conversion
- Explicit type conversion, or type casting, is when you manually convert a value from one type to another using functions or operators.

#### String Conversion:
- Using `String()`, `.toString()`, or concatenation with an empty string `''`.

```
let num = 123;
let str = String(num); // '123'
let str = num.toString(); // '123'
let str = num + ''; // '123'
```

#### Number Conversion:
- Using `Number()`, `parseInt()`, `parseFloat()`, or the unary plus `+` operator.
```
let str = '123';
let num = Number(str); // 123
let num = parseInt(str); // 123
let num = parseFloat(str); // 123
let num = +str; // 123
```

#### Boolean Conversion:
- Using `Boolean()`, double NOT operator `!!`, or conditional expressions.
```
let str = 'hello';
let bool = Boolean(str); // true
let bool = !!str; // true
let bool = str ? true : false; // true
```

### Type Conversion in Specific Situations

#### Conversions in Arithmetic Operations:
- When performing arithmetic operations, JavaScript tries to convert operands to numbers.
```
let result = '5' - 3; // 2
let result = '5' * '2'; // 10
let result = '5' / '2'; // 2.5
let result = '5' + 2; // '52' (concatenation, not arithmetic)
```

#### Conversions in Comparisons:
- When using `==` (loose equality), JavaScript performs type coercion.
- Using `===` (strict equality) avoids type coercion.
```
let isEqual = 5 == '5'; // true (loose equality with coercion)
let isEqual = 5 === '5'; // false (strict equality without coercion)
```

### Special Cases in Type Conversion

#### Falsy and Truthy Values:
- Falsy values include false, 0, -0, 0n, '', null, undefined, and NaN.
- All other values are truthy.
```
Boolean(0); // false
Boolean(''); // false
Boolean(null); // false
Boolean(1); // true
Boolean('hello'); // true
```

#### null and undefined:
- Converting null and undefined to other types.
```
Number(null); // 0
Number(undefined); // NaN
String(null); // 'null'
String(undefined); // 'undefined'
Boolean(null); // false
Boolean(undefined); // false
```

#### NaN (Not-a-Number):
- NaN is the result of invalid or undefined numerical operations.
```
Number('hello'); // NaN
parseInt('abc'); // NaN
let x = NaN;
x === NaN; // false (NaN is not equal to itself)
isNaN(x); // true
```


## Functions
- Arrow Functions
    - Arrow functions provide a shorter syntax for writing function expressions and come with some important differences from traditional functions, especially regarding the handling of the this keyword.
### No arguments Object:
```
const showArgs = (...args) => {
  console.log(args);
};
showArgs(1, 2, 3); // [1, 2, 3]
```

### Cannot be Used as Constructors:
```
const Foo = () => {};
const foo = new Foo(); // TypeError: Foo is not a constructor
```






## Error Handling

### `try...catch` Statement
- The try...catch statement consists of a try block, which contains the code that may throw an exception, and one or more catch blocks to handle the exception.
```
try {
  // Code that may throw an exception
} catch (error) {
  // Code to handle the exception
} finally {
  // Optional block that will always execute
}
```

#### try Block:
- Contains code that might throw an error.
- If an error occurs within the try block, the subsequent code in the block is skipped and control is transferred to the catch block.
#### catch Block:
- Contains code to handle the error.
- The catch block takes a single parameter, typically named error, which is an object that contains information about the error.
- The catch block is executed only if an error occurs in the try block.
#### finally Block (Optional):
- Contains code that will always execute after the try and catch blocks, regardless of whether an error occurred or not.
- Useful for cleaning up resources, like closing files or network connections.

### Throwing Custom Errors
- You can throw your own errors using the throw statement, which allows you to create more meaningful error messages.
```
throw new Error('Something went wrong');
```

### Creating Custom Error Classes
- You can create custom error classes by extending the built-in `Error` class, providing more specific error handling.
```
class ValidationError extends Error {
  constructor(message) {
    super(message);
    this.name = 'ValidationError';
  }
}

function validateAge(age) {
  if (age < 0 || age > 150) {
    throw new ValidationError('Invalid age provided');
  }
  return true;
}

try {
  validateAge(-5);
} catch (error) {
  if (error instanceof ValidationError) {
    console.error('Validation Error:', error.message);
  } else {
    console.error('Unknown Error:', error.message);
  }
}
```


## Strict mode
- Strict mode in JavaScript is a way to opt into a restricted variant of JavaScript, which can help you write more secure and error-free code. It was introduced in ECMAScript 5 (ES5) and is applied by adding the string "use strict"; at the beginning of a script or function.
### Whole Script
- To enable strict mode for the entire script, place "use strict"; at the top of your JavaScript file.
```
"use strict";

x = 3.14; // This will cause an error because x is not declared
```
### Individual Function
- To enable strict mode for a specific function, place "use strict"; at the beginning of the function body.
```
function myFunction() {
  "use strict";
  y = 3.14; // This will cause an error because y is not declared
}
```
### Features and Changes in Strict Mode

#### Elimination of Silent Errors:
- Some JavaScript silent errors will throw errors in strict mode, making it easier to debug.

#### Disallows Undeclared Variables:
- Variables must be declared using var, let, or const.
```
"use strict";
x = 3.14; // Error: x is not defined
```
#### Prevents Accidental Globals:
- Assigning a value to an undeclared variable will result in an error.
```
"use strict";
function myFunction() {
  y = 3.14; // Error: y is not defined
}
myFunction();
```
#### Disallows this Keyword in Global Context:
- In strict mode, this in the global context is undefined, not the global object.
```
"use strict";
console.log(this); // undefined
```
#### Throws Error on Assignment to Non-Writable Properties:
- Attempts to write to read-only properties will throw an error.
```
"use strict";
const obj = {};
Object.defineProperty(obj, "x", { value: 42, writable: false });
obj.x = 9; // Error: Cannot assign to read only property 'x'
```

#### Disallows Duplicate Parameter Names:
- Functions cannot have duplicate parameter names.
```
"use strict";
function sum(a, a, c) { // Error: Duplicate parameter name not allowed in this context
  return a + a + c;
}
```
#### Disallows Octal Syntax:
- Octal literals (e.g., 075) are not allowed.
```
"use strict";
const num = 075; // Error: Octal literals are not allowed in strict mode
```
#### Disallows with Statement:
- The with statement is not allowed in strict mode.
```
"use strict";
with (Math) { // Error: Strict mode code may not include a with statement
  x = cos(2);
}
```
#### Secures eval:
- eval in strict mode does not introduce new variables into the surrounding scope.
```
"use strict";
eval("var x = 2;");
console.log(x); // Error: x is not defined
```
#### Prevents delete on Plain Names:
- Deleting variables, functions, or arguments is not allowed.
```
"use strict";
let x = 2;
delete x; // Error: Delete of an unqualified identifier in strict mode
```

## setTimeout and setIntervel

### setTimeout
- The `setTimeout` method allows you to execute a function once after a specified delay in milliseconds.
```
let timeoutID = setTimeout(function, delay, [arguments]);
```
- `function`: The function to be executed after the delay.
- `delay`: The time in milliseconds to wait before executing the function.
- `arguments` (optional): Additional arguments to pass to the function when it is executed.
```
function greet() {
  console.log('Hello, World!');
}

setTimeout(greet, 2000); // Logs 'Hello, World!' after 2 seconds
```
#### Clearing a Timeout:
- You can cancel a timeout before it executes using `clearTimeout`.
```
let timeoutID = setTimeout(greet, 2000);
clearTimeout(timeoutID); // Cancels the timeout
```

### setInterval
- The `setInterval` method allows you to execute a function repeatedly at specified intervals in milliseconds.
```
let intervalID = setInterval(function, interval, [arguments]);
```
- `function`: The function to be executed repeatedly.
- `interval`: The time in milliseconds between each execution of the function.
- `arguments` (optional): Additional arguments to pass to the function when it is executed.
```
function greet() {
  console.log('Hello, World!');
}

setInterval(greet, 2000); // Logs 'Hello, World!' every 2 seconds
```
#### Clearing an Interval:
- You can stop the repeated execution using clearInterval.
```
let intervalID = setInterval(greet, 2000);
clearInterval(intervalID); // Stops the interval
```


## Class
- A class in JavaScript is defined using the `class` keyword followed by the class name. The class body is enclosed in curly braces `{}` and contains a constructor and methods.
```
class ClassName {
  constructor(parameter1, parameter2) {
    // Initialization code
  }

  method1() {
    // Method code
  }

  method2() {
    // Method code
  }
}

```
```
class Person {
  constructor(name, age) {
    this.name = name;
    this.age = age;
  }

  greet() {
    console.log(`Hello, my name is ${this.name} and I am ${this.age} years old.`);
  }
}

const person1 = new Person('Alice', 30);
person1.greet(); // Hello, my name is Alice and I am 30 years old.
```
### Class Components
- Constructor:
    - The constructor method is a special method for creating and initializing an object created with a class.
    - A class can have only one constructor method.
- Methods:
    - Functions defined inside a class are called methods.
    - Methods are defined without the function keyword.
- Instance Properties:
    - Properties specific to an instance are defined inside the constructor using this.
- Static Methods and Properties:
    - Static methods and properties are defined on the class itself and not on the instances.
    - They are called on the class, not on an instance of the class.
```
class Calculator {
  static add(a, b) {
    return a + b;
  }
}

console.log(Calculator.add(2, 3)); // 5
```

### Inheritance
- Classes can extend other classes, allowing for inheritance of properties and methods.
```
class Animal {
  constructor(name) {
    this.name = name;
  }

  speak() {
    console.log(`${this.name} makes a noise.`);
  }
}

class Dog extends Animal {
  constructor(name, breed) {
    super(name); // Call the parent constructor
    this.breed = breed;
  }

  speak() {
    console.log(`${this.name} barks.`);
  }
}

const dog = new Dog('Rex', 'Labrador');
dog.speak(); // Rex barks.
```

### Getters and Setters
- Getters and setters allow you to define object accessors (computed properties).
```
class Rectangle {
  constructor(width, height) {
    this._width = width;
    this._height = height;
  }

  get area() {
    return this._width * this._height;
  }

  set width(newWidth) {
    this._width = newWidth;
  }

  set height(newHeight) {
    this._height = newHeight;
  }
}

const rect = new Rectangle(10, 20);
console.log(rect.area); // 200
rect.width = 15;
console.log(rect.area); // 300

```

### Private Fields
- Private fields are declared with a `#` prefix and are not accessible outside the class.
```
class BankAccount {
  #balance;

  constructor(initialBalance) {
    this.#balance = initialBalance;
  }

  deposit(amount) {
    this.#balance += amount;
  }

  getBalance() {
    return this.#balance;
  }
}

const account = new BankAccount(1000);
account.deposit(500);
console.log(account.getBalance()); // 1500
console.log(account.#balance); // SyntaxError: Private field '#balance' must be declared in an enclosing class
```



## `this` keyword

### Global Context:
- In the global execution context (outside of any function), `this` refers to the global object. In browsers, the `global` object is window.
```
console.log(this); // Window object (in a browser)
```
### Function Context:
- Inside a regular function, `this` refers to the global object (in non-strict mode) or `undefined` (in strict mode).
```
function showThis() {
  console.log(this);
}
showThis(); // Window object (in non-strict mode), undefined (in strict mode)
```
### Method Context:
- When a function is called as a method of an object, `this` refers to the object that the method is called on.
```
const person = {
  name: 'Alice',
  greet: function() {
    console.log(this.name);
  }
};
person.greet(); // 'Alice'
```
### Constructor Context:
- When a function is used as a constructor with the `new` keyword, `this` refers to the new object being created.
```
function Person(name) {
  this.name = name;
}
const person1 = new Person('Alice');
console.log(person1.name); // 'Alice'
```
### Arrow Functions:
- Arrow functions do not have their own `this` context. Instead, `this` is lexically inherited from the enclosing scope at the time the arrow function is defined.
```
const person = {
  name: 'Alice',
  greet: () => {
    console.log(this.name);
  }
};
person.greet(); // undefined (this is inherited from the global scope)

```
### Event Listeners:
- In event handlers, `this` refers to the element that received the event.
```
const button = document.querySelector('button');
button.addEventListener('click', function() {
  console.log(this); // The button element
});
```

## Callbacks
- Function pass as a parameter to unother function.
- A callback function is typically executed at the end of an asynchronous operation to signal that the operation is complete and to allow further processing.
### Basic Callback
```
function greet(name, callback) {
  console.log('Hello ' + name);
  callback();
}

function sayGoodbye() {
  console.log('Goodbye!');
}

greet('Alice', sayGoodbye);
// Output:
// Hello Alice
// Goodbye!
```
### Asynchronous Callbacks
- Callbacks are especially useful for asynchronous operations, such as fetching data from a server or reading a file. They allow these operations to proceed without blocking the execution of other code.
```
function doSomething(callback) {
  console.log('Doing something...');
  setTimeout(() => {
    console.log('Done!');
    callback();
  }, 2000);
}

function afterDone() {
  console.log('This runs after the "doSomething" operation is complete.');
}

doSomething(afterDone);
// Output:
// Doing something...
// Done! (after 2 seconds)
// This runs after the "doSomething" operation is complete.
```

## Promises
- Promises in JavaScript are objects that represent the eventual completion (or failure) of an asynchronous operation and its resulting value. They provide a cleaner, more intuitive way to handle asynchronous operations compared to traditional callback-based approaches.

### A promise can be in one of three states:
- `Pending`: The initial state, neither fulfilled nor rejected.
- `Fulfilled`: The operation completed successfully.
- `Rejected`: The operation failed.

### Creating a Promise
- A promise is created using the `Promise` constructor, which takes a function (executor) as an argument. The executor function takes two arguments: `resolve` and `reject`. Call `resolve` when the asynchronous operation is successful and `reject` when it fails
```
const promise = new Promise((resolve, reject) => {
  // Asynchronous operation
  if (/* operation successful */) {
    resolve(value); // value is the result of the successful operation
  } else {
    reject(error); // error is the reason for failure
  }
});
```
### Using a promise 
```
promise
  .then(result => {
    console.log(result); // 'Operation successful'
  })
  .catch(error => {
    console.error(error); // 'Operation failed'
  });
```
### Handling Multiple Promises

#### Promise.all: 
- This method takes an array of promises and returns a single promise that resolves when all the promises in the array have resolved, or rejects when any promise in the array rejects.
```
const promise1 = new Promise((resolve, reject) => setTimeout(resolve, 1000, 'One'));
const promise2 = new Promise((resolve, reject) => setTimeout(resolve, 2000, 'Two'));
const promise3 = new Promise((resolve, reject) => setTimeout(resolve, 3000, 'Three'));

Promise.all([promise1, promise2, promise3])
  .then(results => {
    console.log(results); // ['One', 'Two', 'Three']
  })
  .catch(error => {
    console.error('Error:', error);
  });
```

#### Promise.race: 
- This method takes an array of promises and returns a single promise that resolves or rejects as soon as any one of the promises in the array resolves or rejects.
```
const promise1 = new Promise((resolve, reject) => setTimeout(resolve, 1000, 'One'));
const promise2 = new Promise((resolve, reject) => setTimeout(resolve, 2000, 'Two'));
const promise3 = new Promise((resolve, reject) => setTimeout(resolve, 3000, 'Three'));

Promise.race([promise1, promise2, promise3])
  .then(result => {
    console.log(result); // 'One'
  })
  .catch(error => {
    console.error('Error:', error);
  });
```


## Async Await
- `async` and `await` are JavaScript keywords introduced in ECMAScript 2017 (ES8) that simplify working with asynchronous code by allowing you to write it in a synchronous-looking manner. They work with Promises and provide a more readable and straightforward way to handle asynchronous operations compared to chaining `.then()` and `.catch()` methods.

### Basic Concept
- `async`: This keyword is used to declare an asynchronous function. An `async` function always returns a Promise. If the function returns a value, that value is automatically wrapped in a resolved Promise. If it throws an error, it is wrapped in a rejected Promise.
- `await`: This keyword can only be used inside `async` functions. It pauses the execution of the `async` function and waits for the Promise to resolve or reject. It then returns the resolved value or throws the rejected error.

### Basic Syntax
#### Async Function:
```
async function myAsyncFunction() {
  // code here
}
```
#### Await Expression:
```
const result = await promise;
```

## Prototypes
    - Each object in JavaScript has a prototype, which acts as a template or a blueprint for the object. It defines the object's properties and methods.

## Modules
    - Modules in JavaScript are a way to organize and structure code by breaking it into smaller, reusable pieces

## Sets & Weaksets
### Set:
- Stores unique values.
- Values are iterable and can be of any type.
- Provides methods like add, delete, has, clear, and supports iteration.
```
const mySet = new Set();

mySet.add(1);
mySet.add(2);
mySet.add(3);
mySet.add(2); // Duplicate, will be ignored

console.log(mySet.has(2)); // true
console.log(mySet.has(4)); // false

mySet.delete(2);
console.log(mySet.has(2)); // false

mySet.clear();
console.log(mySet.size); // 0

const arr = Array.from(mySet);
console.log(arr); // [1, 2, 3]
```
### WeakSet:
- Stores objects with weak references.
- Only holds objects, not primitive values.
- Not iterable and does not have methods to check size or iterate over its values.
```
const weakSet = new WeakSet();

const obj1 = {};
const obj2 = {};
weakSet.add(obj1);
weakSet.add(obj2);

// Checking for Objects:
console.log(weakSet.has(obj1)); // true
console.log(weakSet.has(obj2)); // true
console.log(weakSet.has({})); // false (different object)

weakSet.delete(obj1);
console.log(weakSet.has(obj1)); // false

```

## Maps & Weakmaps
### Map:
- Stores key-value pairs where keys and values can be of any type.
- Keys are ordered and can be iterated.
- Provides methods for checking size, and iterating with forEach and other constructs.
```
const myMap = new Map();

myMap.set('name', 'Alice');
myMap.set(1, 'number');
myMap.set(true, 'boolean');

console.log(myMap.get('name')); // 'Alice'
console.log(myMap.get(1)); // 'number'
console.log(myMap.get(true)); // 'boolean'

console.log(myMap.has('name')); // true
console.log(myMap.has(2)); // false

myMap.delete(1);
console.log(myMap.has(1)); // false

myMap.clear();
console.log(myMap.size); // 0
```
### WeakMap:
- Stores key-value pairs where keys are objects and are weakly held.
- Does not prevent garbage collection of keys.
- No iteration methods, size property, or direct access to entries.
```
const weakMap = new WeakMap();

const obj1 = {};
const obj2 = {};
weakMap.set(obj1, 'value1');
weakMap.set(obj2, 'value2');

console.log(weakMap.get(obj1)); // 'value1'
console.log(weakMap.get(obj2)); // 'value2'

console.log(weakMap.has(obj1)); // true
console.log(weakMap.has({})); // false (different object)

weakMap.delete(obj1);
console.log(weakMap.has(obj1)); // false
```


## Regular expressions
- Regular expressions (regex) are patterns used to match sequences of characters in strings. They are powerful tools for searching, matching, and manipulating text. JavaScript supports regular expressions with a set of built-in methods and syntax.
```
const regex = /pattern/;
const regex = new RegExp('pattern');
```
```
const regex = /cat/;
const str = 'The cat is on the roof.';
console.log(regex.test(str)); // true
```

## Basic Primitive Concepts 

### Numbers Infinity
```
console.log(26 / 0); // Output: Infinity
console.log(-26 / 0); // Output: -Infinity
console.log(Infinity + 1); // Output: Infinity
console.log(Infinity - Infinity); // Output: NaN
```

### Number Nan (Not A Number)
```
console.log(0 / 0); // Output: NaN
console.log(parseInt('hello')); // Output: NaN
console.log(Math.sqrt(-1)); // Output: NaN

console.log(Number.isNaN(NaN)); // true
console.log(NaN === NaN); // false
```

### Undefined
```
let x;
console.log(x); // Output: undefined
```

### null
```
let y = null;
console.log(y); // Output: null
```

### BigInt
```
const x = BigInt(Number.MAX_SAFE_INTEGER); // 9007199254740991n
x + 1n === x + 2n; // false because 9007199254740992n and 9007199254740993n are unequal
```

### Number
```
Number.MAX_SAFE_INTEGER + 1 === Number.MAX_SAFE_INTEGER + 2; // true because both are 9007199254740992
```

## String Methods

### String Literals
```
let singleQuoteStr = 'Hello, world!'; // single qoute
let doubleQuoteStr = "Hello, world!"; // double qoute
let templateStr = `Hello, world!`; // ` qoute
```
### String Concatenation
```
let str1 = 'Hello, ';
let str2 = 'world!';
let combined = str1 + str2; // "Hello, world!"

let name = 'John';
let greeting = `Hello, ${name}!`; // "Hello, John!"
```

### Template Literals
```
let name = 'Alice';
let age = 30;
let greeting = `Hello, ${name}. You are ${age} years old.`;
console.log(greeting); // "Hello, Alice. You are 30 years old."
```

### String Immutability
```
let str = 'Hello';
let newStr = str.replace('H', 'J');
console.log(str); // "Hello"
console.log(newStr); // "Jello"
```

### String Length
```
let text = 'Hello';
console.log(text.length); // Output: 5
```

### .toUpperCase() and .toLowerCase(): Convert the string to upper or lower case.
```
let text = 'Hello';
console.log(text.toUpperCase()); // "HELLO"
console.log(text.toLowerCase()); // "hello"
```
### .substring(start, end): Extracts a portion of the string from start to end.
```
let text = 'Hello, world!';
console.log(text.substring(0, 5)); // "Hello"
```

### .slice(start, end): Similar to substring(), but also allows for negative indices.
```
let text = 'Hello, world!';
console.log(text.slice(7)); // "world!"
console.log(text.slice(-6)); // "world!"
```

### .indexOf(searchValue, fromIndex): Finds the first occurrence of searchValue, returns -1 if not found.
```
let text = 'Hello, world!';
console.log(text.indexOf('world')); // 7
```

### .replace(searchValue, newValue): Replaces the first occurrence of searchValue with newValue.
```
let text = 'Hello, world!';
console.log(text.replace('world', 'JavaScript')); // "Hello, JavaScript!"
```

### .split(separator): Splits the string into an array of substrings based on separator.
```
let text = 'apple,banana,cherry';
console.log(text.split(',')); // ["apple", "banana", "cherry"]
```

### .trim(): Removes whitespace from both ends of the string.
```
let text = '  Hello, world!  ';
console.log(text.trim()); // "Hello, world!"
```

### Escape Sequences

- \': Single quote
- \": Double quote
- \\: Backslash
- \n: New line
- \t: Tab

```
let escapedStr = 'He said, \'Hello, world!\'\nIt was great.';
console.log(escapedStr);
```


## Object Methods 

### Object Creation

#### Object Literal
```
let person = {
  name: 'John',
  age: 30,
  greet() {
    console.log('Hello!');
  }
};
```

#### Constructor Function:
```
function Person(name, age) {
  this.name = name;
  this.age = age;
}

let john = new Person('John', 30);
```

#### Object.create():
```
let proto = { greet() { console.log('Hello!'); } };
let obj = Object.create(proto);
```

#### Class Syntax (ES6):
```
class Person {
  constructor(name, age) {
    this.name = name;
    this.age = age;
  }
  
  greet() {
    console.log('Hello!');
  }
}

let john = new Person('John', 30);
```

### Property Access and Assignment
- Properties of an object can be accessed and modified using dot notation or bracket notation.

#### Dot Notation:

```
let person = { name: 'John', age: 30 };
console.log(person.name); // John
person.age = 31;
```
#### Bracket Notation:
```
let person = { name: 'John', age: 30 };
console.log(person['name']); // John
person['age'] = 31;
```

### this Keyword
- this refers to the object that is currently executing the code.

#### In Methods:
```
let person = {
  name: 'John',
  greet() {
    console.log(this.name);
  }
};
person.greet(); // John

const ref = person.greet;

ref() // undefine

```
#### In Constructor Functions:
```
function Person(name) {
  this.name = name;
}
let john = new Person('John');
console.log(john.name); // John

```

### Property Descriptors
- Properties in JavaScript objects have descriptors that define their characteristics.
#### Object.defineProperty():
```
let person = {};
Object.defineProperty(person, 'name', {
  value: 'Alice',
  writable: false, // Property is read-only
  enumerable: true, // Property shows up in for...in and Object.keys()
  configurable: false // Property cannot be deleted or changed
});

```

#### Object.getOwnPropertyDescriptor():

```
let descriptor = Object.getOwnPropertyDescriptor(person, 'name');
console.log(descriptor);
```

### Inheritance and Prototypes
- JavaScript uses prototypes to implement inheritance. Each object has a prototype object from which it inherits properties and methods.

#### Prototype Chain:
```
function Person(name) {
  this.name = name;
}
Person.prototype.greet = function() {
  return `Hello, my name is ${this.name}`;
};

let alice = new Person('Alice');
console.log(alice.greet()); // Hello, my name is Alice

```

#### Object.getPrototypeOf():
```
console.log(Object.getPrototypeOf(alice) === Person.prototype); // true

```

### Object Spread and Rest
- ES6 introduced spread and rest properties for objects, allowing for more concise manipulation of objects.
#### Object Spread: 
```
let person = { name: 'Alice', age: 30 };
let employee = { ...person, job: 'Engineer' };
console.log(employee); // { name: 'Alice', age: 30, job: 'Engineer' }

```
#### Object Rest:

```
let { name, ...rest } = person;
console.log(name); // Alice
console.log(rest); // { age: 30 }
```


### Object.keys()
- Returns an array of property names.
```
let person = { name: 'Alice', age: 30 };
console.log(Object.keys(person)); // ['name', 'age']

```
### Object.values()
- Returns an array of property values.
```
console.log(Object.values(person)); // ['Alice', 30]

```
### Object.entries()
- Returns an array of [key, value] pairs.
```
console.log(Object.entries(person)); // [['name', 'Alice'], ['age', 30]]
```

### Object.freeze()
- Prevents modifications to an object.
```
let person = { name: 'Alice' };
Object.freeze(person);
person.name = 'Bob'; // No effect
```

### Object.seal()
- Prevents new properties from being added and marks all existing properties as non-configurable.
```
let person = { name: 'Alice' };
Object.seal(person);
person.age = 30; // No effect
```


## Array Methods

### Array Creation

#### Array Literal
```
let fruits = ['apple', 'banana', 'cherry'];
```
#### Array Constructor
```
let numbers = new Array(3); // Creates an array with 3 empty slots
let colors = new Array('red', 'green', 'blue'); // Creates an array with specified elements
```
#### Array.of()
```
let numbers = Array.of(1, 2, 3); // [1, 2, 3]
```
#### Array.from()
```
let str = 'hello';
let chars = Array.from(str); // ['h', 'e', 'l', 'l', 'o']
```

### Accessing and Modifying Elements
- Access and modify elements using indices.
```
let fruits = ['apple', 'banana', 'cherry'];
console.log(fruits[0]); // 'apple'
fruits[1] = 'blueberry';
console.log(fruits); // ['apple', 'blueberry', 'cherry']
```

### Common Array Methods

#### .push()
- Adds one or more elements to the end.
```
let fruits = ['apple'];
fruits.push('banana'); // ['apple', 'banana']
```

#### .pop()
- Removes the last element.
```
let fruits = ['apple', 'banana'];
let last = fruits.pop(); // 'banana'
```

#### .shift()
- Removes the first element.
```
let fruits = ['apple', 'banana'];
let first = fruits.shift(); // 'apple'
```

#### .unshift()
- Adds one or more elements to the beginning.
```
let fruits = ['banana'];
fruits.unshift('apple'); // ['apple', 'banana']
```


#### .concat()
-  Combines two or more arrays.
```
let fruits = ['apple', 'banana'];
let moreFruits = ['cherry', 'date'];
let allFruits = fruits.concat(moreFruits); // ['apple', 'banana', 'cherry', 'date']
```

#### .slice(start, end)
- Extracts a portion of the array.
```
let fruits = ['apple', 'banana', 'cherry'];
let citrus = fruits.slice(1, 3); // ['banana', 'cherry']
```

#### .splice(start, deleteCount, item1, item2, ...)
- Adds/removes elements from an array.
```
let fruits = ['apple', 'banana', 'cherry'];
fruits.splice(1, 1, 'blueberry', 'date'); // ['apple', 'blueberry', 'date', 'cherry']
```

#### .indexOf(item)
- Returns the first index of the item or -1 if not found.
```
let fruits = ['apple', 'banana', 'cherry'];
let index = fruits.indexOf('banana'); // 1
```

#### .includes(item)
- Checks if an item is in the array.
```
let fruits = ['apple', 'banana', 'cherry'];
let hasBanana = fruits.includes('banana'); // true
```

#### .forEach(callback)
- Executes a provided function once for each array element.
```
let fruits = ['apple', 'banana', 'cherry'];
fruits.forEach(fruit => console.log(fruit));
```

#### .map(callback)
- Creates a new array with results of a callback function.
```
let numbers = [1, 2, 3];
let doubled = numbers.map(num => num * 2); // [2, 4, 6]

```

#### .filter(callback)
- Creates a new array with elements that pass the test.
```
let numbers = [1, 2, 3, 4, 5];
let evens = numbers.filter(num => num % 2 === 0); // [2, 4]
```

#### .reduce(callback, initialValue)
- Applies a function against an accumulator and each element.
```
let numbers = [1, 2, 3, 4];
let sum = numbers.reduce((acc, num) => acc + num, 0); // 10
```

#### .find(callback)
- Returns the first element that satisfies the condition.
```
let numbers = [1, 2, 3, 4];
let firstEven = numbers.find(num => num % 2 === 0); // 2
```

#### .findIndex(callback)
- Returns the index of the first element that satisfies the condition.
```
let numbers = [1, 2, 3, 4];
let index = numbers.findIndex(num => num % 2 === 0); // 1
```

#### .sort(compareFunction)
- Sorts the elements of the array in place.
```
let numbers = [4, 2, 3, 1];
numbers.sort((a, b) => a - b); // [1, 2, 3, 4]
```

#### .reverse()
- Reverses the elements of the array in place.
```
let numbers = [1, 2, 3];
numbers.reverse(); // [3, 2, 1]
```

#### .join(separator)
- Joins all elements into a string separated by separator.
```
let fruits = ['apple', 'banana', 'cherry'];
let fruitString = fruits.join(', '); // "apple, banana, cherry"
```

### Array Methods with `this` Context

- Some array methods use this to refer to the current element in the callback.
#### .every(callback)
- Tests whether all elements pass the test implemented by the callback.
```
let numbers = [1, 2, 3, 4];
let allPositive = numbers.every(num => num > 0); // true
```

#### .some(callback)
- Tests whether at least one element passes the test implemented by the callback.
```
let numbers = [1, -2, 3, -4];
let hasNegative = numbers.some(num => num < 0); // true
```

### Array Iteration Methods
- Methods for iterating over arrays, each providing a different way to access or manipulate elements.

#### .forEach(callback)
- Executes a function for each element.
```
let fruits = ['apple', 'banana', 'cherry'];
fruits.forEach(fruit => console.log(fruit));
```

#### .map(callback)
- Creates a new array with the results of the callback function.
```
let numbers = [1, 2, 3];
let squares = numbers.map(num => num ** 2); // [1, 4, 9]
```

#### .filter(callback)
- Creates a new array with all elements that pass the test.
```
let numbers = [1, 2, 3, 4];
let evenNumbers = numbers.filter(num => num % 2 === 0); // [2, 4]
```

#### .reduce(callback, initialValue)
- Reduces the array to a single value.
```
let numbers = [1, 2, 3, 4];
let sum = numbers.reduce((acc, num) => acc + num, 0); // 10
```

#### .find(callback)
- Finds the first element that passes the test.
```
let numbers = [1, 2, 3, 4];
let firstEven = numbers.find(num => num % 2 === 0); // 2
```

#### .findIndex(callback)
- Finds the index of the first element that passes the test.
```
let numbers = [1, 2, 3, 4];
let index = numbers.findIndex(num => num % 2 === 0); // 1
```


#### .flat(depth)
- Flattens nested arrays up to a specified depth.
```
let nestedArray = [1, [2, [3, 4]]];
console.log(nestedArray.flat(1)); // [1, 2, [3, 4]]
console.log(nestedArray.flat(2)); // [1, 2, 3, 4]
```

#### .flatMap(callback)
- Maps each element using a mapping function and then flattens the result.
```
let arr = [1, 2, 3];
let result = arr.flatMap(x => [x, x * 2]); // [1, 2, 2, 4, 3, 6]
```

#### .copyWithin(target, start, end)
- Copies a portion of the array to another location within the same array.
```
let arr = [1, 2, 3, 4, 5];
arr.copyWithin(0, 3, 5); // [4, 5, 3, 4, 5]
```

#### .fill(value, start, end)
- Fills all elements from start to end with a static value.
```
let arr = [1, 2, 3, 4, 5];
arr.fill(0, 2, 4); // [1, 2, 0, 0, 5]
```

### Array Mutability
- Arrays in JavaScript are mutable; methods like .push(), .pop(), .splice() modify the original array.
```
let fruits = ['apple', 'banana'];
fruits.push('cherry'); // Modifies the original array
console.log(fruits); // ['apple', 'banana', 'cherry']
```

### Array Destructuring
- Array destructuring allows you to unpack values from arrays into distinct variables in a concise way.

#### Basic Destructuring:
```
let [first, second] = ['apple', 'banana'];
console.log(first);  // 'apple'
console.log(second); // 'banana'
```

#### Default Values:
```
let [first, second = 'default'] = ['apple'];
console.log(first);  // 'apple'
console.log(second); // 'default'
```

#### Skipping Items:
```
let [first, , third] = ['apple', 'banana', 'cherry'];
console.log(first);  // 'apple'
console.log(third);  // 'cherry'
```

#### Rest Element:
```
let [first, ...rest] = ['apple', 'banana', 'cherry'];
console.log(first); // 'apple'
console.log(rest); // ['banana', 'cherry']
```


###  Array Equality
- Comparing arrays can be tricky as JavaScript arrays are compared by reference, not by value.


#### Reference Comparison:
```
let arr1 = [1, 2, 3];
let arr2 = [1, 2, 3];
console.log(arr1 === arr2); // false (different references)
```

##### Value Comparison:
- To compare arrays by value, you need to implement a custom comparison function or use a library.

```
function arraysEqual(a, b) {
  if (a.length !== b.length) return false;
  for (let i = 0; i < a.length; i++) {
    if (a[i] !== b[i]) return false;
  }
  return true;
}

console.log(arraysEqual(arr1, arr2)); // true
```












# Node Build in Modules
- fs (File System)
- path
- http
- https 
- url
- os
- events
- stream
- util
- crypto

## commonJs vs EsModule
- commonJs: require() and module.exports
- EsModule: import and export

## NPM YARN PNPM - Package managers

# Importent backend developement guide for security

- Check the size of payload (In case someone put 10 GB of file onto your server it will crash that server)
- Type of payload to prevent the NoSQL injections (use library called joi)
- Rate limiting
- Encryption of sensitive data ( credit card, password and all )
- HTTPS

# Authentication    
- Authentication is the process of verifying the identity of a user or system. It is about ensuring that the entity requesting access is who it claims to be. Authentication typically involves validating credentials.
    - Email / Password
    - OAuth
    - Token Based
    - JWT 

# Authorization 
- Authorization is the process of determining what an authenticated user or system is allowed to do. It involves checking permissions and granting access to resources based on the authenticated user's roles or attributes.
    - Access Control Lists (ACLs)
    - Attribute-Based Access Control (ABAC)
    - Role-Based Access Control (RBAC)

# JWT
- JWT, or `JSON Web Token`, is a compact, URL-safe token format used for securely transmitting information between parties. It is commonly used for authentication and information exchange in web applications and APIs.
- JWT is composed of three parts separated by dots (.):
    - Header
    - Payload
    - Signature


# Express JS starter
```
const express = require('express')
const app = express()
const port = 3000

app.get('/', (req, res) => {
  res.send('Hello World!')
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})
```

# Problems:

### Implement a function that converts a Javascript value into a JSON string.
```
function toJsonString(value) {
  return JSON.stringify(value);
}
```

### Implement a function that performs a deep copy of a value, but also handles circular references.
```
function deepCopy(value, visited = new Map()) {
  // Handle non-objects (primitives and null)
  if (value === null || typeof value !== 'object') {
    return value;
  }

  // Handle circular references
  if (visited.has(value)) {
    return visited.get(value);
  }

  // Create a new object or array based on the type of value
  const copy = Array.isArray(value) ? [] : {};

  // Store the reference to handle circular references
  visited.set(value, copy);

  // Recursively copy properties
  for (const key of Object.keys(value)) {
    copy[key] = deepCopy(value[key], visited);
  }

  return copy;
}
```
```
// Example with circular reference
const a = { name: 'Alice' };
const b = { name: 'Bob', friend: a };
a.friend = b; // Circular reference

const copied = deepCopy(a);

console.log(copied); // { name: 'Alice', friend: { name: 'Bob', friend: [Circular] } }
console.log(copied.friend.friend === copied); // true, circular reference preserved
```


### Implement a function to filter rows of data matching a specified requirement.
```
function filterRows(data, filterFn) {
  return data.filter(filterFn);
}

const data = [
  { id: 1, name: 'Alice', age: 25 },
  { id: 2, name: 'Bob', age: 30 },
  { id: 3, name: 'Charlie', age: 35 },
  { id: 4, name: 'David', age: 40 }
];

function ageGreaterThan30(row) {
  return row.age > 30;
}

const filteredData = filterRows(data, ageGreaterThan30);

console.log(filteredData);
// Output: [ { id: 3, name: 'Charlie', age: 35 }, { id: 4, name: 'David', age: 40 } ]


```

### Implement a function that performs insertion sort.
```
function insertionSort(arr) {
  // Iterate over each element in the array starting from the second element
  for (let i = 1; i < arr.length; i++) {
    // Current element to be inserted
    const current = arr[i];
    // Position to insert the current element
    let j = i - 1;

    // Move elements of arr[0..i-1] that are greater than current to one position ahead
    while (j >= 0 && arr[j] > current) {
      arr[j + 1] = arr[j];
      j--;
    }

    // Place the current element at its correct position
    arr[j + 1] = current;
  }

  return arr;
}

const unsortedArray = [5, 3, 8, 6, 2];
const sortedArray = insertionSort(unsortedArray);
console.log(sortedArray); // Output: [2, 3, 5, 6, 8]
```

### Swapping 2 Numbers
```
let a = 1;
let b = 2;

[a, b] = [b, a]

console.log(a, b);
```

### KNP ALGORITHUM
```
// KNP search

function knpSearch(string, value) {
  if (!string.length) return -1;

  let count = 0;

  for (let i = 0, j = 0; i < string.length; ) {
    if (string[i + j] === value[j]) {
      if (j === value.length - 1) {
        count++;
        j = 0;
        i++;
      } else {
        j++;
      }
    } else {
      j = 0;
      i++;
    }
  }

  return count;
}

const res = knpSearch("banana ana", "ana");

console.log(res);
```


### Binary Search
```
// binary search

function binarySearch(array, value) {
  if (!array.length) return -1;

  let start = 0;
  let end = array.length - 1;
  let mid = Math.floor((start + end) / 2);

  while (array[mid] !== value && start <= end) {
    if (value > array[mid]) {
      start = mid + 1;
    } else {
      end = mid - 1;
    }
    mid = Math.floor((start + end) / 2);
  }

  return array[mid] === value ? mid : -1;
}

const res = binarySearch(
  [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20],
  1
);

console.log(res);
```

### linear search
```
// linear search

function linearSearch(array, value) {
  if (!array.length) return -1;

  for (let i = 0; i < array.length; i++) {
    if (array[i] === value) return i;
  }

  return -1;
}

const res = linearSearch(["hello", "guys", "you", "are", "beautiful"], "you");

console.log(res);
```

### Bubble Sort
```
// bubble sort

function bubbleSort(array) {
  let noSwap = false; // when array is sorted dont swap again and break the loop

  for (let j = array.length - 1; j > 0; j--) {
    noSwap = true;

    for (let i = 0; i < j; i++) {
      if (array[i] > array[i + 1]) {
        const temp = array[i];
        array[i] = array[i + 1];
        array[i + 1] = temp;
        noSwap = false; // after swap to check next element and not break the loop
      }
    }
    if (noSwap) break;
  }

  return array;
}

const res = bubbleSort([2, 6, 23, 7, 38, 23, 92, 22, 7, 9]);

console.log(res);
```

### Selection sort
```
// Selection Sort

function selectionSort(array) {
  for (let i = 0; i < array.length; i++) {
    let smallestElementIndex = i;
    for (let j = i + 1; j < array.length; j++) {
      if (array[smallestElementIndex] > array[j]) {
        smallestElementIndex = j;
      }
    }

    if (smallestElementIndex !== i) {
      let temp = array[i];
      array[i] = array[smallestElementIndex];
      array[smallestElementIndex] = temp;
    }
  }

  return array;
}

const res = selectionSort([2, 6, 23, 7, 38, 23, 92, 22, 7, 9]);

console.log(res);
```

### Prime Number
```
let count = 0;

for (let i = 2; i < 51; i++) {
  for (let j = 1; j <= i; j++) {
    if (i % j === 0) {
      count++;
    }
  }

  if (count === 2) console.log(i);
  count = 0;
}
```

### Even Number 
```
for (let i = 0; i <= 100; i++) {
  if (i % 2 === 0) {
    console.log(i);
  }
}
```

### odd Number
```
for (let i = 0; i <= 100; i++) {
  if (i % 2 !== 0) {
    console.log(i);
  }
}
```

### Fibonacci Series
```
function fibonacciIterative(n) {
  const sequence = [];
  let a = 0, b = 1;

  for (let i = 0; i < n; i++) {
    sequence.push(a);
    const next = a + b;
    a = b;
    b = next;
  }

  return sequence;
}

console.log(fibonacciIterative(10)); // Output: [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
```