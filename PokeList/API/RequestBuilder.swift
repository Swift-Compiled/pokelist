//
//  RequestBuilder.swift
//  PokeList
//
//  Created by Alex Brown on 14/06/2020.
//  Copyright © 2020 ABrown. All rights reserved.
//

import Foundation

protocol RequestBuilder {
    var urlRequest: URLRequest {get}
}
