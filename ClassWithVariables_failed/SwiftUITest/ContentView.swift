//
//  ContentView.swift
//  SwiftUITest
//

import SwiftUI

class ClassWithVariables {
    var intVar: Int
    var strVar: String
    var booVar: Bool

    public static let shared = ClassWithVariables()

    init() {
        intVar = 1
        strVar = "Hello"
        booVar = true
    }
}

struct ContentView: View {
    @State private var updText = Binding.init(
        get: {
            ClassWithVariables.shared.strVar
        },
        set: { newValue in
            // This will be called more times
            // Should not be a problem.
            // This is an example log.
            // the last 2 updates,
            // removes the last character..
            //
            // NewVal="Hello,doestiswork"
            // NewVal="Hello,doestiswork"
            // NewVal="Hello,doestiswor"
            // NewVal="Hello,doestiswor"
            print("NewVal=\"\(newValue)\"")
            ClassWithVariables.shared.strVar = newValue
        }
    )

    // For alert view controller.
    @State private var displayFromMemory = false

    var body: some View {
        VStack {
            Text(
                "Hello, world!"
            ).padding()

            TextField(
                "Enter Test",
                text: updText // <- will never updated?
            )
            .multilineTextAlignment(.center)
            .border(.blue, width: 1)
            .padding()

            Button("Load text from memory") {
                displayFromMemory = true
            }
            .alert(isPresented: $displayFromMemory) {
                Alert(
                    title: Text("TEXT"),
                    message: Text("\"\(ClassWithVariables.shared.strVar)\""),
                    dismissButton: .default(
                        Text("OK")
                    )
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
