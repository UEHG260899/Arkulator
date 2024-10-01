//
//  FAQCell.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 11/12/23.
//

import SwiftUI

struct FAQCell: View {

    @Binding var faq: FAQ

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(faq.question)
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity, alignment: .leading)

                Button {
                    withAnimation {
                        faq.isShowingAnswer.toggle()
                    }
                } label: {
                    Image(systemName: buttonImage)
                }
            }

            Text(faq.answer)
                .font(.subheadline)
                .multilineTextAlignment(.leading)
                .isShowing(if: faq.isShowingAnswer)
        }
        .padding()
        .background(Color.cardColor)
        .clipShape(RoundedRectangle(cornerRadius: 4))
        .padding(.horizontal)
        .padding(.top, 5)
    }

    var buttonImage: String {
        faq.isShowingAnswer ? "chevron.down" : "chevron.right"
    }
}

#Preview {
    FAQCell(faq: .constant(.init(question: "", answer: "")))
}
