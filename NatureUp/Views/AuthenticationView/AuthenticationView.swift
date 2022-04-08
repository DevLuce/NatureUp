//
//  AuthenticationView.swift
//  NatureUp
//
//  Created by Jung Yunseong on 2022/04/07.
//

import SwiftUI

struct AuthenticationView: View {
    @State private var capturedImage: UIImage? = nil
    @State private var isCustomCameraViewPresented = false
    
    var body: some View {
        ZStack {
            if capturedImage != nil {
                ZStack {
                    Image(uiImage: capturedImage!)
                        .resizable()
                        .scaledToFill()
                    VStack {
                        HStack {
                            Spacer()
                            Button(action: {}, label: {
                                Text("인증하기")
                                    .foregroundColor(Color(red: 4.0 / 255, green: 158.0 / 255, blue: 84.0 / 255))
                                    .fontWeight(.semibold)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 20)
                                    .background(Color.white)
                                    .clipShape(Capsule())
                            })
                            .padding(.trailing)
                        }
                        .padding()
                        Spacer()
                    }
                }
            } else {
                ZStack {
                    Color("BackgroundGray")
                    Spacer()
                    Text("인증을 위해 아래 버튼을 눌러주세요")
                        .font(.title3)
                        .foregroundColor(Color("PrimaryGreen"))
                    Spacer()
                }
            }
            VStack {
                Spacer()
                ZStack {
                    Rectangle()
                        .fill(.white)
                        .frame(height: 150)
                    Button(action: {
                        isCustomCameraViewPresented.toggle()
                    }, label: {
                        if capturedImage != nil {
                            Image(systemName: "arrow.triangle.2.circlepath")
                                .font(.largeTitle)
                                .padding()
                                .background(Color("SecondGreen"))
                                .foregroundColor(.white)
                                .clipShape(Circle())
                        } else {
                            Image(systemName: "camera.fill")
                                .font(.largeTitle)
                                .padding()
                                .background(Color("SecondGreen"))
                                .foregroundColor(.white)
                                .clipShape(Circle())
                        }
                    })
                    .padding(.bottom)
                    .sheet(isPresented: $isCustomCameraViewPresented, content: {
                        CustomCameraView(capturedImage: $capturedImage)
                    })
                }
            }
        }
        .navigationBarTitle("활동 인증하기", displayMode:.inline)
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}