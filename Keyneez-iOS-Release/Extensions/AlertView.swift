//
//  AlertView.swift
//  Keyneez-iOS-Release
//
//  Created by Jung peter on 7/1/23.
//

import SwiftUI

struct LocalizedAlertError: LocalizedError {
    let underlyingError: LocalizedError
    var errorDescription: String? {
        underlyingError.errorDescription
    }
    var recoverySuggestion: String? {
        underlyingError.recoverySuggestion
    }

    init?(error: Error?) {
        guard let localizedError = error as? LocalizedError else { return nil }
        underlyingError = localizedError
    }
}

extension View {
  func errorAlert(error: Binding<Error?>, buttonTitle: String = "OK", completion: (()->Void)? = nil ) -> some View {
        let localizedAlertError = LocalizedAlertError(error: error.wrappedValue)
        return alert(isPresented: .constant(localizedAlertError != nil), error: localizedAlertError) { _ in
            Button(buttonTitle) {
              error.wrappedValue = nil
              completion?()
            }
        } message: { error in
            Text(error.recoverySuggestion ?? "")
        }
    }
}
