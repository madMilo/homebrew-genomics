require 'formula'

class Ale < Formula
  head "https://github.com/sc932/ALE.git", :using => :git
  
  #url "http://ea-utils.googlecode.com/files/ea-utils.1.1.2-484.tar.gz"
  #sha256 "92a2cc90b39c1868cb2cbbbb40fe7251d8327518066ec941648b9dd5ac04e785"
                   
  def install
    cd "src" do
      system "make"
    end
    cd "doc" do
      system "make"
    end
    doc.mkpath
    doc.install Dir["doc/*"]
    bin.mkpath
    bin.install Dir["src/*"]
    share.mkpath
    share.install Dir["example/*"]
    #share.install Dir["test/*"]
    prefix.install "INSTALL","LICENSE","README","makefile"
  end
end
