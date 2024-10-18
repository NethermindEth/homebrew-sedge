class Sedge < Formula
    app_version = 'v1.6.0'
    desc "A one click setup tool for PoS network/chain validators."
    homepage "https://docs.sedge.nethermind.io/"
    license "Apache License 2.0"
    version app_version

    case
    when OS.mac? && Hardware::CPU.intel?
      url "https://github.com/NethermindEth/sedge/releases/download/#{app_version}/sedge-#{app_version}-darwin-amd64"
      sha256 "077f69a7d1fdcda7b29f2c00bcdb365ec41ddd2ac7daf1c597c7fa2ee2317504"
    when OS.mac? && Hardware::CPU.arm?
      url "https://github.com/NethermindEth/sedge/releases/download/#{app_version}/sedge-#{app_version}-darwin-arm64"
      sha256 "90f3ec1aa44914544dbf89833de5bb152d814ed6a8479e8fb96d6617c25565c0"
    when OS.linux? && Hardware::CPU.intel?
      url "https://github.com/NethermindEth/sedge/releases/download/#{app_version}/sedge-#{app_version}-linux-amd64"        
      sha256 "1af747807e700382f787b17de1a86705bc802daa3f895753be3b45070444cb15"
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
