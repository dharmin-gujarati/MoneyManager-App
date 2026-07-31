//
//  AddCategory.swift
//  MoneyManager
//
//  Created by CDMI on 16/03/26.
//

import SwiftUI

struct AddCategory: View {
    @Environment(\.dismiss) var dismiss
    @State private var showAddCategory = false
    @State private var showEditCategory = false
    @State var type : Int
    @State var editCategory : CategoryModel?
    @State var categorylist : [CategoryModel] = []
    let db = DatabaseHelper()
    var body: some View {
        NavigationStack{
            ZStack(){
                ScrollView {
                    VStack{
                        Divider()
                            .frame(height: 1.5)
                            .background(Color.gray)
                            .padding(.top)
                        
                        
                        HStack{
                            Text("non-categorized")
                                .bold()
                                .padding()
                                .font(.system(size: 20))
                            Spacer()
                        }
                        
                        Divider()
                        
                        ForEach(0..<categorylist.count, id: \.self) { i in
                            let user = categorylist[i]
                            HStack{
//                                if user.categorytype == type && user.maincategory != "non-categorized" {
                                    Text(user.maincategory)
                                        .bold()
                                        .padding()
                                        .font(.system(size: 20))
                                    
                                    Spacer()
                                    
                                    Button{
                                        showEditCategory = true
                                        
                                        editUser(user.categoryid, user.maincategory)
                                    } label: {
                                        Image(systemName: "pencil")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                    }
                                    .padding(.all , 5)
                                    
                                    Button{
                                        deleteUser(id: Int(user.categoryid))
                                    } label: {
                                        Image(systemName: "trash")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(.red)
                                    }
                                    .padding(.all , 5)
//                                }
                            }
                            Divider()
                        }
                    }
                    .padding(.bottom, 80)
                }
                                
                Button(action:{
                    showAddCategory = true
                }){
                    Image(systemName: "plus")
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                        .frame(width: 60, height: 60)
                        .background(Color.red)
                        .cornerRadius(14)
                }
//                .padding()
                .position(x:370 , y:770)
                
                if showAddCategory {
                    Color.black.opacity(0.4)
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation {
                                showAddCategory = false
                            }
                        }
                    
                    AddCategoryPopup(type: type,onDissmis: {
                            showAddCategory = false
                            fetchUser()
                        }
                    )
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                }
                
                if showEditCategory {
                    Color.black.opacity(0.4)
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation {
                                showEditCategory = false
                            }
                        }
                    
                    AddCategoryPopup(type: type,onDissmis: {
                            showAddCategory = false
                            fetchUser()
                    }
                    )
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                }
            }
        }
        .scrollIndicators(.hidden)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                HStack{
                    
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "arrow.left")
                            .bold()
                            .font(.system(size: 20))
                    }
                    if type == 1{
                        Text("Income Category")
                            .bold()
                            .font(.system(size: 25))
                    }else{
                        Text("Expence Category")
                            .bold()
                            .font(.system(size: 25))
                    }
                    
                }
            }
        }
        .onAppear {
             categorylist = db.fetchCategory()
         }
    }
    func deleteUser (id : Int) {
        db.deletecategory(id)
        fetchUser()
    }
    func editUser(_ id : Int64 , _ category : String) {
        db.editcategory(id , category)
        fetchUser()
    }
    func fetchUser()
    {
        self.categorylist = db.fetchCategory()
    }
    
}

#Preview {
    AddCategory(type: 1)
}
