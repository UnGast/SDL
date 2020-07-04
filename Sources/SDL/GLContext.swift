import CSDL2

public final class SDLGLContext {
    public let internalPointer: UnsafeMutableRawPointer
    
    public init (window: SDLWindow) throws {
        let internalPointer = SDL_GL_CreateContext(window.internalPointer)
        self.internalPointer = try internalPointer.sdlThrow(type: type(of: self))
    }

    deinit {
        SDL_GL_DeleteContext(internalPointer)
    }
}