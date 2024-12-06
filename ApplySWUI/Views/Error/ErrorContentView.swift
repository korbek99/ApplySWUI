//
//  ErrorContentView.swift
//  ApplySWUI
//
//  Created by Jose Preatorian on 05-12-24.
//

import Foundation
import SwiftUI

struct ErrorContentView: View {
    var errorMessage: String

    var body: some View {
        VStack {
            Spacer()
            Text(errorMessage)
                .font(.system(size: 20, weight: .regular))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
            Spacer()
        }
        .navigationTitle("")
        .background(Color.white)
    }
}

struct ErrorContentView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorContentView(errorMessage: NSLocalizedString("ERROR_TITLE", comment: "error message"))
    }
}
