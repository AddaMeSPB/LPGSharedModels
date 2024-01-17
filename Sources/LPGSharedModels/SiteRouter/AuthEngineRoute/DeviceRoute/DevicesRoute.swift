
import URLRouting

public enum DevicesRoute: Equatable {
    case createOrUpdate(input: DeviceInOutPut)
}

public struct DevicesRouter: ParserPrinter {
    public var body: some Router<DevicesRoute> {
        Route(.case(DevicesRoute.createOrUpdate)) {
            Method.post
            Body(.json(DeviceInOutPut.self))
        }
    }
}
