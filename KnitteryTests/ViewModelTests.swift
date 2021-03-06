//
//  ViewModelTests.swift
//  KnitteryTests
//
//  Created by Cecilia Valenti on 2021-03-06.
//  Copyright © 2021 Cecilia Valenti. All rights reserved.
//

import XCTest
@testable import Knittery

class ViewModelTests: XCTestCase {

    func testFavoritesViewModel() {
        
        let vm = FavoritesViewModel()
        XCTAssertEqual(vm.currentState.description(), "idle")
        vm.handle(.onAppear(CurrentUser()))
        XCTAssertEqual(vm.currentState.description(), "loading")
    }
    
    func testListItemViewModel() {
        
        let vm = ListItemViewModel(currentUser: CurrentUser(),
                                   item: MockData.pattern)
        XCTAssertEqual(vm.currentState.description(), "idle")
        vm.handle(.onAppear)
        XCTAssertEqual(vm.currentState.description(), "loaded")
        
    }
    
    func testPatternDetailViewModel() {
        
        let vm = PatternDetailViewModel(patternId: 123,
                                        currentUser: CurrentUser())
        XCTAssertEqual(vm.currentState.description(), "idle")
        vm.handle(.onAppear)
        XCTAssertEqual(vm.currentState.description(), "loaded")
    }
}
