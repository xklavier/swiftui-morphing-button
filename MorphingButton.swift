import SwiftUI

/// A polished, state-driven morphing button for SwiftUI projects.
/// Transitions from a wide CTA button to a success indicator with fluid spring animations.
public struct MorphingButton: View {
    
    // MARK: - Properties
    
    public enum ButtonState {
        case idle
        case processing
        case completed
    }
    
    let title: String
    let completedIcon: String
    let accentColor: Color
    let completedColor: Color
    let action: () -> Void
    
    @State private var state: ButtonState = .idle
    @State private var isAnimating = false
    
    // MARK: - Initializer
    
    public init(
        title: String = "Add to Cart",
        completedIcon: String = "checkmark",
        accentColor: Color = .black,
        completedColor: Color = .green,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.completedIcon = completedIcon
        self.accentColor = accentColor
        self.completedColor = completedColor
        self.action = action
    }
    
    // MARK: - Body
    
    public var body: some View {
        Button(action: handleTap) {
            ZStack {
                // Background shape
                RoundedRectangle(cornerRadius: state == .idle ? 12 : 28, style: .continuous)
                    .fill(state == .completed ? completedColor : accentColor)
                    .frame(width: backgroundWidth, height: 56)
                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
                
                // Content
                Group {
                    if state == .idle {
                        Text(title)
                            .font(.system(size: 18, weight: .semibold, design: .rounded))
                            .foregroundColor(.white)
                            .transition(.opacity.combined(with: .scale(scale: 0.9)))
                    } else if state == .processing {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    } else {
                        Image(systemName: completedIcon)
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(.white)
                            .transition(.scale.combined(with: .opacity))
                    }
                }
            }
        }
        .buttonStyle(MorphingButtonStyle())
        .disabled(state != .idle)
        .animation(.spring(response: 0.4, dampingFraction: 0.7, blendDuration: 0), value: state)
    }
    
    // MARK: - Computed Values
    
    private var backgroundWidth: CGFloat {
        switch state {
        case .idle: return 280
        case .processing, .completed: return 56
        }
    }
    
    // MARK: - Actions
    
    private func handleTap() {
        // Haptic feedback
        let generator = UINotificationFeedbackGenerator()
        generator.prepare()
        
        withAnimation {
            state = .processing
        }
        
        // Simulate a network request or action delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            action()
            withAnimation {
                state = .completed
            }
            generator.notificationOccurred(.success)
            
            // Optional: Reset back to idle after a delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation {
                    state = .idle
                }
            }
        }
    }
}

// MARK: - Button Style

struct MorphingButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
            .opacity(configuration.isPressed ? 0.9 : 1.0)
    }
}

// MARK: - Preview

struct MorphingButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 40) {
            MorphingButton(title: "Add to Cart") {
                print("Action performed")
            }
            
            MorphingButton(
                title: "Download Now",
                completedIcon: "arrow.down.doc.fill",
                accentColor: .blue
            ) {
                print("Download started")
            }
        }
    }
}
