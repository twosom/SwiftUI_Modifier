//
//  ContentView.swift
//  SwiftUI_Modifier
//
//  Created by Desire L on 2021/09/22.
//
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Main Title!")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .bold()
            Text("Sub Title!")
                    .modifier(MyTextStyle(myWeight: .heavy, myFont: .largeTitle.bold(), myColor: .gray))

            Text("Description!")
                    .modifier(MyTextStyle(myColor: .red))
            Text("Description!")
                    .customFont(color: .red)
//                    .modifier(MyTextStyle(myWeight: .ultraLight, myFont: .largeTitle.italic(), myColor: .orange))

        }


                .eraseToAnyView()
    }

    #if DEBUG
    @ObservedObject var iO = injectionObserver
    #endif
}


struct MyTextStyle: ViewModifier {

    var myWeight: Font.Weight = Font.Weight.regular
    var myFont = Font.title2.italic()
    var myColor = Color.black

    func body(content: Content) -> some View {
        return content.font(
                        myFont.weight(myWeight)
                )
                .foregroundColor(myColor)
                .padding(.bottom, 20)
    }
}


extension Text {
    func customFont(color: Color) -> Text {
        self
                .font(.title2)
                .bold()
                .italic()
                .foregroundColor(color)
    }
}


class ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }


    #if DEBUG
    @objc class func injected() {
        UIApplication.shared.windows.first?.rootViewController =
                UIHostingController(rootView: ContentView())
    }
    #endif
}
