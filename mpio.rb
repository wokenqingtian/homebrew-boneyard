class Mpio < Formula
  homepage "https://github.com/frsyuki/mpio"
  url "https://github.com/downloads/frsyuki/mpio/mpio-0.3.7.tar.gz"
  sha256 "ff5c1c3fc901290e73556839c0563de8aa29d6179b9f274f21582587e0c7da2a"

  fails_with :clang do
    cause <<-EOS.undent
      In file included from ./wavy_loop.h:23:
      ./wavy_kernel.h:50:10: fatal error: './ wavy_kernel_kqueue.h' file not found
      #include MP_WAVY_KERNEL_HEADER(MP_WAVY_KERNEL)
      ^
      ./wavy_kernel.h:44:2: note: expanded from macro 'MP_WAVY_KERNEL_HEADER'
    EOS
  end

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end
end
