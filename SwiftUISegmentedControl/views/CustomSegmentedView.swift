//
//  CustomSegmentedView.swift
//  SwiftUISegmentedControl
//
//  Created by Manu Aravind on 04/10/24.
//

import SwiftUI

struct CustomSegmentedView: View {
    
    @Binding var currentIndex: Int
    var selections: [String]
    
    
    init(_ currentIndex: Binding<Int>, selections: [String]) {
        self._currentIndex = currentIndex
        self.selections = selections
        UISegmentedControl.appearance().selectedSegmentTintColor = .orange
        UISegmentedControl.appearance().backgroundColor =
        UIColor(Color.orange.opacity(0.3))
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(Color.primary)], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(Color.secondary)], for: .normal)
    }
    
    var body: some View {
        VStack {
            Picker("", selection: $currentIndex) {
                ForEach(selections.indices, id: \.self) { index in
                    Text(selections[index])
                        .tag(index)
                        .foregroundColor(Color.blue)
                }
            }
            .pickerStyle(.segmented)
            .tint(.orange)
        }
        .padding()
    }
}

