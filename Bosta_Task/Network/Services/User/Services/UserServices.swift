//
//  UserServices.swift
//  Bosta_Task
//
//  Created by Khalid Gad on 27/02/2025.
//

import Foundation
import Moya
import Combine

//MARK: - PROTOCOL

protocol UserServicesProtocol {
    func getUser(by id: Int) -> AnyPublisher<User?, Moya.MoyaError>
}

struct UserService: UserServicesProtocol {
    
    // MARK: - PROPERITES

    private let provider = MoyaProvider<UserEndPoint>()
    
    // MARK: - GET USER
    
    func getUser(by id: Int) -> AnyPublisher<User?, MoyaError> {
        provider.requestPublisher(.getUser(id: id))
            .map(\.data)
            .decode(type: User?.self, decoder: JSONDecoder())
            .mapError { moyaError in
                moyaError as? MoyaError ?? MoyaError.underlying(moyaError, nil)
            }
            .eraseToAnyPublisher()
    }
}

