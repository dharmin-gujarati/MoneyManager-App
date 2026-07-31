//
//  ContentView.swift
//  MoneyManager
//
//  Created by CDMI on 13/03/26.
//

import SwiftUI

struct ContentView: View {
    @State private var totleAmmount : Float = 0
    @State private var plusAmmount : Float = 0
    @State private var minusAmmount : Float = 0
    @State private var selectedTab = 0
    @State private var goAdd = false
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        
        NavigationStack{
            Rectangle()
                .fill(colorScheme == .dark ? Color(red: 0.1, green: 0.1, blue: 0.1) : Color(red: 0.906, green: 0.937, blue: 0.988))
                .ignoresSafeArea()
                .overlay {
                    
                    VStack{
                        
                        if selectedTab == 0 {
                            HomePage()
                        }
                        else if selectedTab == 1 {
                            Text("Statistic")
                        }
                        else {
                            SettingsPage()
                        }
                        
                        if selectedTab == 0{
                            HStack{
                                Button(action:{
                                    goAdd = true
                                }){
                                    Image(systemName: "plus")
                                        .font(.system(size: 25))
                                        .foregroundColor(.white)
                                        .frame(width: 60, height: 60)
                                        .background(Color.blue)
                                        .cornerRadius(14)
                                }
                                .padding(.leading, 345)
                                .padding(.bottom , 10)
                            }
                        }
                        
                        ZStack{
                            HStack {
                                tabButton(icon: "house.fill", title: "HOME", index: 0)
                                
                                Spacer()
                                
                                tabButton(icon: "square.grid.2x2", title: "STATISTICS", index: 1)
                                
                                Spacer()
                                
                                tabButton(icon: "gearshape", title: "SETTINGS", index: 2)
                            }
                            .padding(.horizontal, 40)
                            .padding(.vertical, 12)
                            .background(Color(.systemGroupedBackground))
                            .shadow(radius: 10)
                        }
                        .padding(.bottom, 1)
                    }
                    
                }
                .navigationDestination(isPresented: $goAdd) {
                    AddTransectionFill()
                }
        }
        
    }
    func tabButton(icon: String, title: String, index: Int) -> some View {
        Button(action: {
            selectedTab = index
        }) {
            VStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.system(size: 24))
                    .foregroundColor(selectedTab == index ? .blue : .gray)
                
                Text(title)
                    .font(.caption)
                    .foregroundColor(selectedTab == index ? .blue : .gray)
            }
        }
    }
    
}

#Preview {
    ContentView()
}
