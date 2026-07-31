//
//  AddCategoryPopup.swift
//  MoneyManager
//
//  Created by CDMI on 17/03/26.
//

import SwiftUI

struct AddCategoryPopup: View {
    @State var editCategory : TransectionModel?
    @State var categoryName: String = ""
    var onDissmis : () -> Void
    let db = DatabaseHelper()
    var type : Int
    
    
    init(
        editCategory: TransectionModel? = nil,
        type: Int,
        onDissmis: @escaping () -> Void
    ) {
        self.editCategory = editCategory
        if let edit = editCategory {
            self.categoryName = edit.category
        }
        
        self.type = type
        self.onDissmis = onDissmis
    }
    
    var body: some View {
        Rectangle()
            .fill(Color.white)
            .frame(width: 350 , height: 250)
            .cornerRadius(15)
            .shadow(radius: 10)
            .padding()
            .overlay{
        VStack(spacing: 20) {
            if categoryName == "" {
                Text("Add Category")
                    .font(.title2)
                    .bold()
            }else{
                Text("edit Category")
                    .font(.title2)
                    .bold()
            }
            
            
            TextField("Category Name ", text: $categoryName)
                .padding()
                .frame(width: 300)
                .background(Color(.systemGray6))
                .cornerRadius(8)
            
            HStack {
//                Spacer()
                Button {
                    
                    if editCategory != nil
                    {
                        editcategory(editCategory!.id, categoryName)
                    }
                    else
                    {
                        addmaincategory(categoryName , type)
                    }
                    
                    withAnimation {
                        onDissmis()
                    }
                } label: {
                    Text("Save")
                        .foregroundColor(.white)
                        .padding(.horizontal, 25)
                        .padding(.vertical, 10)
                        .background(Color.red)
                        .cornerRadius(6)
                }
            }
        }
    }
    }
    func addmaincategory(_ categoryname: String , _ type : Int) {
        db.addmaincategory(categoryname,type)
    }
    func editcategory(_ id : Int64 ,_ categoryname: String) {
        db.editcategory(id , categoryname)
    }
}

#Preview {
    AddCategoryPopup(type: 0) {}
}
