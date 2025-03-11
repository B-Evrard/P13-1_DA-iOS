//
//  ModelDataTest.swift
//  RelayanceTests
//
//  Created by Bruno Evrard on 11/03/2025.
//

import XCTest

final class ModelDataTest: XCTestCase {

    func testChargement() {
        let bundle = Bundle(for: type(of: self))
        
        let clientsList: [Client]  = ModelData.chargement("SourceTest.json", bundle: bundle)
        
        XCTAssertEqual(clientsList.count, 2)
    }

}


