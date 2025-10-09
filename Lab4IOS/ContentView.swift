import SwiftUI

struct ContentView: View {
    @State private var isDarkMode: Bool = true
    @State private var nameTextField: String = ""
    @State private var surenameTextField: String = ""
    
    private let darkGradient = [
        Color.black,
        Color(red: 202/255, green: 138/255, blue: 4/255),
        Color(red: 250/255, green: 204/255, blue: 21/255)
    ]
    private let darkTextColor = Color.white
    
    private let lightGradient = [
        Color(red: 173/255, green: 216/255, blue: 230/255),
        Color(red: 255/255, green: 182/255, blue: 193/255)
    ]
    private let lightTextColor = Color.black
    
    // TextField
    private let darkTextFieldBackground = Color.white.opacity(0.1)
    private let lightTextFieldBackground = Color.gray.opacity(0.2)
    
    private let darkTextFieldBorder = Color.white.opacity(0.6)
    private let lightTextFieldBorder = Color.gray.opacity(0.6)
    
    private let darkButtonBackground = Color.yellow
    private let lightButtonBackground = Color(red: 173/255, green: 216/255, blue: 230/255)
    
    var body: some View {
        ZStack {
            // Фон
            LinearGradient(
                colors: isDarkMode ? darkGradient : lightGradient,
                startPoint: .topLeading,
                endPoint: .bottomLeading
            )
            .ignoresSafeArea()
            .animation(.linear(duration: 0.4), value: isDarkMode)
            
            VStack {
                // Перемикач — він не в ScrollView
                HStack(spacing: 20) {
                    Spacer()
                    Text(isDarkMode ? "Темна тема" : "Світла тема")
                        .foregroundColor(isDarkMode ? darkTextColor : lightTextColor)
                        .fontWeight(.bold)
                    
                    Toggle("", isOn: $isDarkMode)
                        .labelsHidden()
                        .toggleStyle(SwitchToggleStyle(tint: .yellow))
                }
                .padding()
                
                // Тепер скролиться тільки контент
                ScrollView(.vertical, showsIndicators: true) {
                    VStack {
                        // Фото
                        HStack {
                            Spacer()
                            Image("Image")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(minWidth: 150, maxWidth: 250)
                                .clipShape(Circle())
                                .padding()
                            Spacer()
                        }
                        
                        // Текстовий блок
                        VStack {
                            Text("My name is Jordge")
                                .foregroundColor(isDarkMode ? darkTextColor : lightTextColor)
                                .fontWeight(.heavy)
                                .font(.title)
                                .padding()
                            
                            Text("George is a friendly and creative individual with a passion for exploring new ideas and meeting diverse people. He is curious by nature and enjoys learning new skills that help him grow both personally and professionally. George values kindness and teamwork, always ready to support others and work towards common goals. In his free time, he likes reading, traveling, and discovering different cultures.")
                                .font(.caption)
                                .foregroundColor(isDarkMode ? darkTextColor.opacity(0.9) : lightTextColor.opacity(0.9))
                                .padding(.horizontal)
                        }
                        
                        VStack {
                            HStack {
                                Text("Ваше ім'я: ")
                                    .font(.headline)
                                    .foregroundColor(isDarkMode ? darkTextColor : lightTextColor)
                                Spacer()
                                TextField("Введіть ім`я", text: $nameTextField)
                                    .padding(10)
                                    .background(isDarkMode ? darkTextFieldBackground : lightTextFieldBackground)
                                    .foregroundColor(isDarkMode ? darkTextColor : lightTextColor)
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(isDarkMode ? darkTextFieldBorder : lightTextFieldBorder, lineWidth: 1)
                                    )
                                    .frame(maxWidth: 230)
                                    .shadow(color: .black.opacity(0.3), radius: 10, x: 2, y: 2)

                            
                            }.padding(.horizontal)
                            
                            HStack {
                                Text("Ваше прізвише: ")
                                    .font(.headline)
                                    .foregroundColor(isDarkMode ? darkTextColor : lightTextColor)
                                Spacer()
                                TextField("Введіть прізвище", text: $surenameTextField)
                                    .padding(10)
                                    .background(isDarkMode ? darkTextFieldBackground : lightTextFieldBackground)
                                    .foregroundColor(isDarkMode ? darkTextColor : lightTextColor)
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(isDarkMode ? darkTextFieldBorder : lightTextFieldBorder, lineWidth: 1)
                                    )
                                    .frame(maxWidth: 230)
                                    .shadow(color: .black.opacity(0.3), radius: 10, x: 2, y: 2)

                            
                            }.padding(.horizontal)
                            
                            HStack {
                                Button(action: {}){
                                    Text("Відправити")
                                        .padding(10)
                                        .foregroundColor(isDarkMode ? darkTextColor : lightTextColor)
                                        .background(isDarkMode ? darkButtonBackground : lightButtonBackground)
                                        .cornerRadius(10)
                                        .font(.title2)
                                        .shadow(color: .black.opacity(0.3), radius: 5, x: 2, y: 2)
                                }
                            }.padding(.top)
                        }.padding(.top)
                        
                        Spacer(minLength: 50)
                    }
                    
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
