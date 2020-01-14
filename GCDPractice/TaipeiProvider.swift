//
//  TaipeiProvider.swift
//  GCDPractice
//
//  Created by Hamburger on 2020/1/14.
//  Copyright © 2020 Hamburger. All rights reserved.
//

import Foundation

class TaipeiProvider {
    
    let decoder = JSONDecoder()
    let requestFirst = TaipeiRequest.firstRequest
    let requestSecond = TaipeiRequest.secondRequest
    let requestThird = TaipeiRequest.thirdRequest
    
    func fetchFirst(completion: @escaping (Result<TaipeiResult>) -> Void) {

        HTTPClient.shared.request(
            requestFirst,
            completion: { [weak self] result in

                guard let strongSelf = self else { return }

                switch result {

                case .success(let data):

                    do {
                        let response = try strongSelf.decoder.decode(TaipeiResult.self, from: data)

//                        DispatchQueue.main.async {

                            completion(Result.success(response))
//                        }

                    } catch {

                        completion(Result.failure(error))
                    }

                case .failure(let error):

                    completion(Result.failure(error))
                }
        })
    }
    
    func fetchSecond(completion: @escaping (Result<TaipeiResult>) -> Void) {

        HTTPClient.shared.request(
            requestSecond,
            completion: { [weak self] result in

                guard let strongSelf = self else { return }

                switch result {

                case .success(let data):

                    do {
                        let response = try strongSelf.decoder.decode(TaipeiResult.self, from: data)

//                        DispatchQueue.main.async {

                            completion(Result.success(response))
//                        }

                    } catch {

                        completion(Result.failure(error))
                    }

                case .failure(let error):

                    completion(Result.failure(error))
                }
        })
    }
    
    func fetchThird(completion: @escaping (Result<TaipeiResult>) -> Void) {

        HTTPClient.shared.request(
            requestThird,
            completion: { [weak self] result in

                guard let strongSelf = self else { return }

                switch result {

                case .success(let data):

                    do {
                        let response = try strongSelf.decoder.decode(TaipeiResult.self, from: data)

//                        DispatchQueue.main.async {

                            completion(Result.success(response))
//                        }

                    } catch {

                        completion(Result.failure(error))
                    }

                case .failure(let error):

                    completion(Result.failure(error))
                }
        })
    }
}
