# KPI-3-Exam 🎓

The use of strategies as functions, classes, and their combinations is shown. Strategy selection is done through collections (dictionaries) for maximum flexibility.

## Description of Strategy Pattern Examples in Swift 📘

### 1. StrategyClassic.swift  
- Strategies as classes implementing the `CompressionStrategy` protocol.
- Dictionary selection: `"zip"`, `"rar"`, `"7zip"`.
- Demonstrates data compression using various algorithms.

### 2. StrategyFunctional.swift  
- Strategies — sorting functions: `bubbleSort`, `quickSort`, `insertionSort`.
- Selecting a function from a collection of functions.
- Context — `Sorter` that uses functional strategies.

### 3. StrategyMixed.swift  
- Combined approach: strategy as a class or function.
- Payment options: Credit Card, PayPal, Bitcoin.
- Used `enum PaymentOption` for flexible selection.

### 4. StrategyWithParameters.swift  
- Strategies take into account additional parameters (client type).
- Discounts implemented: `NoDiscount`, `VIPDiscount`, `SeasonalDiscount`.
- Context — `Checkout`, which selects the necessary logic.

### 5. StrategyDynamicSelection.swift  
- Text encryption with various functional strategies.
- Dynamic selection: `"caesar"`, `"reverse"`, `"base64"`.
- Context `Encryptor` executes the corresponding algorithm.


## Author 👨‍💻

Хвиць Максим ІМ-21