// ===============Key concepets review for the final exam.================

// MARK: - Model (The "M" in MVVM)
//
// The Model holds the app's data and business logic.
// It knows nothing about the UI.

//   SIMILAR TO UNIT CONVERTER:
//   ConverterModel had a `categories` array and a `units` dictionary.
//   CalculatorModel has an `operators` array and a `calculate()` function.
//   Same pattern — the Model owns the data, the ViewModel calls it.
 
import Foundation
 
struct CalculatorModel {
 
    // The four operators the user can pick from.
    // Plain String array — same approach as categories in the Unit Converter.
    let operators = ["+", "−", "×", "÷"]
 
    // Performs the calculation for the operator at the given index.
    // Returns nil for division by zero — the ViewModel handles that case.
    func calculate(a: Double, b: Double, operatorIndex: Int) -> Double? {
        switch operators[operatorIndex] {
        case "+":
            return a + b
        case "−":
            return a - b
        case "×":
            return a * b
        case "÷":
            guard b != 0 else { return nil }
            return a / b
        default:
            return nil
        }
    }
}
