//
//  RelayanceViewModelTest.swift
//  RelayanceTests
//
//  Created by Bruno Evrard on 26/03/2025.
//

import XCTest

final class RelayanceViewModelTest: XCTestCase {

    func testFetchClients() {
        
        let bundle = Bundle(for: type(of: self))
        let sourceJson = "SourceTest.json"
        
        let viewModel = RelayanceViewModel(sourceJson: sourceJson, bundle: bundle)
        
        XCTAssertEqual(viewModel.clientsList.count, 2)
    }
    
    func testDeleteClient() {
        
        let bundle = Bundle(for: type(of: self))
        let sourceJson = "SourceTest.json"
        
        let viewModel = RelayanceViewModel(sourceJson: sourceJson, bundle: bundle)
        XCTAssertEqual(viewModel.clientsList.count, 2)
        
        viewModel.deleteClient(client: viewModel.clientsList[0])
        
        XCTAssertEqual(viewModel.clientsList.count, 1)
        
    }
    
    func testAddClientError() {
        
        let bundle = Bundle(for: type(of: self))
        let sourceJson = "SourceTest.json"
        
        let viewModel = RelayanceViewModel(sourceJson: sourceJson, bundle: bundle)
        XCTAssertEqual(viewModel.clientsList.count, 2)
        
        var nomClient: String = ""
        var mailClient: String = ""
        
        viewModel.addClient(nom: nomClient, email: mailClient)
        
        XCTAssertTrue(viewModel.showAlert)
        XCTAssertEqual(viewModel.clientsList.count, 2)
        
        nomClient = "Bruno"
        mailClient = ""
        viewModel.addClient(nom: nomClient, email: mailClient)
        XCTAssertTrue(viewModel.showAlert)
        XCTAssertEqual(viewModel.clientsList.count, 2)
        
        nomClient = "Bruno"
        mailClient = "azert"
        viewModel.addClient(nom: nomClient, email: mailClient)
        XCTAssertTrue(viewModel.showAlert)
        XCTAssertEqual(viewModel.clientsList.count, 2)
        
    }
    
    func testAddClientOk() {
        
        let bundle = Bundle(for: type(of: self))
        let sourceJson = "SourceTest.json"
        
        let viewModel = RelayanceViewModel(sourceJson: sourceJson, bundle: bundle)
        XCTAssertEqual(viewModel.clientsList.count, 2)
        
        let nomClient: String = "Bruno"
        let mailClient: String = "bruno@test.fr"
        
        viewModel.addClient(nom: nomClient, email: mailClient)
        
        XCTAssertFalse(viewModel.showAlert)
        XCTAssertEqual(viewModel.clientsList.count, 3)
        
    }
        
}
