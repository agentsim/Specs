Pod::Spec.new do |s|

s.name = "SoXr"
s.version = "0.1.2"
s.summary = "The SoX Resampler Library"
s.license = { :type => "LGPL" }

s.author = { "SoX" => "sox-devel@lists.sourceforge.net" }
s.homepage = "http://sox.sourceforge.net/"

s.platform = :ios, '8.0'
s.requires_arc = false

s.source = { :git => "http://git.code.sf.net/p/soxr/code", :tag => "0.1.2" }
s.prepare_command = <<-CMD
		mv soxr-config.h.in soxr-config.h
		sed -i soxr-config.h.bak s/\@HAVE_SINGLE_PRECISION\@/1/g soxr-config.h
		sed -i soxr-config.h.bak s/\@HAVE_DOUBLE_PRECISION\@/1/g soxr-config.h
		sed -i soxr-config.h.bak s/\@HAVE_AVFFT\@/0/g soxr-config.h
		sed -i soxr-config.h.bak s/\@HAVE_SIMD\@/0/g soxr-config.h
		sed -i soxr-config.h.bak s/\@HAVE_FENV_H\@/1/g soxr-config.h
		sed -i soxr-config.h.bak s/\@HAVE_LRINT\@/1/g soxr-config.h
		sed -i soxr-config.h.bak s/\@WORDS_BIGENDIAN\@/0/g soxr-config.h
        sed -i .bak 's/#error//g' src/pffft.c
        mv src/simd-dev.h src/simd-dev.h.bak
        awk '/PFFT_MACROS_ONLY/{print "#ifndef __arm__";print "#define __arm__";print "#endif"}1' src/simd-dev.h.bak > src/simd-dev.h
    CMD

s.source_files  = "src/*.{h,c}", "soxr-config.h"
s.public_header_files = "src/soxr.h"
s.exclude_files = "src/avfft*", "src/*lsr*", "src/pffft32*"
s.compiler_flags = '-DSOXR_LIB', '-Wno-unused-function', '-Wno-unreachable-code'

end
