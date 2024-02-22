class Sedge < Formula
    app_version = 'v1.3.1'
    desc "A one click setup tool for PoS network/chain validators."
    homepage "https://docs.sedge.nethermind.io/"
    license "Apache License 2.0"
    version app_version

    case
    when OS.mac? && Hardware::CPU.intel?
      url "https://github.com/NethermindEth/sedge/releases/download/#{app_version}/sedge-#{app_version}-darwin-amd64"
      sha256 "cb1ae5f4c5577d36fa25d5a9484acd480e867749960f0b56245b373dd1d3cb60"
    when OS.mac? && Hardware::CPU.arm?
      url "https://github.com/NethermindEth/sedge/releases/download/#{app_version}/sedge-#{app_version}-darwin-arm64"
      sha256 "fd25faf05b5ad19b4b01894928f06a1c73c3f431f8b7e87f0826fa1604614b1a"
    when OS.linux? && Hardware::CPU.intel?
      url "https://github.com/NethermindEth/sedge/releases/download/#{app_version}/sedge-#{app_version}-linux-amd64"        
      sha256 "5d5a3451afc671dc1244e6d5951f34780a6b1f3b6ad36e41eac4915c8d114532"
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
