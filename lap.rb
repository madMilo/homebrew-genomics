require 'formula'

class Lap < Formula
  head "svn://svn.code.sf.net/p/assembly-eval/code/trunk/src", :using => :svn
  
  depends_on "argp-standalone"

  def install
    cd "dynamic" do
      inreplace "mprobability.cpp" do |s|
        s.gsub! "last_region.end + read_sequence.length() + maximum_number_of_gaps", "static_cast<unsigned long>(last_region.end + read_sequence.length() + maximum_number_of_gaps)"
      end
      inreplace "probability.cpp" do |s|
        s.gsub! "last_region.end + read_sequence.length() + maximum_number_of_gaps", "static_cast<unsigned long>(last_region.end + read_sequence.length() + maximum_number_of_gaps)"
      end
      if OS.mac?
        ENV.append "CPPFLAGS", "-largp -L#{Formula["argp-standalone"].lib} -I#{Formula["argp-standalone"].include}"
        ENV.append "CXX", "-largp"
      end
      system "make"
    end
    prefix.install Dir["*"]
    #cd "doc" do
    #  system "make"
    #end
    #doc.mkpath
    #doc.install Dir["doc/*"]
    #bin.mkpath
    #bin.install Dir["src/*"]
    #share.mkpath
    #share.install Dir["example/*"]
    #share.install Dir["test/*"]
    #prefix.install "INSTALL","LICENSE","README","makefile"
  end
end

