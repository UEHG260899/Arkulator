//
//  FaqsView.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 23/11/23.
//

import SwiftUI

struct FaqsView: View {

    @State private var allFAQS = FAQSArray.questions

    var body: some View {
        ScrollView {
            ForEach($allFAQS, id: \.self) { $faq in
                FAQCell(faq: $faq)
            }
        }
        .navigationBarBackButtonHidden()
        .navigationTitle("FAQ´s")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                CustomBackButton()
            }
        }
    }

    private func buttonImage(if isShowingAnswer: Bool) -> String {
        isShowingAnswer ? "minus" : "plus"
    }
}

#Preview {
    NavigationView {
        FaqsView()
    }
}
