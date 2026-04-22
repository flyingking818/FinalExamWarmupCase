# Final Exam Warmup — Case Study
## MVVM Calculator App
### Flagler College CIS 331 Mobile App Development

---

## The Scenario

You have been hired as a junior iOS developer at a startup called QuickCalc Inc.
Your first task is to build a simple calculator app for internal use. Your tech
lead has given you the following requirements and expects you to apply the MVVM
design pattern — the same pattern you used in your Unit Converter project.

---

## Requirements

Your tech lead says:

> "The app takes two numbers from the user, lets them pick an operator from a
> segmented control, and shows the calculated result. Division by zero should be
> handled gracefully. The code must follow MVVM — no business logic in the View."

The finished app must have:

- Two text fields for numeric input
- A segmented Picker showing  +  −  ×  ÷
- A Calculate button that triggers the math
- A result area that only appears after Calculate is tapped
- A Reset button in the navigation bar that clears all fields
- Error messages for non-numeric input and division by zero

---

## MVVM File Map

Just like the Unit Converter, this app has exactly three Swift files — one per layer.

| File                          | Layer         | Responsibility |
|------                         |-------        |----------------|
| CalculatorModel.swift         | Model         | Holds the operators array. Does the math. No SwiftUI. |
| CalculatorViewModel.swift     | ViewModel     | Owns @Published state. Calls the Model. Formats the result. |
| CalculatorView.swift          | View          | Displays the UI. Binds to the ViewModel with $. Calls calculate() and reset(). Zero math. |

---

## What to Build

Apply everything you learned in the Unit Converter demo to this new context:

- The `operators` array in the Model mirrors the `categories` array in the converter
- `selectedIndex` in the ViewModel mirrors the selected category index
- The segmented Picker iterates `model.operators` the same way the converter iterated units
- `calculate()` in the ViewModel mirrors `convert()` — the View calls it, never does the work itself
- `reset()` clears all @Published properties back to their defaults

---

## Discussion Questions

1. Which file should contain `import SwiftUI` — and which files should not? Why?
2. What does `@Published` do, and why does the ViewModel need `import Combine`?
3. What is the difference between `@StateObject` and `@ObservedObject`?
5. A classmate puts the math directly inside the Button action in the View. What MVVM rule does this break?
