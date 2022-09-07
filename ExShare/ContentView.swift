//
//  ContentView.swift
//  ExShare
//
//  Created by 김종권 on 2022/09/07.
//

import SwiftUI

struct ContentView: View {
  @State var isSharePresented = false
  let image = UIImage(systemName: "star")
  
  var body: some View {
    Button("공유하기") {
      self.isSharePresented = true
    }
    .sheet(
      isPresented: $isSharePresented,
      onDismiss: { print("Dismiss") },
      content: { ActivityViewController(activityItems: [image]) }
    )
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

import Foundation
import SwiftUI
import UIKit

struct ActivityViewController: UIViewControllerRepresentable {
  var activityItems: [Any]
  var applicationActivities: [UIActivity]? = nil
  @Environment(\.presentationMode) var presentationMode
  
  func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityViewController>
  ) -> UIActivityViewController {
    let controller = UIActivityViewController(
      activityItems: activityItems,
      applicationActivities: applicationActivities
    )
    controller.completionWithItemsHandler = { (activityType, completed, returnedItems, error) in
      self.presentationMode.wrappedValue.dismiss()
    }
    return controller
  }
  
  func updateUIViewController(
    _ uiViewController: UIActivityViewController,
    context: UIViewControllerRepresentableContext<ActivityViewController>
  ) {}
}
