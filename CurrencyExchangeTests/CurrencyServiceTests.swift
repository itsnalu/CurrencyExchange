//
//  CurrencyServiceTests.swift
//  CurrencyExchange
//
//  Created by Ana Luisa Moreira Rodrigues on 20/11/24.
//
import XCTest
import Foundation
@testable import CurrencyExchange

class MockCurrencyService: CurrencyService {
    var shouldReturnError = false

    override func fetchCurrency(_ currency: String, completion: @escaping (Result<Currency, Error>) -> Void) {
        if shouldReturnError {
            let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Mock Error"])
            completion(.failure(error))
        } else {
            let mockData = Currency(code: "USD", codein: "BRL", name: "Dólar Americano", bid: "5.30")
            completion(.success(mockData))
        }
    }
}

class CurrencyServiceTests: XCTestCase {
    var mockService: MockCurrencyService!

    override func setUp() {
        super.setUp()
        mockService = MockCurrencyService()
    }

    func testFetchCurrencySuccess() {
        mockService.shouldReturnError = false
        let expectation = self.expectation(description: "Fetch Currency Success")

        mockService.fetchCurrency("USD-BRL") { result in
            switch result {
            case .success(let currency):
                XCTAssertEqual(currency.code, "USD")
                XCTAssertEqual(currency.bid, "5.30")
                expectation.fulfill()
            case .failure:
                XCTFail("Expected success but got failure")
            }
        }

        waitForExpectations(timeout: 1, handler: nil)
    }

    func testFetchCurrencyFailure() {
        mockService.shouldReturnError = true
        let expectation = self.expectation(description: "Fetch Currency Failure")

        mockService.fetchCurrency("USD-BRL") { result in
            switch result {
            case .success:
                XCTFail("Expected failure but got success")
            case .failure(let error):
                XCTAssertEqual(error.localizedDescription, "Mock Error")
                expectation.fulfill()
            }
        }

        waitForExpectations(timeout: 1, handler: nil)
    }
}
