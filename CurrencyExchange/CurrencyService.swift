//
//  CurrencyService.swift
//  CurrencyExchange
//
//  Created by Ana Luisa Moreira Rodrigues on 20/11/24.
//
import Alamofire

struct Currency: Decodable {
    let code: String
    let codein: String
    let name: String
    let bid: String
}

class CurrencyService {
    static let shared = CurrencyService()
    private let baseURL = "https://economia.awesomeapi.com.br/json"

    func fetchCurrency(_ currency: String, completion: @escaping (Result<Currency, Error>) -> Void) {
        let url = "\(baseURL)/\(currency)"
        AF.request(url).validate().responseDecodable(of: Currency.self) { response in
            switch response.result {
            case .success(let currencyData):
                completion(.success(currencyData))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
