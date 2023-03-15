//
//  TestTextToSpeechApp.swift
//  TestTextToSpeech
//
//  Created by Spencer Hurd on 3/14/23.
//

import SwiftUI

@main
struct TestTextToSpeechApp: App {
    
    @StateObject var contentViewModel = ContentViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(contentViewModel)
        }
    }
}
