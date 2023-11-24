//
//  FaqsView.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 23/11/23.
//

import SwiftUI

struct FaqsView: View {

    @State private var AllFaqs = FaqsArray.questions

    var body: some View {
        ScrollView {
            ForEach(Array(FaqsArray.questions.enumerated()), id: \.element) { index, faq in
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text(faq.question)
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        Button {
                            withAnimation {
                                AllFaqs[index].isShowingAnser.toggle()
                            }
                        } label: {
                            Image(systemName: buttonImage(if: AllFaqs[index].isShowingAnser))
                        }
                    }

                    Text(faq.answer)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                        .isHidden(AllFaqs[index].isShowingAnser)
                }
                .padding()
                .background(Color.cardColor)
                .clipShape(RoundedRectangle(cornerRadius: 4))
                .padding(.horizontal)
                .padding(.top, 5)
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
