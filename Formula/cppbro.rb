class Cppbro < Formula
  desc "C++ project generator for modern CMake, Ninja, clangd, build, run, and clean workflows"
  homepage "https://github.com/Roozbeh-Sdtz/cppbro"
  url "https://github.com/Roozbeh-Sdtz/cppbro/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "3948c3e6bd06c7a30ac2f9a8cbba818dae926ee3276d9440c9fa18a9c52542dd"
  license "MIT"

  depends_on "rust" => :build
  depends_on "cmake"
  depends_on "ninja"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"cppbro", "--version"
    system bin/"cppbro", "new", "Smoke", "--no-readme"
    assert_path_exists testpath/"Smoke/CMakeLists.txt"
  end
end
