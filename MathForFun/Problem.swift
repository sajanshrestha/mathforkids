//
//  Problem.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 7/20/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation

protocol Problem {
    var rightAnswer: String { get }
    var options: [String] { get }
}
