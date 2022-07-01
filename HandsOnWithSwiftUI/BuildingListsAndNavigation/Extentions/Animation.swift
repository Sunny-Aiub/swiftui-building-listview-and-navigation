//
//  Animation.swift
//  HandsOnWithSwiftUI
//
//  Created by MACBOOK Pro - WSIT on 7/1/22.
//

import Foundation
import SwiftUI


extension Animation {

    static func ripple() -> Animation {

        Animation.spring(dampingFraction: 0.5)
            .speed(2)
    }

}

