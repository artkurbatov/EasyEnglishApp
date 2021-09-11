//
//  ProgressBarView.swift
//  EasyEnglish
//
//  Created by Kurbatov Artem on 04.09.2021.
//

import SwiftUI

struct ProgressBarView: View {
    
    var progress: Float
    var lineWidth: Float
    
    var color: Color {
        if progress < 0.5 {
            return .red
        }
        else if progress < 0.75 {
            return .yellow
        }
        else {
            return .green
        }
    }
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: CGFloat(lineWidth))
                .opacity(0.3)
                .foregroundColor(.gray)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: CGFloat(lineWidth), lineCap: .round, lineJoin: .round))
                .foregroundColor(color)
                .rotationEffect(Angle(degrees: 270.0))
        }
    }
}
