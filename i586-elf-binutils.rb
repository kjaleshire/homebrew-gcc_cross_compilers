require 'formula'

class I586ElfBinutils < Formula
  homepage 'http://gcc.gnu.org'
  url 'http://ftp.gnu.org/gnu/binutils/binutils-2.26.tar.gz'
  sha1 'f10c64e92d9c72ee428df3feaf349c4ecb2493bd'

  depends_on 'gcc' => :build
  def install
    ENV['CC'] = '/usr/local/opt/gcc/bin/gcc-5'
    ENV['CXX'] = '/usr/local/opt/gcc/bin/g++-5'
    ENV['CPP'] = '/usr/local/opt/gcc/bin/cpp-5'
    ENV['LD'] = '/usr/local/opt/gcc/bin/gcc-5'

    mkdir 'build' do
      system '../configure', '--disable-nls', '--target=i586-elf','--disable-werror',
                             '--enable-gold=yes',
                             "--prefix=#{prefix}"
      system 'make all'
      system 'make install'
    end
  end

end
