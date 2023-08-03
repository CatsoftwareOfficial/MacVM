//
//  ContentView.swift
//  VirtualMachineDashboardApp
//
//  Created by Léopold Schaffhauser on 29/07/2023.
//

import SwiftUI

struct DashboardView: View {
    @State private var isPresentingVMView = false
    @EnvironmentObject private var vmManager: VmManager
    @ObservedObject var document: VMDocument
    var fileURL: URL?

    var body: some View {
        NavigationView {
            ScrollView {
                Text("Recent")
                    .bold()
                    .font(.system(size: 20))
                   
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                    ForEach(vmManager.virtualMachines) { vm in
                        VMGridView(vm: vm)
                            .padding()
                            .onTapGesture {
                                if !vm.isRunning {
                                 vm.start()
                            } else {
                         // Simulate opening the virtual machine.
                        // Replace this with the actual code to open the VM.
                                
                                 vm.stop()
                                                                }
                                }
                            }
                    }
                }
            NavigationLink("New MacVM", destination: VMInstallView(
                fileURL: fileURL,
                document: document,
                state: document.vmInstallationState
            ))
            
            Button("Don't click here") {
                                isPresentingVMView = true
                            }
            
        
            
            
            }
            .navigationTitle("Virtual Machines")
            .frame(width: 1000, height: 600)
            .sheet(isPresented: $isPresentingVMView) {
                VMView(document: document, fileURL: fileURL)
                                    
                            }
        }
        

   
    
    }



/*func openDashboard() {
    let vmManager = VmManager()
    var document: VMDocument
    var fileURL: URL?
    let Dashboard = NSWindow(
        contentRect: NSRect(x: 0, y: 0, width: 300, height: 200),
        styleMask: [.titled, .closable, .resizable],
        backing: .buffered,
        defer: false
    )
    Dashboard.center()
    Dashboard.setFrameAutosaveName("Dashboard")
    Dashboard.contentViewController = NSHostingController(rootView: ContentView().environmentObject(vmManager) )
    Dashboard.makeKeyAndOrderFront(nil)
} */



    


struct VMGridView: View {
    @ObservedObject var vm: VM

    var body: some View {
        VStack {
            Text(vm.name)
                .font(.headline)
            Image(systemName: vm.isRunning ? "lock.open.desktopcomputer" : "lock.desktopcomputer")
                .font(.system(size: 50))
                .foregroundColor(vm.isRunning ? .green : .red)
                .padding(25)
        }
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}
