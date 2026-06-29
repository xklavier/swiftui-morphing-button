# MorphingButton (SwiftUI)

A polished, minimalist SwiftUI component that seamlessly transforms its shape and content when tapped. Perfect for "Add to Cart", "Subscribe", or "Download" actions where providing visual feedback of success is key.

<video src="assets/demo.mp4" width="100%" autoplay loop muted playsinline></video>

Designed with **Apple's Human Interface Guidelines (HIG)** in mind—featuring fluid spring animations, haptic-ready states, and a clean aesthetic.

## Features

- **Fluid Morphing**: Smoothly transitions from a wide button to a compact "success" circle.
- **Spring-Based Animation**: Uses custom spring values for a tactile, high-quality feel.
- **State-Driven UI**: Automatically handles transitions between `idle`, `processing`, and `completed` states.
- **Minimalist Design**: Clean typography and subtle shadows that fit into any modern iOS app.
- **Haptic Feedback**: Built-in support for tactile feedback on success.

## Installation

### Option 1: Swift Package Manager (SPM)

Add the following URL to your project in Xcode (**File > Add Packages...**):

```text
https://github.com/xklavier/swiftui-morphing-button.git
```

### Option 2: Direct Import (Copy-Paste)

1. Navigate to `Sources/MorphingButton/` in this repository.
2. Copy `MorphingButton.swift` into your Xcode project.

## Usage

```swift
import SwiftUI
import MorphingButton // Only needed if using SPM

struct MyView: View {
    var body: some View {
        MorphingButton(
            title: "Add to Cart",
            completedIcon: "cart.fill.badge.plus",
            accentColor: .blue
        ) {
            // Your action here (e.g., API call)
            print("Item added!")
        }
    }
}
```

## Customization

You can pass several parameters to customize the look and feel:

- `title`: The initial button text.
- `completedIcon`: The SF Symbol to display once clicked.
- `accentColor`: The theme color for the button.
- `completedColor`: The color shown in the success state (defaults to green).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---
*Created by Barış Berke Çetin.*