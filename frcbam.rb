require 'formula'

class Frcbam < Formula
  head "https://github.com/vezzi/FRC_align", :using => :git
  
  #url "http://ea-utils.googlecode.com/files/ea-utils.1.1.2-484.tar.gz"
  #sha256 "92a2cc90b39c1868cb2cbbbb40fe7251d8327518066ec941648b9dd5ac04e785"
  
  depends_on "cmake" => :build
  depends_on "bamtools"
  depends_on "boost"
                   
  def install
    mkdir 'build' do
      system "cmake", "..", *std_cmake_args
      system "PREFIX=#{prefix} make install"
    end
    bin.install "bin/FRC"
  end
end
