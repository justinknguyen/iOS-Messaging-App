//
//  dmApp.swift
//  dm
//
//  Created by Justin Nguyen on 2022-05-19.
//

import SwiftUI

@main
struct dmApp: App {
    var body: some Scene {
        WindowGroup {
            SplashScreenView().preferredColorScheme(.light)
        }
    }
}

struct appButton: ButtonStyle {
    let color: Color
    
    public init(color: Color = .accentColor) {
        self.color = color
    }
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 8)
            .padding(.vertical, 3)
            .foregroundColor(.accentColor)
            .background(Color.accentColor.opacity(0.2))
            .cornerRadius(8)
    }
}

struct appTextField: TextFieldStyle {
    @Binding var focused: Bool
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(focused ? Color.accentColor : Color.accentColor.opacity(0.2), lineWidth: 2)
            ).padding()
    }
}
