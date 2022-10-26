class Sedge < Formula
    app_version = '0.4.0'
    desc "A one click setup tool for PoS network/chain validators."
    homepage "https://docs.sedge.nethermind.io/"
    license "Apache License 2.0"
    version app_version

    case
    when OS.mac? && Hardware::CPU.intel?
      url "https://github.com/NethermindEth/sedge/releases/download/v#{app_version}/sedge-v#{app_version}-darwin-amd64"
      sha256 "b58cba4ae540ce8e253713793b21cd9dadd422a19388d5a917a046d55ce3d146"
    when OS.mac? && Hardware::CPU.arm?
      url "https://github.com/NethermindEth/sedge/releases/download/v#{app_version}/sedge-v#{app_version}-darwin-arm64"
      sha256 "9695dae42541e58d7d45b7b20f0734cee7d837c7f5e21b3552f8330804b19cb0"
    when OS.linux? && Hardware::CPU.intel?
      url "https://github.com/NethermindEth/sedge/releases/download/v#{app_version}/sedge-v#{app_version}-linux-amd64"        
      sha256 "acf899d3e5b501341e859098b3e299b23b77f61d8c5bf607b8893690e7cefa6f"
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
