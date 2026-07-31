//
//  homepage.swift
//  MoneyManager
//
//  Created by CDMI on 14/03/26.
//

import SwiftUI

struct HomePage: View {
//    @State private var totleAmmount : Double = 0
//    @State private var plusAmmount : Double = 0
//    @State private var minusAmmount : Double = 0
    @State private var selectedTab = 0
    @State private var goPage = false
    let db = DatabaseHelper()
    @State var list : [TransectionModel] = []
    var body: some View {
        ScrollView{
            VStack{
                HStack{
                    Text("Home")
                        .bold()
                        .font(.system(size: 35))
                        .padding(.leading)
                    Spacer()
                }
                HStack{
                    Text(Date().formatted(.dateTime.month(.wide).day().year()))
                        .font(.system(size: 20))
                        .padding(.leading)
                    Spacer()
                }
                Rectangle()
//                    .fill(.white)
                    .fill(Color(.systemBackground))
                    .frame(width: 400 , height: 200)
                    .cornerRadius(20)
                    .overlay{
                        VStack{
                            HStack{
                                VStack{
                                    HStack{
                                        Text("This Month")
                                            .bold()
                                            .font(.system(size: 20))
                                            .padding([.top, .leading] , 20)
                                        Spacer()
                                        
                                    }
                                    HStack{
                                        Text(String(format: "₹ %.2f", plusammount()-minusammount()))
                                            .foregroundColor(Color(red: 0.312, green: 0.43, blue: 0.917))
                                            .font(.system(size: 40) .weight(.black))
                                            .padding(.leading , 20)
                                            .padding(.top, 10.0)
                                        Spacer()
                                    }
                                    Spacer()
                                }
                                Button(action:{
                                    
                                }){
                                    Image(systemName: "calendar")
                                        .font(.system(size: 30))
                                        .foregroundColor(Color(.systemBackground))
//                                        .fill(Color(.systemBackground))
                                        .frame(width: 60, height: 60)
                                        .background(Color.blue)
                                        .cornerRadius(14)
                                }
                                .padding()
                                .padding(.bottom)
                                
                            }
                            HStack(spacing: 10) {
                                
                                Button(action: {
                                }) {
                                    HStack {
                                        Image(systemName: "arrow.up.circle.fill")
                                        Text(String(format: "+ %.2f", plusammount()))
                                            .fontWeight(.semibold)
                                        Spacer()
                                    }
                                    .foregroundColor(.green)
                                    .frame(width:150 , height: 15)
                                    .padding()
                                    .background(Color.green.opacity(0.25))
                                    .cornerRadius(10)
                                }
                                
                                Button(action: {
                                }) {
                                    HStack {
                                        Image(systemName: "arrow.down.circle.fill")
                                        Text(String(format: " %.2f", minusammount()))
                                            .fontWeight(.semibold)
                                        Spacer()
                                    }
                                    .foregroundColor(.red)
                                    .frame(width:150 , height:15)
                                    .padding()
                                    .background(Color.red.opacity(0.25))
                                    .cornerRadius(10)
                                }
                            }
                            .padding(.bottom, 20)
                            .padding(.horizontal, 10)
                        }
                    }
                    .onAppear {
                         list = db.fetchUser()
                     }
                
                
                
                
                
                
                
                
                
                
                Spacer()
                
            }
        }
        
    }
    func plusammount() -> Double {
        var total: Double = 0
        for user in list {
            if user.type == 1 {
                total += Double(user.ammount)
            }
        }
        
        return total
    }
    func minusammount() -> Double {
        var total: Double = 0
        for user in list {
            if user.type == 2 {
                total -= Double(user.ammount)
            }
        }
        
        return total
    }
}

#Preview {
    HomePage()
}
