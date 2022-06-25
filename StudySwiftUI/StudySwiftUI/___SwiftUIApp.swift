//___FILEHEADER___

import SwiftUI



@main
struct SwiftUIDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL {
                    print("交互 = \($0)")
                }
        }
    }
}
