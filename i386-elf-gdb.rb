require 'formula'

class I386ElfGdb < Formula
  homepage "https://www.gnu.org/software/gdb/"
  url "https://ftpmirror.gnu.org/gdb/gdb-7.11.1.tar.xz"
  mirror "https://ftp.gnu.org/gnu/gdb/gdb-7.11.1.tar.xz"
  sha256 "e9216da4e3755e9f414c1aa0026b626251dfc57ffe572a266e98da4f6988fc70"

  depends_on 'i386-elf-binutils'
  depends_on 'i386-elf-gcc'

  def install
    ENV['CC'] = '/usr/local/opt/gcc/bin/gcc-6'
    ENV['CXX'] = '/usr/local/opt/gcc/bin/g++-6'
    ENV['CPP'] = '/usr/local/opt/gcc/bin/cpp-6'
    ENV['LD'] = '/usr/local/opt/gcc/bin/gcc-6'

    mkdir 'build' do
      system '../configure', '--target=i386-elf', "--prefix=#{prefix}", "--disable-werror", "--with-python=/usr"
      system 'make'
      system 'make install'
      FileUtils.rm_rf share/"locale"
    end
  end
end