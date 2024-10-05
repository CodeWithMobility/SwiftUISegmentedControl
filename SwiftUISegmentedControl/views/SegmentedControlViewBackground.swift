//
//  SegmentedControlViewBackground.swift
//  SwiftUISegmentedControl
//
//  Created by Manu Aravind on 04/10/24.
//

import SwiftUI

struct SegmentedControlViewBackground: ViewModifier {
    
    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    // The size of padding
    let padding: CGFloat
    
    // # Body
    func body(content: Content) -> some View {
        
        content
            .opacity(0.4)
            .cornerRadius(20)
            .padding(padding)
    }
}
