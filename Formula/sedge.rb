class Sedge < Formula
    app_version = '0.6.0'
    desc "A one click setup tool for PoS network/chain validators."
    homepage "https://docs.sedge.nethermind.io/"
    license "Apache License 2.0"
    version app_version

    case
    when OS.mac? && Hardware::CPU.intel?
      url "https://github.com/NethermindEth/sedge/releases/download/v#{app_version}/sedge-v#{app_version}-darwin-amd64"
      sha256 "35c2e2c245f60d37be41fa420264bdaa0e7a419c4d19ce8ff1083288684569ec"
    when OS.mac? && Hardware::CPU.arm?
      url "https://github.com/NethermindEth/sedge/releases/download/v#{app_version}/sedge-v#{app_version}-darwin-arm64"
      sha256 "c5a862f879b7095bf215def06f7db5ee785a55beae669b37fda2a25477b2c68b"
    when OS.linux? && Hardware::CPU.intel?
      url "https://github.com/NethermindEth/sedge/releases/download/v#{app_version}/sedge-v#{app_version}-linux-amd64"        
      sha256 "3372ff37dfae045b8b64842aa94f93e48cd36251cc286947e4a21fd79ba32dae"
    else
      odie "Unexpected platform!"
    end

    def install
      if OS.mac? && Hardware::CPU.intel?
        File.rename("./sedge-v#{version}-darwin-amd64","./sedge")
      end
      if OS.mac? && Hardware::CPU.arm?
        File.rename("./sedge-v#{version}-darwin-arm64","./sedge")
      end
      if OS.linux? && Hardware::CPU.intel?
        File.rename("./sedge-v#{version}-linux-amd64","./sedge")
      end
      bin.install Dir['./sedge']
    end

    test do
      system "false"
    end
  end
