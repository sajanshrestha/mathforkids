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
    var body: some View {
        Form {
            TextField("Username", text: $username)
            Button("Save") {}
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
