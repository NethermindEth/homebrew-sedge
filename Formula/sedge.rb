class Sedge < Formula
    app_version = 'v1.7.2'
    desc "A one click setup tool for PoS network/chain validators."
    homepage "https://docs.sedge.nethermind.io/"
    license "Apache License 2.0"
    version app_version

    case
    when OS.mac? && Hardware::CPU.intel?
      url "https://github.com/NethermindEth/sedge/releases/download/#{app_version}/sedge-#{app_version}-darwin-amd64"
      sha256 "7a1e12900064adf8cb59b610d11fb9c166616b2208b4db1866cc337efc2bee61"
    when OS.mac? && Hardware::CPU.arm?
      url "https://github.com/NethermindEth/sedge/releases/download/#{app_version}/sedge-#{app_version}-darwin-arm64"
      sha256 "9f36731d1e61c14586337672f628287ae7e702ca94ee7e8b4552bec910601823"
    when OS.linux? && Hardware::CPU.intel?
      url "https://github.com/NethermindEth/sedge/releases/download/#{app_version}/sedge-#{app_version}-linux-amd64"        
      sha256 "0eae38ba621529f452737ade7f96de444ae4ffe37e06fdfca20be216901aa4f3"
    else
      odie "Unexpected platform!"
    end

    def install
      if OS.mac? && Hardware::CPU.intel?
        File.rename("./sedge-#{version}-darwin-amd64","./sedge")
      end
      if OS.mac? && Hardware::CPU.arm?
        File.rename("./sedge-#{version}-darwin-arm64","./sedge")
      end
      if OS.linux? && Hardware::CPU.intel?
        File.rename("./sedge-#{version}-linux-amd64","./sedge")
      end
      bin.install Dir['./sedge']
    end

    test do
      system "false"
    end
  end
