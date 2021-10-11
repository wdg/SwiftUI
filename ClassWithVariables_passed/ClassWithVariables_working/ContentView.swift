//
//  ContentView.swift
//  ClassWithVariables_working
//
//  Created by Wesley de Groot on 11/10/2021.
//

import SwiftUI

class myClass_2 {
    // Deze moet ook geupdated worden.
    public var score = 0

    init () { }

    public func updateAndPrint(score: Int) {
        self.score = score
        print("Score: \(score)")
    }
}

class myClass: ObservableObject {
    @Published var score: Int = 0
}

struct ContentView: View {
    @StateObject var progress = myClass()
    var a = myClass_2()

    var body: some View {
        VStack {
            Text("Your score is \(progress.score)")
            Button("Increase Score") {
                progress.score += 1
                a.updateAndPrint(score: progress.score)
            }
        }
    }
}
