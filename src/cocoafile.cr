@[Link(ldflags: "-framework Cocoa -framework Foundation #{__DIR__}/../ext/cocoafile.m")]
lib Native
  fun add(Int32, Int32) : Int32
end

module Cocoafile
  class Cocoafile
    def add(a : Int32, b : Int32) : Int32
      Native.add(a, b)
    end
  end
end
