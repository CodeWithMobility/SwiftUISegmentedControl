//
//  CustomSegmentedControl.swift
//  SwiftUISegmentedControl
//
//  Created by Manu Aravind on 04/10/24.
//

import SwiftUI

/// Creates a `CustomSegmentedControl` that shows the `segmentLabels`.
struct CustomSegmentedControl: View {
    
    // MARK: Properties
    @Binding public var selection: Int
    private let size: CGSize
    private let segmentLabels: [String]
    private let segmentPadding: CGFloat = 3
    
    var body: some View {
        ZStack(alignment: .leading) {
            
            // Background shape
            RoundedRectangle(cornerRadius: 10)
                .frame(width: size.width, height: size.height)
                .foregroundColor(.gray.opacity(0.2))
            
            // Dividers
            HStack(spacing: 0) {
                ForEach(segmentLabels.indices, id: \.self) { idx in
                    if idx < segmentLabels.count - 1 {
                        customDivider(offset: (segmentWidth(size) - 0.5) * CGFloat(idx + 1), opacity: idx == selection - 1 || idx == selection ? 0.0 : 1.0)
                    }
                }
            }
            .animation(.easeOut(duration: 0.8), value: selection)
            
            // Selection background
            RoundedRectangle(cornerRadius: 10)
                .frame(width: segmentWidth(size) - (segmentPadding * 2), height: size.height - (segmentPadding * 2))
                .foregroundColor(.black)
                .offset(x: calculateSegmentOffset(size) + segmentPadding)
                .animation(.easeInOut(duration: 0.5), value: selection)
            
            // Labels
            HStack(spacing: 0) {
                ForEach(segmentLabels.indices, id: \.self) { idx in
                    SegmentLabel(title: segmentLabels[idx], width: segmentWidth(size), textColor: selection == idx ? .white : .black)
                        .onTapGesture {
                            selection = idx
                        }
                }
            }
        }
    }
    
    // MARK: Initializer
    public init(selection: Binding<Int>, size: CGSize, segmentLabels: [String]) {
        self._selection = selection
        self.size = size
        self.segmentLabels = segmentLabels
    }
    
    // MARK: Private Methods
    private func segmentWidth(_ mainSize: CGSize) -> CGFloat {
        max(mainSize.width / CGFloat(segmentLabels.count), 0)
    }
    
    private func calculateSegmentOffset(_ mainSize: CGSize) -> CGFloat {
        segmentWidth(mainSize) * CGFloat(selection)
    }
    
    private func customDivider(offset: CGFloat, opacity: Double) -> some View {
        Divider()
            .frame(height: size.height * 0.5)
            .offset(x: offset)
            .opacity(opacity)
    }
}

// MARK: - Subviews
fileprivate struct SegmentLabel: View {
    
    let title: String
    let width: CGFloat
    let textColor: Color
    
    var body: some View {
        Text(title)
            .multilineTextAlignment(.center)
            .frame(width: width)
            .foregroundColor(textColor)
            .contentShape(Rectangle()) // Makes the entire segment tappable
    }
}

// MARK: - Previews
struct CustomSegmentedControl_Previews: PreviewProvider {
    static var previews: some View {
        CustomSegmentedControl(selection: .constant(0), size: CGSize(width: UIScreen.main.bounds.width, height: 48), segmentLabels: ["One", "Two", "Three", "Four"])
    }
}

