//
//  ContentView.swift
//  SpeedCam
//
//  Created by Vikram Kriplaney on 22.05.22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TopBar()
            Spacer()
            ZoomLevels()
            BottomBar()
        }
        .preferredColorScheme(.dark)
        .symbolRenderingMode(.hierarchical)
        .statusBar(hidden: true)
        .background(
            Image("photo-1").resizable().scaledToFill().edgesIgnoringSafeArea(.all)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TopBar: View {
    var body: some View {
        HStack {
            Image(systemName: "bolt.circle")
            Spacer()
            Image(systemName: "chevron.up.circle.fill")
            Spacer()
            Image(systemName: "livephoto")
        }
        .font(.system(size: 25, weight: .light))
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 10)
        .padding(.bottom, 50)
        .padding(.top, -6)
        .background(.black.opacity(0.7))
    }
}

struct BottomBar: View {
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Text("CINEMATIC")
                Text("VIDEO")
                Text("PHOTO").foregroundColor(.yellow)
                Text("PORTRAIT")
                Text("PANO")
            }
            .font(.custom("DINAlternate-Bold", size: 14))
            .frame(maxWidth: .infinity)
            .scaleEffect(x: 1.15)
            .mask {
                LinearGradient(colors: [.clear, .black, .black, .black, .clear], startPoint: .leading, endPoint: .trailing)
            }

            HStack {
                Image("photo-1").resizable().scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipped()
                    .cornerRadius(5)

                Circle()
                    .frame(height: 60)
                    .padding(5)
                    .background(
                        Circle().stroke(lineWidth: 3)
                    )

                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .font(.system(size: 45, weight: .ultraLight))
            }
        }
        .padding()
        .padding(.bottom, 30)
        .background(.black.opacity(0.8))
    }
}

struct ZoomLevels: View {
    var body: some View {
        HStack {
            item("0,5").scaleEffect(0.9)
            item("1×").foregroundColor(.yellow)
            item("3").scaleEffect(0.9)
        }
        .font(.caption.bold())
        .padding(.bottom, 8)
    }

    func item(_ label: String) -> some View {
        Text(label)
            .frame(width: 35, height: 35)
            .background(.black.opacity(0.4), in: Circle())
    }
}
