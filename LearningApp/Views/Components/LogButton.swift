import SwiftUI

struct LogButton: View {
    let title: String
    let isLogged: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.body.bold())
                .foregroundStyle(isLogged ? Color.secondary : Color.white)
                .frame(width: 272, height: 272)
                .glassEffect(
                    isLogged ? .regular.interactive() : .regular.tint(.brandOrange).interactive(),
                    in: .circle
                )
        }
        .buttonStyle(.plain)
        .animation(.smooth, value: isLogged)
    }
}

#Preview {
    VStack(spacing: 32) {
        LogButton(title: "Log as Learned", isLogged: false) { }
        LogButton(title: "Logged as Learned", isLogged: true) { }
    }
    .preferredColorScheme(.dark)
}
