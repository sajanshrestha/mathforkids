//
//  SettingsView.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 7/1/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//


import SwiftUI

struct SettingsView: View {
    
    @State private var username = ""
    @State private var saved = false
    @State private var showAlert = false
    
    @Environment(\.presentationMode) var presentation

    
    var body: some View {
        ZStack {
            Form {
                TextField("Username", text: $username)
                Button("Save") {
                    guard !self.username.isEmpty else {
                        self.showAlert = true
                        return
                    }
                    self.saveUserName(self.username)
                    self.dismiss()
                }.foregroundColor(.green)
                
                Button("Cancel") {
                    self.dismiss(after: 0.3)
                }.foregroundColor(.red)
            }
            
            CorrectIcon(correct: $saved)
        }
        .onAppear {
            self.username = UserDefaults.getUserName()
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Field Empty"), message: Text("Please enter a username"), dismissButton: .default(Text("Ok")))
        }
        
    }
    
    private func saveUserName(_ username: String) {
        UserDefaults.updateUserName(with: username)
        saved = true
    }
    
    private func dismiss(after delay: Double = 1.0) {
        withAnimation {
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                self.presentation.wrappedValue.dismiss()
            }
        }
    }
    
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}