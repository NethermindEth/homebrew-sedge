class Sedge < Formula
    app_version = '0.5.1'
    desc "A one click setup tool for PoS network/chain validators."
    homepage "https://docs.sedge.nethermind.io/"
    license "Apache License 2.0"
    version app_version

    case
    when OS.mac? && Hardware::CPU.intel?
      url "https://github.com/NethermindEth/sedge/releases/download/v#{app_version}/sedge-v#{app_version}-darwin-amd64"
      sha256 "2a0356b7ac6744841716e02de1ab121d156870e9d8c855f81de43f2ad38f57a1"
    when OS.mac? && Hardware::CPU.arm?
      url "https://github.com/NethermindEth/sedge/releases/download/v#{app_version}/sedge-v#{app_version}-darwin-arm64"
      sha256 "76c107858b5dfe69762e5fcc3f984beefba31e23c64958531ae40fe435adecfd"
    when OS.linux? && Hardware::CPU.intel?
      url "https://github.com/NethermindEth/sedge/releases/download/v#{app_version}/sedge-v#{app_version}-linux-amd64"        
      sha256 "858281a5b508415879969b38cce96864c68db8e83cd5a527f472b7feea683f0a"
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
