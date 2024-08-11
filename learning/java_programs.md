# Print the alternative number from the given number
```
package Problems;

public class AlternativeNumbers {
    public static void main(String[] args) {
        int num = 2824693;
        int count = 0;

        // Initialize a string to hold the alternate digits
        String alternateDigits = "";

        // Process the digits from right to left
        while (num > 0) {
            int digit = num % 10;

            // Include the digit if it's in an odd position (0-based index)
            // Change to != to take other alternatives
            if (count % 2 == 0) {
                alternateDigits = digit + alternateDigits;
            }

            // Move to the next digit
            num /= 10;
            count++;
        }

        // Print out the alternate digits
        System.out.println("Alternate digits: " + alternateDigits);

    }
}
```


# Print the even and odd numbers from number
```
package Problems;

public class EvenOddPrint {

    public static void main(String[] args) {
        int num = 123456;
        // Initialize strings for even and odd digits
        String evenDigits = "";
        String oddDigits = "";

        while (num > 0) {
            // Extract the last digit
            int digit = num % 10;

            // Check if the digit is even or odd and append to the respective string
            if (digit % 2 == 0) {
                evenDigits = digit + evenDigits;
            } else {
                oddDigits = digit + oddDigits;
            }

            // Remove the last digit
            num = num / 10;
        }

        // Print out the even and odd digits
        System.out.println("Even digits: " + evenDigits);
        System.out.println("Odd digits: " + oddDigits);
    }
}
```


# Print the last digits from number
```
package Problems;

public class LastNos {
    public static void main(String[] args) {
        int num = 1234;

        while (num > 0) {
            System.out.println(num % 10);
            num = num / 10;
        }
    }
}
```


# Print the length of the numbers
```
package Problems;

public class NumberLength {
    public static void main(String[] args) {
        int num = 1234;
        int count = 0;
        while (num > 0) {
            num = num / 10;
            count++;
        }
        System.out.println(count);
    }
}
```

# Calculate sum of first 3, last 3 and product of middle
```
package Problems;

public class SumOfFirst3Last3PRoductMiddle {
    public static void main(String[] args) {
        int num = 282423693;

        // Convert the number to a string to easily access the digits
        String numStr = String.valueOf(num);

        // Ensure the number has at least 6 digits
        if (numStr.length() < 6) {
            System.out.println("The number must have at least 6 digits.");
            return;
        }

        // Extract the first 3, last 3, and middle digits
        String firstThreeStr = numStr.substring(0, 3);
        String lastThreeStr = numStr.substring(numStr.length() - 3);
        String middleStr = numStr.substring(3, numStr.length() - 3);

        // Calculate the sum of the first 3 digits
        int sumFirstThree = 0;
        for (char digit : firstThreeStr.toCharArray()) {
            sumFirstThree += Character.getNumericValue(digit);
        }

        // Calculate the sum of the last 3 digits
        int sumLastThree = 0;
        for (char digit : lastThreeStr.toCharArray()) {
            sumLastThree += Character.getNumericValue(digit);
        }

        // Calculate the product of the middle digits
        int productMiddle = 1;
        for (char digit : middleStr.toCharArray()) {
            productMiddle *= Character.getNumericValue(digit);
        }

        // Print the results
        System.out.println("Sum of first 3 digits: " + sumFirstThree);
        System.out.println("Sum of last 3 digits: " + sumLastThree);
        System.out.println("Product of middle digits: " + productMiddle);
    }
}
```


# Search the given digit in number
```
package Problems;

import java.util.Scanner;

public class SearchGivenDigitInNumber {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Input the number
        System.out.print("Enter the number: ");
        int num = scanner.nextInt();

        // Input the digit to search for
        System.out.print("Enter the digit to search for: ");
        int digitToSearch = scanner.nextInt();

        boolean found = false;

        // Search for the digit in the number
        while (num > 0) {
            int digit = num % 10;
            if (digit == digitToSearch) {
                found = true;
                break;
            }
            num /= 10;
        }

        // Output the result
        if (found) {
            System.out.println("Digit " + digitToSearch + " is found in the number.");
        } else {
            System.out.println("Digit " + digitToSearch + " is not found in the number.");
        }

        scanner.close();
    }
}
```


# Number contains zero or not
```
package Problems;

import java.util.Scanner;

public class ContainsZeroOrNot {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Input the number
        System.out.print("Enter the number: ");
        int num = scanner.nextInt();

        boolean containsZero = false;

        // Search for zero in the number
        while (num > 0) {
            int digit = num % 10;
            if (digit == 0) {
                containsZero = true;
                break;
            }
            num /= 10;
        }

        // Output the result
        if (containsZero) {
            System.out.println("The number contains zero.");
        } else {
            System.out.println("The number does not contain zero.");
        }

        scanner.close();
    }
}
```