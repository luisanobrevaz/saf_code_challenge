# Saf Code Challenge - Receipt Printer

#### Ruby Aplication that prints out the receipt details for shopping baskets.

Installation
-----------------------
Install rspec with:
```bash
bundle install
```

Running the application
-----------------------
You can run all examples with:
```bash
ruby run.rb
```
Each example can be executed individually with:
```bash
ruby run.rb challenge_examples/input1.txt
ruby run.rb challenge_examples/input2.txt
ruby run.rb challenge_examples/input3.txt
```

Running Tests
-----------------------
Specs are ran with rspec. Simply run rspec on your command line.
```bash
bundle exec rspec
```

Assumptions
-----------------------
1) Item Name on Example 3:
given input:
```
3 imported boxes of chocolates at 11.25
```
expected output:
```
3 imported box of chocolates: 35.55
```

In the provided examples, there is only one other case where the quantity of an item is greater than 1 (book). In that case, the item name remained singular (i.e., "book" instead of "books"), despite the plural quantity.
Based on this pattern, it is assumed that the use of "boxes" instead of "box" in this example is a typo. Consistency across examples suggests that item names should not change to plural forms, even when the quantity is greater than 1.
