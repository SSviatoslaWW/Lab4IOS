import SwiftUI

struct ContentView: View {
    @State private var isDarkMode: Bool = true
    @State private var nameTextField: String = ""
    @State private var surenameTextField: String = ""
    
    private let darkTheme = ThemeColor(
        gradientBg: [
            Color.black,
            Color(red: 202/255, green: 138/255, blue: 4/255),
            Color(red: 250/255, green: 204/255, blue: 21/255)
        ],
        textColor: .white,
        textFieldbackground: Color.white.opacity(0.1),
        textFieldBorder: Color.white.opacity(0.6),
        buttonBackground: .yellow
    )
    
    private let lightTheme = ThemeColor(
        gradientBg: [
            Color(red: 173/255, green: 216/255, blue: 230/255),
            Color(red: 255/255, green: 182/255, blue: 193/255)
        ],
        textColor: .black,
        textFieldbackground: Color.gray.opacity(0.2),
        textFieldBorder: Color.gray.opacity(0.6),
        buttonBackground: Color(red: 173/255, green: 216/255, blue: 230/255)
    )
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: isDarkMode ? darkTheme.gradientBg : lightTheme.gradientBg,
                startPoint: .topLeading,
                endPoint: .bottomLeading
            )
            .ignoresSafeArea()
            .animation(.linear(duration: 0.4), value: isDarkMode)
            
            VStack {
                ToggleThemeStack(
                    themeColor: isDarkMode ? darkTheme : lightTheme,
                    onToggle: {
                        isDarkMode.toggle()
                    }
                )
                
                ScrollView(.vertical, showsIndicators: true) {
                    VStack {
                        ProfileImageView()
                        
                        DescriptionView(
                            themeColor: isDarkMode ? darkTheme : lightTheme)
                        
                        InputDataView(
                            nameTextField: $nameTextField,
                            surenameTextField: $surenameTextField,
                            themeColor: isDarkMode ? darkTheme : lightTheme
                        )
                        
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

struct ThemeColor {
    var gradientBg: [Color]
    var textColor: Color
    var textFieldbackground: Color
    var textFieldBorder: Color
    var buttonBackground: Color
}

struct ToggleThemeStack: View {
    var themeColor: ThemeColor
    var onToggle: () -> Void
    
    var body: some View {
        HStack(spacing: 20) {
            Spacer()
            Text("Тема сторінки")
                .foregroundColor(themeColor.textColor)
                .fontWeight(.bold)
            
            Toggle("", isOn: .constant(true))
                .labelsHidden()
                .toggleStyle(SwitchToggleStyle(tint: .yellow))
                .onTapGesture {
                    onToggle()
                }
        }
        .padding()
    }
}

struct ProfileImageView: View {
    var body: some View {
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
    }
}

struct DescriptionView: View {
    var themeColor: ThemeColor
    
    var body: some View {
        VStack {
            Text("My name is Jordge")
                .foregroundColor(themeColor.textColor)
                .fontWeight(.heavy)
                .font(.title)
                .padding()
            
            Text("George is a friendly and creative individual with a passion for exploring new ideas and meeting diverse people. He is curious by nature and enjoys learning new skills that help him grow both personally and professionally. George values kindness and teamwork, always ready to support others and work towards common goals. In his free time, he likes reading, traveling, and discovering different cultures.")
                .font(.caption)
                .foregroundColor(
                    themeColor.textColor.opacity(0.9))
                .padding(.horizontal)
        }
    }
}

struct InputDataView: View {
    @Binding var nameTextField: String
    @Binding var surenameTextField: String
    
    var themeColor: ThemeColor
    
    var body: some View {
        VStack {
            HStack {
                Text("Ваше ім'я: ")
                    .font(.headline)
                    .foregroundColor(themeColor.textColor)
                Spacer()
                TextField("Введіть ім`я", text: $nameTextField)
                    .padding(10)
                    .background(themeColor.textFieldbackground)
                    .foregroundColor(themeColor.textColor)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(themeColor.textFieldBorder, lineWidth: 1)
                    )
                    .frame(maxWidth: 210)
                    .shadow(color: .black.opacity(0.3), radius: 10, x: 2, y: 2)
            }
            .padding(.horizontal)
            
            HStack {
                Text("Ваше прізвише: ")
                    .font(.headline)
                    .foregroundColor(themeColor.textColor)
                Spacer()
                TextField("Введіть прізвище", text: $surenameTextField)
                    .padding(10)
                    .background(themeColor.textFieldbackground)
                    .foregroundColor(themeColor.textColor)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(themeColor.textFieldBorder, lineWidth: 1)
                    )
                    .frame(maxWidth: 210)
                    .shadow(color: .black.opacity(0.3), radius: 10, x: 2, y: 2)
            }
            .padding(.horizontal)
            
            Button(action: {}) {
                Text("Відправити")
                    .padding(10)
                    .foregroundColor(themeColor.textColor)
                    .background(themeColor.buttonBackground)
                    .cornerRadius(10)
                    .font(.title2)
                    .shadow(color: .black.opacity(0.3), radius: 5, x: 2, y: 2)
            }
            .padding(.top)
        }
        .padding(.top)
    }
}
