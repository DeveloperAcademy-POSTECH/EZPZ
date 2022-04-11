//
//  CustomDividerView.swift
//  Journal
//
//  Created by Hyunjae on 4/7/22.
//

import SwiftUI

struct CustomDividerView: View {
    
    var body: some View {
        Rectangle()
            .foregroundColor(Color("ezpzSmokegrey"))
            .opacity(0.3)
            .frame(height: 1)
            .edgesIgnoringSafeArea(.horizontal)
            .padding(.bottom, 5)
    }
}
