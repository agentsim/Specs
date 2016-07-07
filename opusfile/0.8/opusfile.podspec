Pod::Spec.new do |s|

s.name = "opusfile"
s.version = "0.8"
s.summary = "opusfile 0.8"

s.license = { :type => "BSD", :text => <<-LICENSE
Copyright (c) 1994-2013 Xiph.Org Foundation and contributors

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:

- Redistributions of source code must retain the above copyright
notice, this list of conditions and the following disclaimer.

- Redistributions in binary form must reproduce the above copyright
notice, this list of conditions and the following disclaimer in the
documentation and/or other materials provided with the distribution.

- Neither the name of the Xiph.Org Foundation nor the names of its
contributors may be used to endorse or promote products derived from
this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE FOUNDATION
OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

LICENSE
}

s.author = { "Opus Codec" => "opus@xiph.org" }
s.homepage = "https://www.opus-codec.org/development/"

s.platform = :ios, '8.0'
s.requires_arc = false
s.dependency 'libopus'
s.dependency 'libogg', '>=1.0'

s.source = { :git => "https://git.xiph.org/opusfile.git", :tag => 'v0.8' }
s.prepare_command = <<-CMD
		cd include
		sed -i opusfile.h 's/opus_multistream/libopus\\/opus_multistream/g' opusfile.h
    CMD

s.source_files = '{src,include}/*.{h,c}'
s.public_header_files = "include/*.h"
s.private_header_files = "src/*.h"

s.pod_target_xcconfig = { "CLANG_ENABLE_MODULES" => "NO" }

end
