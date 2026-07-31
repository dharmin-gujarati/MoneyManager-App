//
//  settingspage.swift
//  MoneyManager
//
//  Created by CDMI on 14/03/26.
//

import SwiftUI

struct SettingsPage: View {
    @AppStorage("isDarkMode") var isDarkMode: Bool = false
    var body: some View {
        
        ScrollView{
            VStack{
                HStack{
                    Text("Setting")
                        .bold()
                        .font(.system(size: 35))
                        .padding([.top, .leading])
                    Spacer()
                }
                Rectangle()
//                    .fill(.white)
                    .fill(Color(.systemBackground))
                    .frame(width: 410 , height: 100)
                    .cornerRadius(20)
                    .overlay{
                        HStack{
                            Image(systemName: "person.circle.fill")
                                .font(.system(size: 60))
                                .foregroundColor(.blue)
                                .padding(.leading, 10)
                            VStack(alignment: .leading){
                                Text("Guest")
                                    .font(.system(size: 20))
                                    .bold()
                                Text("version: Free")
                                    .font(.system(size: 15))
                            }
                            Spacer()
                            Button(action:{
                                
                            }) {
                                Text("Login")
                                    .font(.system(size: 18))
                                    .bold()
                            }
                            .padding()
                        }
                    }
                Rectangle()
//                    .fill(.white)
                    .fill(Color(.systemBackground))
                    .frame(width: 410 , height: 70)
                    .cornerRadius(20)
                    .overlay{
                        HStack{
                            Image("premiumlogo")
                                .resizable()
                                .frame(width: 45 , height: 50)
                                .padding()
                            Text("Buy premium")
                                .bold()
                                .foregroundColor(Color(red: 0.985, green: 0.593, blue: 0.291))
                                .font(.system(size: 25))
                            Spacer()
                        }
                    }
                Rectangle()
//                    .fill(.white)
                    .fill(Color(.systemBackground))
                    .frame(width: 410 , height: 250)
                    .cornerRadius(20)
                    .overlay{
                        VStack(spacing:5){
                            Button(action:{
                                
                            }) {
                                HStack{
                                    Image(systemName: "arrow.triangle.2.circlepath")
                                        .font(.system(size: 25))
                                        .foregroundColor(Color(red: 0.373, green: 0.373, blue: 0.373))
                                    Text("Backup & Restor")
                                        .foregroundColor(Color(red: 0.373, green: 0.373, blue: 0.373))
                                    
                                    Spacer()
                                }
                            }
                            .frame(width:350 , height: 15)
                            .padding()
                            .background(Color(.systemBackground))
//                            .fill(Color(.systemBackground))
                            .cornerRadius(10)
                            Divider()
                                .frame(width: 340)
                            Button(action:{
                                
                            }) {
                                HStack{
                                    Image(systemName: "x.square.fill")
                                        .font(.system(size: 30))
                                        .foregroundColor(Color(red: 0.373, green: 0.373, blue: 0.373))
                                    Text("Export To Excel")
                                        .foregroundColor(Color(red: 0.373, green: 0.373, blue: 0.373))
                                    Spacer()
                                }
                            }
                            .frame(width:350 , height: 15)
                            .padding()
                            .background(Color(.systemBackground))
                            .cornerRadius(10)
                            Divider()
                                .frame(width: 340)
                            Button(action:{
                                
                            }) {
                                HStack{
                                    Image(systemName: "square.fill")
                                        .font(.system(size: 30))
                                        .foregroundColor(Color(red: 0.373, green: 0.373, blue: 0.373))
                                        .overlay{
                                            Text("PDF")
                                                .foregroundColor(Color(.systemBackground))
                                                .bold()
                                                .font(.system(size: 12))
                                        }
                                    Text("Backup & Restor")
                                        .foregroundColor(Color(red: 0.373, green: 0.373, blue: 0.373))
                                    Spacer()
                                }
                            }
                            .frame(width:350 , height: 15)
                            .padding()
                            .background(Color(.systemBackground))
                            .cornerRadius(10)
                            Divider()
                                .frame(width: 340)
                            Button(action:{
                                
                            }) {
                                HStack{
                                    Image(systemName: "arrow.triangle.2.circlepath")
                                        .font(.system(size: 25))
                                        .foregroundColor(Color(red: 0.373, green: 0.373, blue: 0.373))
                                    Text("Backup & Restor")
                                        .foregroundColor(Color(red: 0.373, green: 0.373, blue: 0.373))
                                    Spacer()
                                }
                            }
                            .frame(width:350 , height: 15)
                            .padding()
                            .background(Color(.systemBackground))
                            .cornerRadius(10)
                        }
                    }
                HStack{
                    Text("Categoris")
                        .bold()
                        .font(.system(size: 35))
                        .padding([.top, .leading])
                    Spacer()
                }
                Rectangle()
                    .fill(Color(.systemBackground))
                    .frame(width: 410 , height: 130)
                    .cornerRadius(20)
                    .overlay{
                        VStack(spacing : 5){
                            Button(action:{
                                
                            }) {
                                
                                
                                Text("income categories")
                                    .foregroundColor(Color(red: 0.373, green: 0.373, blue: 0.373))
                                Spacer()
                                
                            }
                            .frame(width:350 , height: 15)
                            .padding()
                            .background(Color(.systemBackground))
                            .cornerRadius(10)
                            Divider()
                                .frame(width: 340)
                            Button(action:{
                                
                            }) {
                                
                                Text("Expanse categaries")
                                    .foregroundColor(Color(red: 0.373, green: 0.373, blue: 0.373))
                                Spacer()
                                
                            }
                            .frame(width:350 , height: 15)
                            .padding()
                            .background(Color(.systemBackground))
                            .cornerRadius(10)
                            
                        }
                    }
                HStack{
                    Text("Advance Settings")
                        .bold()
                        .font(.system(size: 35))
                        .padding([.top, .leading])
                    Spacer()
                }
                Rectangle()
                    .fill(Color(.systemBackground))
                    .frame(width: 410 , height: 500)
                    .cornerRadius(20)
                    .overlay{
                        VStack(spacing : 5){
                            Toggle("Dark Mode", isOn: $isDarkMode)
                                .frame(width:350 , height: 40)
                                .background(Color(.systemBackground))
                                .cornerRadius(8)
                            Divider()
                                .frame(width: 340)
                            Button(action:{
                                
                            }) {
                                Text("Change Currency ($)")
                                    .foregroundColor(Color(red: 0.373, green: 0.373, blue: 0.373))
                                Spacer()
                                
                            }
                            .frame(width:350 , height: 10)
                            .padding()
                            .background(Color(.systemBackground))
                            .cornerRadius(10)
                            Divider()
                                .frame(width: 340)
                            Button(action:{
                                
                            }) {
                                Text("Decimal Points")
                                    .foregroundColor(Color(red: 0.373, green: 0.373, blue: 0.373))
                                Spacer()
                                
                            }
                            .frame(width:350 , height: 10)
                            .padding()
                            .background(Color(.systemBackground))
                            .cornerRadius(10)
                            Divider()
                                .frame(width: 340)
                            Button(action:{
                                
                            }) {
                                Text("Refresh My Data")
                                    .foregroundColor(Color(red: 0.373, green: 0.373, blue: 0.373))
                                Spacer()
                                
                            }
                            .frame(width:350 , height: 10)
                            .padding()
                            .background(Color(.systemBackground))
                            .cornerRadius(10)
                            Divider()
                                .frame(width: 340)
                            Spacer()
                            Button(action:{
                                
                            }) {
                                Text("Contect Us")
                                    .foregroundColor(Color(red: 0.373, green: 0.373, blue: 0.373))
                                Spacer()
                                
                            }
                            .frame(width:350 , height: 10)
                            .padding()
                            .background(Color(.systemBackground))
                            .cornerRadius(10)
                            Divider()
                                .frame(width: 340)
                            Button(action:{
                                
                            }) {
                                Text("More Apps From Us")
                                    .foregroundColor(Color(red: 0.373, green: 0.373, blue: 0.373))
                                Spacer()
                                
                            }
                            .frame(width:350 , height: 10)
                            .padding()
                            .background(Color(.systemBackground))
                            .cornerRadius(10)
                            Divider()
                                .frame(width: 340)
                            Button(action:{
                                
                            }) {
                                Text("Privacy Policy")
                                    .foregroundColor(Color(red: 0.373, green: 0.373, blue: 0.373))
                                Spacer()
                                
                            }
                            .frame(width:350 , height: 10)
                            .padding()
                            .background(Color(.systemBackground))
                            .cornerRadius(10)
                            Divider()
                                .frame(width: 340)
                            Button(action:{
                                
                            }) {
                                Text("Terms & Conditions")
                                    .foregroundColor(Color(red: 0.373, green: 0.373, blue: 0.373))
                                Spacer()
                                
                            }
                            .frame(width:350 , height: 10)
                            .padding()
                            .background(Color(.systemBackground))
                            .cornerRadius(10)
                            Divider()
                                .frame(width: 340)
                            Button(action:{
                                
                            }) {
                                Text("Invite Frinds")
                                    .foregroundColor(Color(red: 0.373, green: 0.373, blue: 0.373))
                                Spacer()
                                
                            }
                            .frame(width:350 , height: 10)
                            .padding()
                            .background(Color(.systemBackground))
                            .cornerRadius(10)
                            
                        }
                        .padding(.vertical, 8)
                    }
                VStack(alignment: .center){
                    Text("App Virsion Code")
                        .foregroundColor(.gray)
                    Text("1.9")
                        .foregroundColor(.gray)
                    Text("flivion")
                        .padding(.vertical, 20.0)
                }
                Spacer()
            }
            
            
        }
        
    }
}

#Preview {
    SettingsPage()
}
