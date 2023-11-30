//
//  APICaller.swift
//  Exchange rates
//
//  Created by Евгений Езепчук on 28.10.23.
//

import UIKit

enum ErrorHandler: Error {
    case serverNotFound
    case gateAwayTimeOut
}

class APICaller {
    
    
    static let shared = APICaller()

    func fetchRates(with nameOfTown: String, completion: @escaping(Result<[Model],Error>) -> Void) {
        let stringUrl = "https://belarusbank.by/api/kursExchange?city=\(nameOfTown)"
        guard let url = URL(string: stringUrl) else { return }
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            do {
                let model = try JSONDecoder().decode([Model].self, from: data)
                completion(.success(model))
            } catch {
                completion(.failure(error))
            }
        } .resume()
    }
    
    func fetchData( completion: @escaping(Result<[Model],Error>) -> Void) {
        let stringUrl = "https://belarusbank.by/api/kursExchange"
        guard let url = URL(string: stringUrl) else { return }
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            do {
                let model = try JSONDecoder().decode([Model].self, from: data)
                model.forEach { value in
                    print(value.name!)
                }
                completion(.success(model))
            } catch {
                completion(.failure(error))
            }
        } .resume()
    }
}

