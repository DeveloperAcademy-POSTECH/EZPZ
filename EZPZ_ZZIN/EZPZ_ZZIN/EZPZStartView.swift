//
//  EZPZStartView.swift
//  EZPZ_ZZIN
//
//  Created by Ruyha on 2022/04/13.
//

import SwiftUI

struct EZPZStartView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \UserEntity.timestamp, ascending: true)])
    private var user: FetchedResults<UserEntity>
       
    
    var body: some View {
//        Text("Hello, World!")
        
        if  user.count <= 0 {
            OnBoardingView()
            let _ = EZPZManager.shared.firstCheck = true
        }else{
            
            
            if EZPZManager.shared.firstCheck {
                TabBarMainView(tabbarIndex: 1)
            }else{
                TabBarMainView(tabbarIndex: 0)
            }
          
        }
        
        
    }
}

struct EZPZStartView_Previews: PreviewProvider {
    static var previews: some View {
        EZPZStartView()
    }
}
