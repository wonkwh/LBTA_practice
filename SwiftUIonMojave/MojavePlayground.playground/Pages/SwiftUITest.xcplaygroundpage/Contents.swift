//: [Previous](@previous)

import SwiftUI
import PlaygroundSupport

struct CustomContentView: View {
    var body: some View {
        DetailView()
    }
}

struct DetailView: View {
    var body: some View {
        VStack (spacing: 24) {
            Text("Custom Content").font(.headline)
            Text("123").font(.system(size: 14, design: .monospaced))
            Text("444 CONTENT HERE123123 444 CONTENT")
                .color(.red)
                .font(.body)
                .lineLimit(nil)
        }
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = UIHostingController(rootView: CustomContentView())
//: [Next](@next)
