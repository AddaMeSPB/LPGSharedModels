
import BSON

public struct SwapInput: Codable {

    public init(
        userId: ObjectId,
        images: [AttachmentInOutPut] = []
    ) {
        self.userId = userId
        self.images = images
    }
    
    public let userId: ObjectId
    public let images: [AttachmentInOutPut]


}

extension SwapInput: Equatable {

}
