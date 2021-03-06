class Btpd < Formula
  desc "BitTorrent protocol daemon"
  homepage "https://github.com/btpd/btpd"
  url "https://github.com/downloads/btpd/btpd/btpd-0.16.tar.gz"
  sha1 "fb7d396ed5c224dc6e743ac481e4feb4a3cf7b75"
  bottle do
    cellar :any
    sha1 "4d71a2e91abdcd9040d0941fe72d7a19af3c35e5" => :yosemite
    sha1 "bca4ea6ffeed653d4aa86d6128c8a1f84aafd0b2" => :mavericks
    sha1 "b775479e515592aff7253ff6a0b804aec661e777" => :mountain_lion
  end

  revision 1

  depends_on "openssl"

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    assert_match /Torrents can be specified/, pipe_output("#{bin}/btcli --help 2>&1")
  end
end
