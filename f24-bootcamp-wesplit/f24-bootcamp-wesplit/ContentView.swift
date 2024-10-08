//
//  ContentView.swift
//  f24-bootcamp-wesplit
//
//  Created by Yahan Yang on 10/7/24.
//

import SwiftUI

struct ContentView: View {
    @State var amount = ""
    @State var numPpl = ""
    @State var inputTips = 0
    @State var selectTip = "10%"
    @State var CustTip = 0.0
    let tipAmount = ["10%","15%","25%","0%","%"]
    
    var totalWithTip: Double {
        let amountValue = Double(amount) ?? 0
        
        switch selectTip
        {
        case "10%":
            return amountValue*1.1
        case "15%":
            return amountValue*1.15
        case "25":
            return amountValue*1.25
        case "0":
            return amountValue
        default:
            return amountValue*(CustTip/100)+amountValue
            
        }
    }
    
    var amountPerP: Double {
        let numPeopleValue = Int(numPpl) ?? 1
        return totalWithTip/Double(numPeopleValue)
    }
    
    
    var body: some View {
        NavigationStack{
            Form
            {
                Section{
                    TextField("Amount", text: $amount)
                        .keyboardType(.numberPad)
                    TextField("Number of People",text: $numPpl)
                        .keyboardType(.numberPad)
                }
                Section("How much tip do you want to leave?")
                {
                    Picker("tips", selection: $selectTip )
                    {
                        ForEach(tipAmount, id:\.self)
                        {
                            tipAmount in Text(tipAmount)
                        }
                    }.pickerStyle(.segmented)
                    
                    TextField("Custome Tip in Percent", value: $CustTip, format:.number)
                }
                    
                Section("Check total with tip")
                {
                    Text("$\(totalWithTip, specifier: "%.2f")")
                }
                Section("Amount per person")
                {
                    Text("$\(amountPerP, specifier: "%.2f")")
                }
            }.navigationTitle("WeSplit")
        }
    }
        
        
        
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
