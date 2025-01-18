import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct ImageVariableBlurView: View {
    @State private var image: UIImage?

    let imageName: String
    let blurRadius: Float
    let position: VariableBlurPosition
    let context = CIContext()

    init(imageName: String, blurRadius: Float = 25.0, position: VariableBlurPosition = .bottom) {
        self.imageName = imageName
        self.blurRadius = blurRadius
        self.position = position
    }

    var body: some View {
        VStack {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else {
                ProgressView()
                    .progressViewStyle(.circular)
            }
        }
        .onAppear {
            guard let uiImage = UIImage(named: imageName) else { return }
            guard let ciImage = CIImage(image: uiImage) else { return }

            let imageMask = getImageMask(maskHeight: ciImage.extent.height, blurPosition: self.position)
            let blurredImage = maskImageWithVaribleBlur(ciImage: ciImage, mask: imageMask, blurRadius: self.blurRadius)
            guard let cgImage = context.createCGImage(blurredImage, from: blurredImage.extent) else { return }

            image = UIImage(cgImage: cgImage)
        }
    }
}

#Preview {
    ImageVariableBlurView(imageName: "silo", blurRadius: 20, position: .bottom)
}
