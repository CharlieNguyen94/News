//
//  ResultState.swift
//  ResultState
//
//  Created by Charlie Nguyen on 27/08/2021.
//

import Foundation

enum ResultState {
    case loading
    case success(content: [Article])
    case failed(error: Error)
}
