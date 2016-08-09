require 'formula'

class X8664ElfBinutils < Formula
  homepage 'http://gcc.gnu.org'
  url 'http://ftp.gnu.org/gnu/binutils/binutils-2.26.tar.gz'
  sha256 '9615feddaeedc214d1a1ecd77b6697449c952eab69d79ab2125ea050e944bcc1'

  depends_on 'gcc' => :build
  def install
    ENV['CC'] = '/usr/local/opt/gcc/bin/gcc-6'
    ENV['CXX'] = '/usr/local/opt/gcc/bin/g++-6'
    ENV['CPP'] = '/usr/local/opt/gcc/bin/cpp-6'
    ENV['LD'] = '/usr/local/opt/gcc/bin/gcc-6'

    mkdir 'build' do
      system '../configure', '--disable-nls', '--target=x86_64-elf','--disable-werror',
                             '--enable-gold=yes',
                             "--prefix=#{prefix}"
      system 'make all'
      system 'make install'

    end
  end

end
