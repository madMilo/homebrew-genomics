require 'formula'

class EaUtils < Formula
  version "1.1.2-484"
  
  option "without-architecture", "Build without allowing architecture information (to force source install when binaries are available)."
               
  url "http://ea-utils.googlecode.com/files/ea-utils.1.1.2-484.tar.gz"
  sha256 "92a2cc90b39c1868cb2cbbbb40fe7251d8327518066ec941648b9dd5ac04e785"
  
  depends_on "google-sparsehash"
  depends_on "gsl"
                   
  def install
    inreplace "sam-stats.cpp" do |s|
      s.gsub! /<samtools\/sam.h>/, "\"samtools\/sam.h\""
    end
    ENV.append "CFLAGS", "-I#{Formula["google-sparsehash"].include}" 
    system "rm -Rf google"
    system "PREFIX=#{prefix} make install"
    bin.install %w(fastq-mcf fastq-multx fastq-join fastq-stats fastq-clipper sam-stats varcall)
  end
end
