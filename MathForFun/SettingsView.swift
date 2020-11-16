//
//  SettingsView.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 7/1/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//


import SwiftUI

struct SettingsView: View {
    
    @Binding var username: String
    @State private var saved = false
    @State private var showAlert = false
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        
        ZStack {
            VStack {
                
                Form {
                    
                    Section(header: Text("Enter your username")) {
                        
                        TextField("Username", text: $username)
                        
                        Button("Save") {
                            
                            guard !self.username.isEmpty else {
                                self.showAlert = true
                                return
                            }
                            self.saveUserName(self.username)
                            self.dismiss()
                        }.foregroundColor(.green)
                        
                        
                    }
                    
                    Section(header: Text("Rate the app")) {
                        Button("Rate") {
                            AppStoreReviewManager.requestReviewIfAppropriate()
                        }
                    }
                }
                Button("Cancel") {
                    self.dismiss(after: 0.3)
                }.foregroundColor(.red)
            }
            
            CorrectIcon(correct: $saved, color: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))
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
        SettingsView(username: .constant(""))
    }
}
