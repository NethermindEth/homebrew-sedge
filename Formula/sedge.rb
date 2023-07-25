class Sedge < Formula
    app_version = 'v1.2.2'
    desc "A one click setup tool for PoS network/chain validators."
    homepage "https://docs.sedge.nethermind.io/"
    license "Apache License 2.0"
    version app_version

    case
    when OS.mac? && Hardware::CPU.intel?
      url "https://github.com/NethermindEth/sedge/releases/download/#{app_version}/sedge-#{app_version}-darwin-amd64"
      sha256 "ad0b73b45e7c8c72a7e9c806ce1542c0c03fb961c09ff614e8c9611be1236850"
    when OS.mac? && Hardware::CPU.arm?
      url "https://github.com/NethermindEth/sedge/releases/download/#{app_version}/sedge-#{app_version}-darwin-arm64"
      sha256 "8947d96f8179ae47b6b876814800e4727683428faccb00841649dbfcfa0ab8af"
    when OS.linux? && Hardware::CPU.intel?
      url "https://github.com/NethermindEth/sedge/releases/download/#{app_version}/sedge-#{app_version}-linux-amd64"        
      sha256 "71371a206dc63a57a721f2debe4d68c30ac00356858c9cfb730af22c9d7fe6d6"
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
