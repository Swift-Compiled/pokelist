//
//  APIService.swift
//  PokeList
//
//  Created by Alex Brown on 14/06/2020.
//  Copyright © 2020 ABrown. All rights reserved.
//

import Foundation
import Combine
import UIKit

protocol APIService {
    func request<T: Decodable>(with builder: RequestBuilder) -> AnyPublisher<T, APIError>
    func requestImage(with url: String) -> AnyPublisher<UIImage, APIError>
}
