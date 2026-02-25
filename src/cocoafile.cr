@[Link(ldflags: "-framework Cocoa -framework Foundation #{__DIR__}/../ext/cocoafile.m")]
lib Native
  fun native_choose_file(ext_array : LibC::Char**, count : LibC::Int) : LibC::Char*
end

module Cocoafile
  class Cocoafile
    def self.choose_file(extensions : Array(String)) : String?
      # Convert Crystal Array(String) to a C-style array of pointers
      pointers = extensions.map &.to_unsafe

      # Call the native function
      result_ptr = Native.native_choose_file(pointers, extensions.size)

      if result_ptr
        path = String.new(result_ptr)
        LibC.free(result_ptr.as(Void*)) # Clean up the strdup from the C side
        path
      else
        nil
      end
    end
  end
end
