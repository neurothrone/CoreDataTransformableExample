//
//  CircularView.swift
//  CoreDataTransformableExample
//
//  Created by Zaid Neurothrone on 2022-09-14.
//

import SwiftUI

struct CircularView: View {
  @Environment(\.colorScheme) private var colorScheme
  
  let color: Color
  
  var body: some View {
    VStack {
      Image(systemName: "eyedropper")
    }
    .padding(10)
    .background(
      colorScheme == .dark
      ? color.opacity(0.6)
      : color.opacity(0.5)
    )
    .clipShape(Circle())
  }
}

struct CircularView_Previews: PreviewProvider {
  static var previews: some View {
    CircularView(color: .purple)
      .previewLayout(.sizeThatFits)
  }
}
