//
//  LoginError.swift
//  RBPoem
//
//  Created by Run on 2024/3/16.
//

import Foundation

enum LoginError: Error {
    case validatedError(msg: String)
    case RequestError
}
