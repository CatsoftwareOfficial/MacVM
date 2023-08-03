//
//  MacVMApp.swift
//  MacVM
//
//  Created by Khaos Tian on 6/28/21.
//

import SwiftUI

@main
struct MacVMApp: App {
    @StateObject private var vmManager = VmManager()
     
    var body: some Scene {
        DocumentGroup {
            VMDocument()
        } editor: { configuration in
            DashboardView(
                 document: configuration.document,
                fileURL: configuration.fileURL
            ).environmentObject(vmManager)
        }
      /*  .commands {
                   // Define commands for the primary window menu
            CommandGroup(replacing: .windowList) {
                       Button("Dashboard") {
                           openDashboard()
                               
                       }
                       
                   }
            
               }*/
        
        
        

            }
            
        }
    

