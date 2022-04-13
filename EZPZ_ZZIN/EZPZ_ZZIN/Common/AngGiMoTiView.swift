//
//  AngGiMoTiView.swift
//  EZPZ_ZZIN
//
//  Created by Ruyha on 2022/04/13.
//

import SwiftUI

struct AngGiMoTiView: View {
    var body: some View {
        NavigationView {
            HStack{
                Text("아이콘 눌러서 이동 ㅋㅋ")
                NavigationLink(
                    destination: CommonView(),
                    label: {
                        Image(systemName: "person.fill")
                            .foregroundColor(.red)
                    })

            }
            .navigationBarHidden(true)
            
            
        }
      
    }
}



struct AngGiMoTiView_Previews: PreviewProvider {
    static var previews: some View {
        AngGiMoTiView()
    }
}
