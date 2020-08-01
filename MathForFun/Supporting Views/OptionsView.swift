//
//  MyOptionsView.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 7/14/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import SwiftUI

struct OptionsView: View {
    
    var options: [String]
    var action: (String) -> Void
    
    var body: some View {
        
        Group {
            
            if options.count == 4 {
                
                VStack(spacing: self.spacing) {
                    
                    HStack {
                        OptionButton(title: options[0], action: action)
                        OptionButton(title: options[1], action: action)

                    }
                    HStack {
                        OptionButton(title: options[2], action: action)
                        OptionButton(title: options[3], action: action)

                    }
                }
            }
            else {
                GeometryReader { geometry in
                    
                    HStack(spacing: self.spacing) {
                        
                        ForEach(self.options, id: \.self) { option in
                            
                            Button(action: {
                                
                                self.action(option)
                                
                            }, label: {
                                
                                Text(option)
                                .padding()
                                    .frame(width: geometry.size.width/CGFloat(self.options.count) - self.spacing)
                                    .background(Color(#colorLiteral(red: 0, green: 0.9437479973, blue: 0.8790259957, alpha: 1)))
                                    .cornerRadius(4)
                                    .foregroundColor(.black)
                            })
                            
                        }
                    }
                }
            }
        }
        
    }
    
    //MARK:- constants
    //  MARK: CONSTANTS
    private let spacing: CGFloat = 4
    private let padding: CGFloat = 8
}

struct OptionsView_Previews: PreviewProvider {
    static var previews: some View {
        OptionsView(options: ["A", "B", "C", "D"], action: { _ in print("preview") })
    }
}


struct OptionButton: View {
    
    var title: String
    var action: (String) -> Void
    
    var body: some View {
        Button(action: {
            self.action(self.title)
        }, label: {
            Text(title)
                .padding()
                .frame(width: UIScreen.main.bounds.width * 0.4)
                .background(Color(#colorLiteral(red: 0, green: 0.9437479973, blue: 0.8790259957, alpha: 1)))
                .cornerRadius(4)
                .foregroundColor(.black)
                .animation(nil)
                
        })
    }
}
