//
//  APIError.swift
//  PokeList
//
//  Created by Alex Brown on 14/06/2020.
//  Copyright © 2020 ABrown. All rights reserved.
//

import Foundation

enum APIError: Error {
    case decodingError
    case httpError(Int)
    case unknown
}

