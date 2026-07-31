//
//  AddTransectionFill.swift
//  MoneyManager
//
//  Created by CDMI on 16/03/26.
//

import SwiftUI

struct AddTransectionFill: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedDate = Date()
    @State private var selectedDate1 = Date()
    @State private var showCalendar = false
    @State private var selectedTime = Date()
    @State private var selectedTime1 = Date()
    @State private var showTimePicker = false
    @State private var category = "category (Optional)"
    @State private var comment = ""
    @State private var showSheet = false
    @State private var showCal = false
    @State private var goAdd = false
    @State private var type = 1
    @State private var showAmmountAlert = false
    @State private var showCommentAlert = false
    @State var list : [TransectionModel] = []
    @State var categorylist : [CategoryModel] = []
    var db = DatabaseHelper()
    
    @State private var amount: String = ""
    
    var body: some View {
        NavigationStack{
            ZStack{
                VStack(spacing:25){
                    HStack(spacing : 10){
                        Button {
                           
                            type = 1
                            category = "category (Optional)"
                        } label: {
                            Text("income")
                                .foregroundColor(.white)
                                .padding()
                                .frame(width:100 , height: 30)
                                .background(type == 1 ? Color(.green) : Color(.gray))
                                .cornerRadius(10)
                        }
                        Button {
                           
                            type = 2
                            category = "category (Optional)"
                        } label: {
                            Text("expense")
                                .foregroundColor(.white)
                                .padding()
                                .frame(width:100 , height: 30)
                                .background(type == 2 ? Color(.red) : Color(.gray))
                                .cornerRadius(10)
                        }
                        Spacer()
                    }
                    .padding()
                    
                    HStack(spacing:20){
                        
                        Button {
                            showCalendar = true
                        } label: {
                            HStack {
                                Image(systemName: "calendar")
                                    .font(.system(size: 20))
                                Text(selectedDate.formatted(.dateTime.day().month(.abbreviated).year()))
                                    .foregroundColor(Color(.black))
                            }
                            .padding()
                            .frame(width:190)
                            .cornerRadius(10)
                            .font(.system(size: 19))
                            .border(Color.black, width: 2)
                        }
                        .sheet(isPresented: $showCalendar) {
                            
                            VStack {
                                
                                DatePicker(
                                    "",
                                    selection: $selectedDate1,
                                    displayedComponents: .date
                                )
                                .datePickerStyle(.graphical)
                                .padding()
                                
                                HStack {
                                    
                                    Button("Cancel") {
                                        showCalendar = false
                                    }
                                    
                                    Spacer()
                                    
                                    Button("OK") {
                                        selectedDate = selectedDate1
                                        showCalendar = false
                                    }
                                }
                                .padding()
                            }
                            .presentationDetents([.medium, .large])
                        }
                        
                        
                        Button {
                            showTimePicker = true
                        } label: {
                            HStack {
                                Image(systemName: "clock")
                                    .font(.system(size: 20))
                                Text(selectedTime.formatted(.dateTime.hour().minute()))
                                    .foregroundColor(Color(.black))
                            }
                            .padding()
                            .frame(width: 190)
                            .cornerRadius(10)
                            .font(.system(size: 19))
                            .border(Color.black, width: 2)
                        }
                        .sheet(isPresented: $showTimePicker) {
                            
                            VStack {
                                
                                DatePicker(
                                    "Select Time",
                                    selection: $selectedTime1,
                                    displayedComponents: .hourAndMinute
                                )
                                .datePickerStyle(.wheel)
                                .labelsHidden()
                                .padding()
                                
                                HStack {
                                    Button("Cancel") {
                                        showTimePicker = false
                                    }
                                    
                                    Spacer()
                                    
                                    Button("OK") {
                                        selectedTime = selectedTime1
                                        showTimePicker = false
                                    }
                                }
                                .padding()
                            }
                            .presentationDetents([.medium, .large])
                            
                        }
                    }
                    .padding(.top)
                    Button {
                            showSheet = true
                    } label: {
                        HStack {
                            Image(systemName: "square.grid.2x2")
                                .font(.system(size: 20))
                                .padding(.leading, 8)
                            if category == "category (Optional)" {
                                Text(category)
                                    .foregroundColor(Color(.gray))
                            }else{
                                Text(category)
                                    .foregroundColor(Color(.black))
                            }
                            
                            Spacer()
                        }
                        .padding()
                        .frame(width: 400)
                        .cornerRadius(10)
                        .font(.system(size: 19))
                        .border(Color.black, width: 2)
                    }
                    .sheet(isPresented: $showSheet) {
                        VStack(spacing : 50){
                            HStack(alignment: .center) {
                                Text("Select an category")
                                    .font(.system(size: 30))
                                Spacer()
                                Button {
                                    goAdd = true
                                    showSheet = false
                                    
                                } label: {
                                    
                                    Text("Edit")
                                        .foregroundColor(Color(red: 0.337, green: 0.426, blue: 0.878))
                                        .padding()
                                        .frame(width: 80 , height: 40)
                                        .background(Color(red: 0.902, green: 0.949, blue: 1.0))
                                        .cornerRadius(10)
                                        .font(.system(size: 19))
                                }
                            }
                            .padding([.top, .leading, .trailing], 10.0)
                            .presentationDetents([.medium, .large])
                            ScrollView{
                                VStack{
                                    HStack{
                                        Button(action:{
                                            category = "non-categorized"
                                            showSheet = false
                                        })
                                        {
                                            HStack{
                                                Text("non-categorized")
                                                    .foregroundColor(.black)
                                                Spacer()
                                            }
                                        }
                                        .frame(width: 400)
                                        .bold()
                                        .padding()
                                        .font(.system(size: 20))
                                        Spacer()
                                    }
                                    
                                    Divider()
                                    ForEach(0..<categorylist.count, id: \.self) { i in
                                        let user = categorylist[i]
                                        HStack{
            //                                if user.type1 == type && user.category1 != "non-categorized" {
                                                Text(user.maincategory) 
                                                    .bold()
                                                    .padding()
                                                    .font(.system(size: 20))
                                                
                                                Spacer()
                                                
                                               
            //                                }
                                        }
                                        Divider()
                                    }
                                }
                                .padding(.top, -20.0)
                            }
                            
                            Spacer()
                        }
                        .onAppear {
                            list = db.fetchUser()
                        }
                    }
                    HStack{
                        
                        HStack {
                            Image(systemName: "dollarsign.circle")
                                .foregroundColor(.blue)
                            
                            TextField("Amount *", text: $amount)
                                .keyboardType(.numberPad)
                            
                            if showAmmountAlert{
                                Image(systemName: "exclamationmark.circle")
                            }
                        }
                            .padding()
                            .frame(width: 330)
                            .cornerRadius(10)
                            .font(.system(size: 19))
                            .border(Color.black, width: 2)
                        
                        
                        
                        Button {
                            showCal = true
                        } label: {
                            Image(systemName: "plus.slash.minus")
                                .bold()
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                                .padding(.leading, 8)
                                .padding()
                                .frame(width: 59)
                                .cornerRadius(10)
                                .font(.system(size: 19))
                                .background(Color.blue)
                                .cornerRadius(10)
                            
                        }
                        
                        
                    }
                    
                    HStack {
                        Image(systemName: "text.bubble")
                            .foregroundColor(.blue)
                        
                        TextField("Comment *", text: $comment)
                        
                        if showCommentAlert{
                            Image(systemName: "exclamationmark.circle")
                        }
                    }
                        .padding()
                        .frame(width: 400)
                        .cornerRadius(10)
                        .font(.system(size: 19))
                        .border(Color.black, width: 2)
                    
                    
                    Button {
                        if type != 0 {
                            if amount.isEmpty{
                                showAmmountAlert = true
                            }else{
                                showAmmountAlert = false
                                if comment.isEmpty{
                                    showCommentAlert = true
                                }
                                else{
                                    showCommentAlert = false
                                    addcategory(category , type , selectedDate , comment , amount)
                                    dismiss()
                                }
                            }
                        }
                       
                        
                    } label: {
                        Text("Save")
                            .bold()
                            .frame(width: 100)
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .padding(.horizontal, 25)
                            .padding(.vertical, 10)
                            .background(Color.red)
                            .cornerRadius(6)
                    }
                    
                    Spacer()
                }
                if showCal {
                    
                    Color.black.opacity(0.4)
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation {
                                showCal = false
                            }
                        }
                    
                    CalculaterPopup(show: $showCal, amount: $amount)

                    .transition(.move(edge: .bottom).combined(with: .opacity))
                }
            }
            
        }
        .navigationDestination(isPresented: $goAdd) {
            AddCategory(type: type)
        }
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
                    Text("Add Transation")
                        .bold()
                        .font(.system(size: 25))
                }
            }
        }
        
    }
    func categoryType1 () -> String {
        return "income"
    }
    func categoryType2 () -> String {
        return "expence"
    }
    func addcategory(_ categoryname: String , _ type : Int , _ date : Date , _ comment : String , _ ammount : String) {
        db.addcategory(categoryname,type,date,comment,Double(ammount) ?? 0.0)
    }
}
#Preview {
    AddTransectionFill()
}
