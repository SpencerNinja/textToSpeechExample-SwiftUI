//
//  ContentView.swift
//  TestTextToSpeech
//
//  Created by Spencer Hurd on 3/14/23.
//

import SwiftUI
import AVFAudio
//import AVFoundation

struct ContentView: View {
    
    @EnvironmentObject var contentViewModel: ContentViewModel

    var body: some View {
        VStack {
            TextField("Enter text", text: $contentViewModel.inputString)
                .textFieldStyle(.roundedBorder)
            Button("Text to speech") {
                contentViewModel.createSpeech()
            }
        }
        .padding()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ContentViewModel())
    }
}

class ContentViewModel: ObservableObject {
    
    @Published var inputString = "Hello Spencer! My name is Mr. Robot."
    
    lazy var utterance = AVSpeechUtterance(string: inputString)
    
    let synthesizer = AVSpeechSynthesizer()
    
    func createSpeech() {
        // English, American accent
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        // English, Irish accent
//        utterance.voice = AVSpeechSynthesisVoice(language: "en-IE")
        // English, Australian accent
//        utterance.voice = AVSpeechSynthesisVoice(language: "en-AU")
         // English, British accent
//        utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
        
        utterance.pitchMultiplier = 1.2
        utterance.rate = 0.4
        synthesizer.speak(utterance)
    }
    
}

/*
 SOURCES
 - https://medium.com/devtechie/speech-synthesis-text-to-speech-in-swiftui-20045dbe468d
 - https://www.hackingwithswift.com/example-code/media/how-to-convert-text-to-speech-using-avspeechsynthesizer-avspeechutterance-and-avspeechsynthesisvoice
 */
