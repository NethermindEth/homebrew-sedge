class Sedge < Formula
    app_version = 'v1.2.1'
    desc "A one click setup tool for PoS network/chain validators."
    homepage "https://docs.sedge.nethermind.io/"
    license "Apache License 2.0"
    version app_version

    case
    when OS.mac? && Hardware::CPU.intel?
      url "https://github.com/NethermindEth/sedge/releases/download/#{app_version}/sedge-#{app_version}-darwin-amd64"
      sha256 "adc3bbf033aa3304e965025c636e3aff02ecb1c30a12509f97ea985bb2da23f4"
    when OS.mac? && Hardware::CPU.arm?
      url "https://github.com/NethermindEth/sedge/releases/download/#{app_version}/sedge-#{app_version}-darwin-arm64"
      sha256 "f5b431814c5373d984442982b76c4ceda30984c02e87e1df8bc5f50a71893549"
    when OS.linux? && Hardware::CPU.intel?
      url "https://github.com/NethermindEth/sedge/releases/download/#{app_version}/sedge-#{app_version}-linux-amd64"        
      sha256 "e97f5fd6442707729dbf4ced2dbe7d84f7ba12ef8dc16c0eb4cde3ddd426442d"
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
