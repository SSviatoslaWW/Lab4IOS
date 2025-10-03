import SwiftUI

struct ContentView: View {
    var body: some View {
        
        

        ZStack {
            LinearGradient (
                colors: [Color.black,
                         Color(red: 202/255, green: 138/255, blue: 4/255),    // перехідний (темно-жовтий)
                         Color(red: 250/255, green: 204/255, blue: 21/255)],
                startPoint: .topLeading,
                endPoint: .bottomLeading)
            .ignoresSafeArea()
            VStack {
                
                HStack {
                    Spacer()
                    Image("Image")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(
                            width: UIScreen.main.bounds.width * 0.4)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .padding()
                    Spacer()
                }
                
                
                VStack {
                    
                    Text("My name is Jordge")
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                        .font(.title)
                        .padding()
                    Text("George is a friendly and creative individual with a passion for exploring new ideas and meeting diverse people. He is curious by nature and enjoys learning new skills that help him grow both personally and professionally. George values kindness and teamwork, always ready to support others and work towards common goals. In his free time, he likes reading, traveling, and discovering different cultures.")
                        .font(.caption)
                        .foregroundColor(.white)
                    Spacer()
                    
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
