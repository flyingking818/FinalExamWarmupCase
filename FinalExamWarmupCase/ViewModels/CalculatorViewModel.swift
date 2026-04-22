// ===============Key concepets review for the final exam.================
// MARK: - ViewModel (The "VM" in MVVM)
//
// The ViewModel sits between the Model and the View.
// It owns the state the View displays and calls the Model to do work.
//
// Key concepts:
//
//   ObservableObject
//     Makes this class "watchable" by SwiftUI Views.
//     Any View using @StateObject or @ObservedObject with this class
//     will automatically re-render when a @Published property changes.
//
//   @Published
//     Broadcasts a change to every View that's watching.
//     When `result` changes, SwiftUI redraws the result label automatically.

// SIMILAR TO UNIT CONVERTER:
//   ConverterViewModel had @Published inputText, selectedCategory,
//   fromUnit, toUnit, and resultText.
//   CalculatorViewModel has the same idea — @Published properties
//   for the inputs, the selection, and the result.
 
import Foundation
import Combine
 
class CalculatorViewModel: ObservableObject {
 
    // MARK: - Published State
    // SwiftUI watches these. When any of them change,
    // every View observing this ViewModel re-renders automatically.
 
    @Published var numberA = ""
    @Published var numberB = ""
    @Published var selectedIndex = 0
    @Published var result = ""
 
    // MARK: - Model
    // The ViewModel owns the Model — same as in the Unit Converter.
    let model = CalculatorModel()
 
    // MARK: - Calculate
    // Called by the View when the user taps Calculate.
    // The View never does math — it just calls this function.
    func calculate() {
        guard let a = Double(numberA), let b = Double(numberB) else {
            result = "Enter valid numbers."
            return
        }
 
        guard let value = model.calculate(a: a, b: b, operatorIndex: selectedIndex) else {
            result = "Cannot divide by zero."
            return
        }
 
        // Show as a whole number if possible, otherwise 2 decimal places.
        // Same formatting pattern used in the Unit Converter result.
        if value.truncatingRemainder(dividingBy: 1) == 0 {
            result = "\(Int(value))"
        } else {
            result = String(format: "%.2f", value)
        }
    }
 
    // MARK: - Reset
    // Clears all fields — same reset pattern as the Unit Converter.
    func reset() {
        numberA = ""
        numberB = ""
        selectedIndex = 0
        result = ""
    }
}
