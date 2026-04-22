// ===============Key concepets review for the final exam.================
// MARK: - View (The "V" in MVVM)
//
// The View displays the UI and reacts to user input.
// It reads from and writes to the ViewModel — it does NO math itself.
//
// Key concepts reviews:
//
//   @StateObject
//     Creates and owns the ViewModel for the lifetime of this View.
//     Use @StateObject when THIS view is responsible for creating the object.
//
//   @Published + two-way binding ($)
//     TextField(value: $viewModel.numberA) — the $ creates a two-way binding.
//     When the user types, the ViewModel's property updates automatically.
//     When the ViewModel changes the property, the TextField updates automatically.
//
//   Picker
//     Displays a list of selectable options. We use Operator.allCases to
//     populate it automatically — no hardcoded list needed in the View.

//  SIMIMLAR TO UNIT CONVERTER:
//   ConverterView had a Picker for category, two Pickers for units,
//   a TextField for input, and a Text for the result.
//   CalculatorView follows the same layout — TextField, Picker, result.

import SwiftUI
 
struct CalculatorView: View {
 
    @StateObject private var viewModel = CalculatorViewModel()
 
    var body: some View {
        NavigationStack {
            Form {
 
                // MARK: Numbers
                Section("Numbers") {
                    TextField("First number", text: $viewModel.numberA)
                        .keyboardType(.decimalPad)
 
                    TextField("Second number", text: $viewModel.numberB)
                        .keyboardType(.decimalPad)
                }
 
                // MARK: Operator
                // ForEach over the operators array by index —
                // same pattern as the Unit Converter's unit Picker.
                Section("Operator") {
                    Picker("Operator", selection: $viewModel.selectedIndex) {
                        ForEach(0..<viewModel.model.operators.count, id: \.self) { index in
                            Text(viewModel.model.operators[index])
                        }
                    }
                    .pickerStyle(.segmented)
                }
 
                // MARK: Calculate
                Section {
                    Button("Calculate") {
                        viewModel.calculate()
                    }
                    .frame(maxWidth: .infinity)
                    .bold()
                }
 
                // MARK: Result
                // Only shown after Calculate is tapped — same conditional
                // display pattern as the Unit Converter's result Text.
                if !viewModel.result.isEmpty {
                    Section("Result") {
                        Text(viewModel.result)
                            .font(.title2)
                            .bold()
                            .foregroundStyle(
                                viewModel.result.hasPrefix("E") || viewModel.result.hasPrefix("C")
                                ? .red : .primary
                            )
                    }
                }
            }
            .navigationTitle("Calculator")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Reset") {
                        viewModel.reset()
                    }
                }
            }
        }
    }
}
 
#Preview {
    CalculatorView()
}
