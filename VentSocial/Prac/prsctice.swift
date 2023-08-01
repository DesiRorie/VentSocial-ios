//
//  prsctice.swift
//  VentSocial
//
//  Created by Desi Rorie on 7/31/23.
//

import SwiftUI
protocol Person {
    var name:String {get}
    var age: Int {get}
}
struct Desi:Person {
    var name: String = "Desi"
    
    var age: Int = 24
    
    
}
struct prsctice: View {
    let desi:Person = Desi()
    var body: some View {
        VStack{
            Text("\(desi.name) \(desi.age)")
        }
        
    }
}

struct prsctice_Previews: PreviewProvider {
    let desi:Person = Desi()
    static var previews: some View {
        prsctice()
    }
}
