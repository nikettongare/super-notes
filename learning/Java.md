# Java in one shot

## Introduction to Java
- Java is a high-level, class-based, object-oriented programming language.
- Created by James Gosling at Sun Microsystems, released in 1995. Currently managed by Oracle Co-opration.
- Java programs are compiled into bytecode, which can run on any device with a Java Virtual Machine (JVM).
- "Write Once, Run Anywhere" (WORA) philosophy.

- Java Development Kit (JDK):
    - A software development environment used for developing Java applications.
    - Includes the Java Runtime Environment (JRE), an interpreter/loader (Java), a compiler (javac), an archiver (jar), a documentation generator (javadoc), and other tools.

- Java Runtime Environment (JRE):
    - Part of the JDK.
    - Provides libraries, Java Virtual Machine (JVM), and other components to run applications written in Java.

- Java Virtual Machine (JVM):
    - An abstract computing machine that enables a computer to run a Java program.
    - Converts bytecode into machine code.
    - Provides platform independence (But JVM itself is platform dependent our program in platform independent).

## Literals

- Underscore
    - example: `int num = 10_00_00_000;`
- Binary
    - '0b' prefix
    - example: `int bin = 0b1101110;` 
- Octal
    - '0' prefix
    - example: `int oct = 0156;` 

- Hexadecimal
    - '0x' prefix
    - example: `int hex = 0x6E;` 
- Float
- Boolean
- String 
- Null
    - example: `MyClass obj = null;`
- Character
    - example:
```
char c = 'A';
System.out.println(c); // output: A
c++;
System.out.println(c); // output: B
```

## Variables
- Variable is a name of the container where the data is stored in memory.

## Data Types

- Primitive
    - byte
        - 1 byte
        - -128 to +127
        - example: `byte by = 125;`
    - short
        - 2 bytes
        - -32,768 to +32,767
        - example: `short sh = 1000;`
    - int
        - 4 bytes
        - -2,147,483,648 to +2,147,483,647
        - example: `int in = 213;`
    - long
        - 8 bytes
        - -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807
        - example: `long in = 036854l;`

    - float
        - 4 bytes
        - example: `float fl = 2.4f;`
    - double
        - 8 bytes
        - example: `double do = 24.24;`

    - char
        - 2 bytes ( Java not just use english language it uses to store all languages that's why char takes 2 bytes. )
        - 0 to 65,535
        - example: `char ch = 'A';`

    - boolean
        - example: `boolean check = true;`


## Type Casting

- Iplicit 
```
byte byteVar = 42;
short shortVar = byteVar;
int intVar = shortVar;
long longVar = intvar;
float floatVar = longVar;
double doubleVar = floatVar;
```
- Explicit
```
double doubleVar = 42.0d;
float floatVar = (float) doubleVar;
long longVar = (long) floatVar;
int intVar = (int) longVar;
short shortVar = (short) intVar;
byte byteVar = (byte) shortVar;
```

## Type Promotions

```

byte a = 10;
byte b = 30;

int c = a * b; // java automatically promote the type beacause its going out of byte range

```



## Object Oriented Programming

- Class
    - A class is a blueprint or template for creating objects. It defines a set of properties (also known as fields or attributes) and methods (functions or behaviors) that the objects created from the class can have. 

- Object 
    - An object is an instance of a class. It is a concrete entity that has state and behavior defined by the class. 


## String 
- Imutable ( uses string pool)
## StringBuffer
## StringBuilder









- Basic Syntax
- Data Types & Variables
- Operators
- Control Flow (if, else, switch)
- Loops (for, while, do-while)
- Arrays & ArrayLists
- Methods & Functions
- Object-Oriented Programming (OOP) Principles
    - Classes & Objects
    - Inheritance
    - Polymorphism
    - Encapsulation
    - Abstraction
- Exception Handling


- File Handling (I/O)
- Generics
- Collections Framework
    - List, Set, Map interfaces
    - Sorting algorithms
- Concurrency
    - Threads & Synchronization
    - Executors & Thread Pools
- Lambda Expressions & Streams
- Java Database Connectivity (JDBC)


- Design Patterns
    - Singleton, Factory, Observer, etc.
- Java Virtual Machine (JVM)
    - Garbage Collection
    - Memory Management
- Networking (Sockets, HTTP, etc.)
- JavaFX or Swing (GUI Frameworks)
- Annotations & Reflection
- Unit Testing (JUnit)
- Security (Cryptography, Secure Coding)


# Hibernate

## Annotations

### @Entity 	
- Used for declaring any POJO class as an entity for a database
### @Table	
- Used to change table details, some of the attributes are-
```
name – override the table name
schema
catalogue
enforce unique constraints
```

### @Id	
- Used for declaring a primary key inside our POJO class
### @GeneratedValue	
- Hibernate automatically generate the values with reference to the internal sequence and we don’t need to set the values manually.
### @Column	
- It is used to specify column mappings. It means if in case we don’t need the name of the column that we declare in POJO but we need to refer to that entity you can change the name for the database table. Some attributes are-
```
Name – We can change the name of the entity for the database
length – the size of the column mostly used in strings
unique – the column is marked for containing only unique values
nullable – The column values should not be null. It’s marked as NOT
```

### @Transient	
- Tells the hibernate, not to add this particular column
### @Temporal
- This annotation is used to format the date for storing in the database
### @Lob
-Used to tell hibernate that it’s a large object and is not a simple object

### @OrderBy	
- This annotation will tell hibernate to OrderBy as we do in SQL.
```
For example – we need to order by student firstname in ascending order

@OrderBy(“firstname asc”) 
```