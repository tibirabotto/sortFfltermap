//
//  ContentView.swift
//  SortFilterMap
//
//  Created by Tibirica Neto on 2022-11-06.
//

import SwiftUI


struct UserModel: Identifiable {
    let id = UUID().uuidString
    let name: String
    let points: Int
    let isVerified: Bool
}

class ArrayModificationViewModel: ObservableObject {
    
    @Published var dataArray: [UserModel] = []
    @Published var filterArray: [UserModel] = []
    @Published var mappedArray: [String] = []
    init() {
        getUsers()
        updateFilterArray()
    }
    
    func updateFilterArray() {
        
//        SORT
//        filterArray = dataArray.sorted(by: { $0.points > $1.points })
        
//        FILTER
//        filterArray = dataArray.filter({ (user) -> Bool in
//            //return user.points > 50
//            //return !user.isVerified
//            //return user.name.contains("o")
//            return user.isVerified
//        })
        
//        filterArray = dataArray.filter({ $0.isVerified })
        
//        MAP
          mappedArray = dataArray
                            .sorted(by: { $0.points > $1.points })
                            .filter({ $0.isVerified })
                            .compactMap({ $0.name })
        
    }
    

    
    func getUsers() {
        let user1 = UserModel(name: "Bob", points: 5, isVerified: true)
        let user2 = UserModel(name: "Nick", points: 0, isVerified: false)
        let user3 = UserModel(name: "Thalia", points: 20, isVerified: true)
        let user4 = UserModel(name: "Vick", points: 50, isVerified: false)
        let user5 = UserModel(name: "Json", points: 45, isVerified: false)
        let user6 = UserModel(name: "Samantha", points: 76, isVerified: true)
        let user7 = UserModel(name: "Chris", points: 45, isVerified: true)
        let user8 = UserModel(name: "Sarah", points: 1, isVerified: true)
        let user9 = UserModel(name: "Julie", points: 100, isVerified: false)
        let user10 = UserModel(name: "Zoe", points: 45, isVerified: true)
        self.dataArray.append(contentsOf: [
            user1,
            user2,
            user3,
            user4,
            user5,
            user6,
            user7,
            user8,
            user9,
            user10,
        ])
    }
}


struct ContentView: View {
    
    @StateObject var vm = ArrayModificationViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
//                ForEach(vm.filterArray) { user in
//                    VStack(alignment: .leading) {
//                        Text(user.name)
//                            .font(.headline)
//                        HStack {
//                            Text("Points: \(user.points)")
//                            Spacer()
//                            if user.isVerified {
//                                Image(systemName: "flame.fill")
//                            }
//                        }
//                    }
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(Color.blue.cornerRadius(10))
//                    .padding(.horizontal)
//                }
                ForEach(vm.mappedArray, id: \.self) { name in
                    Text(name)
                        .font(.title)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
