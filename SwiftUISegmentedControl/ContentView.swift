//
//  ContentView.swift
//  SwiftUISegmentedControl
//
//  Created by Manu Aravind on 04/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedSegment = 0
    let segments = ["First", "Second", "Third"]
    
    @State private var selectedIndex = 0
    private var selections =  ["SwiftUI", "iOS", "UIKit", "Swift", "ML"]
    
    @State private var segmentSelection: Int = 0
    
    @State private var selectedIndex1 = 0
    @State private var selectedIndex2 = 0
    @State private var selectedIndex3 = 0
    
    let options1: [SegmentControlItem] = [
        SegmentControlItem(name: "Car"),
        SegmentControlItem(name: "Bike")
    ]
    
    let options2: [SegmentControlItem] = [
        SegmentControlItem(name: "Car", iconString: "car.fill"),
        SegmentControlItem(name: "Bike", iconString: "bicycle"),
        SegmentControlItem(name: "Bus", iconString: "bus"),
    ]
    
    let options3: [SegmentControlItem] = [
        SegmentControlItem(iconString: "car.fill"),
        SegmentControlItem(iconString: "bicycle"),
        SegmentControlItem(iconString: "bus"),
        SegmentControlItem(iconString: "airplane"),
    ]
    
    
    // The padding value used for the view
    private var mainPadding: CGFloat = 20
    
    var body: some View {
        VStack {
            Picker("Segments", selection: $selectedSegment) {
                ForEach(segments.indices, id: \.self) { index in
                    Text(self.segments[index]).tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle()) // Apply the segmented style
            .padding()
            
            Text("Selected segment: \(segments[selectedSegment])")
                .padding()
            
            HStack {
                ForEach(segments.indices, id: \.self) { index in
                    Button(action: {
                        selectedSegment = index
                    }) {
                        Text(segments[index])
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(selectedSegment == index ? Color.blue : Color.gray.opacity(0.2))
                            .foregroundColor(selectedSegment == index ? .white : .black)
                            .cornerRadius(8)
                    }
                }
            }
            .padding()
            
            Text("Selected segment: \(segments[selectedSegment])")
                .padding()
            
            CustomSegmentedView($selectedIndex, selections: selections)
            Text("Selected: \(selections[selectedIndex])")
            
            
            CustomSegmentedControl(selection: $segmentSelection, size: CGSize(width: UIScreen.main.bounds.width - (mainPadding * 2), height: 48), segmentLabels: ["One", "Two", "Three", "Four"])
                .padding(.top, mainPadding)
            
            // Spacer()
            
            if segmentSelection == 0 {
                
                ZStack {
                    
                    Color.red
                        .modifier(SegmentedControlViewBackground(padding: mainPadding))
                    Text("View One")
                }
            } else if segmentSelection == 1 {
                
                ZStack {
                    
                    Color.green
                        .modifier(SegmentedControlViewBackground(padding: mainPadding))
                    Text("View Two")
                }
            } else if segmentSelection == 2 {
                
                ZStack {
                    
                    Color.blue
                        .modifier(SegmentedControlViewBackground(padding: mainPadding))
                    Text("View Three")
                }
            } else if segmentSelection == 3 {
                
                ZStack {
                    
                    Color.yellow
                        .modifier(SegmentedControlViewBackground(padding: mainPadding))
                    Text("View Four")
                }
            } else {
                Text("Content missing")
            }
            
            SegmentControl(
                selectedIndex: $selectedIndex1,
                options: options1
            )
            
            SegmentControl(
                selectedIndex: $selectedIndex2,
                options: options2
            )
            
            SegmentControl(
                selectedIndex: $selectedIndex3,
                options: options3
            )
        }
        .padding()
    }
}

#Preview {
    ContentView()
}



