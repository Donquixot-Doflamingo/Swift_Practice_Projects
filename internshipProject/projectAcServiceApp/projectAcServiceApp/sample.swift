//
//  sample.swift
//  projectAcServiceApp
//
//  Created by harsh Khandelwal on 19/06/21.
//

import SwiftUI
import CoreData
//
//struct Details : Identifiable {
//    var id: Int
//
//    let modelNum, puchasedDate, sellar, installation : String
//}

struct sample: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: DetailsOfAC.entity(), sortDescriptors: []) var detailsOfAC : FetchedResults<DetailsOfAC>
    //for database traverse
//    var managedObjectContext : NSManagedObjectContext!
//    var listOfDetails = [DetailsOfAC]()
//    var currentData : DetailsOfAC?
    
//    let detail : [Details] = [
//        .init(id: 0, modelNum: "", puchasedDate: "var of date", sellar: "var of sellar name", installation: "var of installed place"),
//        .init(id: 1, modelNum: "var of model 2",puchasedDate: "var of date 2", sellar: "var of sellar name 2", installation: "var of installed place 2"),
//        .init(id: 3, modelNum: "var of model 3", puchasedDate: "var of date 3", sellar: "var of sellar name 3", installation: "var of installed place 3")
//    ]
    var body: some View{
        
        NavigationView{
            List{
                    HStack{
                        Image("AC_Image").resizable().frame(width: 100, height: 40, alignment: .center).clipped()
                        VStack (alignment: .leading) {
                            ForEach(detailsOfAC, id: \.id) { detailsOfAC in
                            Text(detailsOfAC.model ?? "unknown").font(.headline).frame( alignment: .center)
                            let secondDetail : String = Text("Puchchased : " + detailsOfAC.dateofPurchasing ?? "unknown" + "/" + detailsOfAC.purchasedfrom ?? "unknown").font(.subheadline)
                            Text(secondDetail )
                            Text(detailsOfAC.installedin ?? "unknown").font(.headline).frame( alignment: .trailing)
                        }
                    }
                }
            }
        }
    }
}

struct sample_Previews: PreviewProvider {
    static var previews: some View {
        sample()
    }
}
