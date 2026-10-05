import SwiftUI

struct ContentView: View {
    @AppStorage("name") private var name: String = ""
    @AppStorage("hasCompletedSetup") private var hasCompletedSetup: Bool = false
    @AppStorage("launguage") private var launguage: String = "English"
    @AppStorage("launguageSetup") private var launguageSetup: Bool = false
    var body: some View {
        NavigationStack{
            
            if launguageSetup {
                launguageView()
            } else {
                VStack{
                    
                    if launguage == "English" {
                        Text("Wellcome!")
                            .font(.title)
                    } else if launguage == "Japanese"{
                        Text("ようこそ！")
                            .font(.title)
                    } else if launguage == "Korean"{
                        Text("어서 오세요！")
                            .font(.title)
                    } else {
                        Text("This launguage can't be used.")
                    }
                    
                    
                    Picker(selection: $launguage){
                        Text("English")
                            .tag("English")
                        Text("日本語")
                            .tag("Japanese")
                        Text("한국어")
                            .tag("Korean")
                        Text("中文(Creating)")
                            .tag("Chinese")
                        
                    } label: {
                        Text("Choose")
                    }
                    .pickerStyle(.automatic)
                    
                    if launguage == "Chinese"{
                        
                    } else {
                        
                        Button(launguage == "English" ? "Next" : launguage == "Japanese" ? "次へ" : "다음으로"){
                            launguageSetup = true
                        }
                        .buttonStyle(.borderedProminent)
                        
                        
                    }
                }
            }
        }
    }
}

struct launguageView: View {
    @AppStorage("name") private var name: String = ""
    @AppStorage("launguage") private var launguage: String = "English"
    @AppStorage("hasCompletedSetup") private var hasCompletedSetup: Bool = false
    var body: some View {
        if hasCompletedSetup {
            HomeView()
        } else {
            VStack{
                
                
                if launguage == "Japanese" {
                    Text("ようこそ！")
                        .font(.largeTitle)
                        .bold()
                    
                    Text("名前を入力してください")
                        .font(.headline)
                    
                    TextField("名前", text: $name)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal)
                    
                    
                    
                    Button("次へ"){
                        hasCompletedSetup = true
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(name.isEmpty)
                } else if launguage == "English" {
                    Text("WELCOME！")
                        .font(.largeTitle)
                        .bold()
                    
                    Text("Please Enter Your Name")
                        .font(.headline)
                    
                    TextField("Name", text: $name)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal)
                    
                    Button("Next"){
                        hasCompletedSetup = true
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(name.isEmpty)
                } else if launguage == "Korean" {
                    Text("환영합니다!")
                        .font(.largeTitle)
                        .bold()
                    
                    Text("이름을 입력해 주세요.")
                        .font(.headline)
                    
                    TextField("이름", text: $name)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal)
                    
                    
                    Button("다음으로"){
                        hasCompletedSetup = true
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(name.isEmpty)
                } else {
                    Text("Can not use this launguage")
                }
                
                
                
                
            }
            .padding()
        }
    }
}
struct HomeView: View {
    @AppStorage("name") private var name: String = ""
    @AppStorage("launguage") private var launguage: String = "English"
    @AppStorage("hasCompletedSetup") private var hasCompletedSetup: Bool = false
    @AppStorage("launguageSetup") private var launguageSetup: Bool = false
    @State private var showWelcome = false
    @State private var showName = false
    var body: some View{
        VStack{
            
            
            
            Button("初期状態に戻す") {
                name = ""
                hasCompletedSetup = false
                launguage = "English"
                launguageSetup = false
            }
        }
    }
}

#Preview {
    ContentView()
}
