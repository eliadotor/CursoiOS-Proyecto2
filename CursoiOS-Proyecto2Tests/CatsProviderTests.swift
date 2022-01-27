//
//  CatsProviderTests.swift
//  CursoiOS-Proyecto2Tests
//
//  Created by Elia Dotor Puente on 27/1/22.
//

import XCTest
@testable import CursoiOS_Proyecto2

class CatsProviderTests: XCTestCase {

    func testShouldFetchCats() {
        let expectation = expectation(description: "")
        let sut = NetworkCatsListProvider()
        
        
        sut.getCatsList { result in
            switch result {
            case .success(let cats) :
                //print(cats)
                XCTAssertFalse(cats.isEmpty)
            case .failure(let error): XCTFail(error.localizedDescription)
            }
            expectation.fulfill()
            
        }
        waitForExpectations(timeout: 5, handler: nil)
    }

}
