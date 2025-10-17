import SwiftUI

// MARK: - ContentView
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

            VStack(spacing: 0) {
                ToggleThemeStack(
                    themeColor: isDarkMode ? darkTheme : lightTheme,
                    isDarkMode: $isDarkMode
                )

                ScrollView(.vertical, showsIndicators: true) {
                    VStack(spacing: 20) {
                        ProfileImageView()
                        DescriptionView(themeColor: isDarkMode ? darkTheme : lightTheme)
                        InputDataView(
                            nameTextField: $nameTextField,
                            surenameTextField: $surenameTextField,
                            themeColor: isDarkMode ? darkTheme : lightTheme
                        )
                    }
                    .padding(.bottom, 30) // щоб було місце під клавіатуру
                }
                .scrollBounceBehavior(.basedOnSize)
            }
        }
        // Ховаємо клавіатуру при тапі поза полями
        .onTapGesture {
            hideKeyboard()
        }
    }
}

// MARK: - Theme
struct ThemeColor {
    var gradientBg: [Color]
    var textColor: Color
    var textFieldbackground: Color
    var textFieldBorder: Color
    var buttonBackground: Color
}

// MARK: - ToggleThemeStack
struct ToggleThemeStack: View {
    var themeColor: ThemeColor
    @Binding var isDarkMode: Bool

    var body: some View {
        HStack(spacing: 20) {
            Spacer()
            Text(isDarkMode ? "Темна тема" : "Світла тема")
                .foregroundColor(themeColor.textColor)
                .fontWeight(.bold)
            Toggle("", isOn: $isDarkMode)
                .labelsHidden()
                .toggleStyle(SwitchToggleStyle(tint: .yellow))
        }
        .padding()
    }
}

// MARK: - ProfileImageView
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

// MARK: - DescriptionView
struct DescriptionView: View {
    var themeColor: ThemeColor

    var body: some View {
        VStack(spacing: 10) {
            Text("My name is Jordge")
                .foregroundColor(themeColor.textColor)
                .fontWeight(.heavy)
                .font(.title)
                .padding(.top)

            Text("George is a friendly and creative individual with a passion for exploring new ideas and meeting diverse people. He is curious by nature and enjoys learning new skills that help him grow both personally and professionally. George values kindness and teamwork, always ready to support others and work towards common goals. In his free time, he likes reading, traveling, and discovering different cultures.")
                .font(.caption)
                .foregroundColor(themeColor.textColor.opacity(0.9))
                .padding(.horizontal)
        }
    }
}

// MARK: - InputDataView
struct InputDataView: View {
    @Binding var nameTextField: String
    @Binding var surenameTextField: String

    var themeColor: ThemeColor
    @FocusState private var focusedField: Field?

    enum Field {
        case name
        case surname
    }

    var body: some View {
        VStack(spacing: 15) {
            HStack {
                Text("Ваше ім'я: ")
                    .font(.headline)
                    .foregroundColor(themeColor.textColor)
                Spacer()
                TextField("Введіть ім'я", text: $nameTextField)
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
                    .focused($focusedField, equals: .name)
            }
            .padding(.horizontal)

            HStack {
                Text("Ваше прізвище: ")
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
                    .focused($focusedField, equals: .surname)
            }
            .padding(.horizontal)

            Button(action: {
                print("Прізвище: ", surenameTextField)
                print("Ім'я: ", nameTextField)
                hideKeyboard()
            }) {
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

// MARK: - Hide Keyboard
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil, from: nil, for: nil
        )
    }
}
