//
//  ViewModel.swift
//  Knittery
//
//  Created by Cecilia Valenti on 2021-02-07.
//  Copyright © 2021 Cecilia Valenti. All rights reserved.
//

import Foundation

public protocol ViewModel: ObservableObject {
    associatedtype Action
}
