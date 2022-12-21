# :open_book: Integer square root redux in ABAP

Three different ways for integer square root redux in ABAP with a simple approach to measure runtime. Check this executable [class](/src/zcl_integer_square_roots.clas.abap) written on SAP Business Technology Platform ABAP environment (Steampunk).

* First way is to calculate by brute force. That means double integer value until you get the number for which you are trying to find square root.
* Second way use an equation. This equation says that the sum of the first "n" odd numbers is "n²". So we do that backwards and we count the number of times an increasing odd number can be subtracted from another number. Result is "n".
* Third way is the standard implementation of square root in ABAP.

Please see runtimes. Results may be suprising 🤔

The whole idea to do that calculation in ABAP based on the book "Strange Code - Esoteric languages that make programming fun again". Many thanks to the author [Ronald T. Kneusel](https://www.rkneusel.com/) for this wonderful book. Nice to see that the world of programming languages not only consists of the "winners" (widely used programming languages, check TIOBE index for example).

Have fun 👍
