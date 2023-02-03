//
//  ContentView.swift
//  BipTheGuy-SwiftUI
//
//  Created by Students on 03.02.2023.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    
    @State private var audioPlayer: AVAudioPlayer!
    @State private var imageEffect = true
    
    var body: some View {
        VStack {
            Spacer()
            Image("clown")
                .resizable()
                .scaledToFit()
                .scaleEffect(imageEffect ? 1.0 : 0.9)
                .onTapGesture {
                    playSound(soundName: "punchSound")
                    imageEffect = false
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.3)) {
                        imageEffect = true
                    }
                    
                }
            
            Spacer()
            
            Button {
                //
            } label: {
                Label("Photo Library", systemImage: "photo.tv")
            }

        }
        .padding()
    }
    
    func playSound(soundName: String) {
        
        guard let soundFile = NSDataAsset(name: soundName) else {
            print("Couldn't read file named \(soundName)")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print("Error: \(error.localizedDescription) creating audioPlayer.")
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
