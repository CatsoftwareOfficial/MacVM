//
//  VirtualMachineDashboardAppApp.swift
//  VirtualMachineDashboardApp
//
//  Created by Léopold Schaffhauser on 29/07/2023.
//

import SwiftUI

@main
struct VirtualMachineDashboardApp: App {
    @StateObject private var vmManager = VmManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vmManager)
        }
    }
}

