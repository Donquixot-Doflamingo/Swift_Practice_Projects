//
//  dialer.swift
//  ContactsApp
//
//  Created by harsh Khandelwal on 18/07/21.
//

import SwiftUI

enum dialButtons : String{
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case astrick = "*"
    case hash = "#"
    case call = "Dial"
    case delete = "DEL"
}


struct dialer: View {
    
    @State var value = ""
    
    let buttons: [[dialButtons]] = [
        [.one, .two, .three],
        [.four, .five, .six],
        [.seven, .eight, .nine],
        [.astrick, .zero, .hash]
    ]
    
    var body: some View {
        
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            VStack(alignment : .center) {
                Spacer()
                // display numbers
                HStack {
                    Text(value).bold().font(.system(size: 45)).foregroundColor(.black)
                }
                //buttons of dial-pad
                ForEach(buttons, id : \.self){ row in
                    HStack(spacing: 12){
                        ForEach(row, id : \.self){ item in
                            Button(action: {
                                self.didTap(button: item)
                            }, label: {
                                Text(item.rawValue).font(.system(size: 34)).frame(width: self.buttonWidth(item: item), height: self.buttonHeight()).background(Color.white).foregroundColor(.black).cornerRadius(self.buttonWidth(item: item)/2).padding()
                            })
                        }
                    }
                }
                HStack{
                    
                    Button(action: {
                        self.didTap(button: .call)
                    }, label: {
                        Image(systemName: "phone.fill").frame(width: 90, height: 90, alignment: .leading)
                    })
                    Button(action: {
                        self.didTap(button: .delete)
                    }, label: {
                        Image(systemName: "delete.left.fill").frame(width: 110, height: 110, alignment: .trailing)
                    })
                }.foregroundColor(.black).cornerRadius(50)
            }
        }
    }
    
    func didTap(button: dialButtons){
        switch button {
        case .call:
            let phoneNumberformatted = "telprompt://\(self.value)"
            guard let url = URL(string: phoneNumberformatted) else { return }
            UIApplication.shared.open(url)
        case .delete:
            self.value.removeLast()
        default:
            let number = button.rawValue
            if self.value == ""{
                value = number
            }
            else{
                self.value = "\(self.value)\(number)"
            }
        }
    }
    
    func buttonWidth(item: dialButtons) -> CGFloat {
        return(UIScreen.main.bounds.width - (5*12)) / 4
    }
    func buttonHeight() -> CGFloat {
        return(UIScreen.main.bounds.width - (5*12)) / 4
    }
}



struct dialer_Previews: PreviewProvider {
    static var previews: some View {
        dialer()
    }
}
