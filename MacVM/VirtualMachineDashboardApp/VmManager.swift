//
//  VmManager.swift
//  VirtualMachineDashboardApp
//
//  Created by Léopold Schaffhauser on 29/07/2023.
//

import Foundation

class VM: Identifiable, ObservableObject {
    let id = UUID()
    @Published var name: String
    @Published var isRunning: Bool

    init(name: String, isRunning: Bool = false) {
        self.name = name
        self.isRunning = isRunning
    }

    func start() {
        // Simulate starting the virtual machine.
        isRunning = true
    }

    func stop() {
        // Simulate stopping the virtual machine.
        isRunning = false
    }
}



class VmManager: ObservableObject {
    @Published var virtualMachines: [VM]

    init() {
        // Create some sample virtual machines
        virtualMachines = [
            VM(name: "MacVM"),
            VM(name: "SimpleVM"),
            VM(name: "virtualOS"),
           
        ]
    }
}


