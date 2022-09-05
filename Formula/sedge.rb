class Sedge < Formula
    app_version = '0.2.0'
    desc "A one click setup tool for PoS network/chain validators."
    homepage "https://docs.sedge.nethermind.io/"
    license "Apache License 2.0"
    version app_version

    case
    when OS.mac? && Hardware::CPU.intel?
      url "https://github.com/NethermindEth/sedge/releases/download/v#{app_version}/sedge-v#{app_version}-darwin-amd64"
      sha256 "581b7cfba3635a344e233ecebaa2375cb74a334fd19ec1edc7a06955af08b0c0"
    when OS.mac? && Hardware::CPU.arm?
      url "https://github.com/NethermindEth/sedge/releases/download/v#{app_version}/sedge-v#{app_version}-darwin-arm64"
      sha256 "ec886b0bc9e6950868295340d71fe310128d11a37bebec8a93affa82e5fa439c"
    when OS.linux? && Hardware::CPU.intel?
      url "https://github.com/NethermindEth/sedge/releases/download/v#{app_version}/sedge-v#{app_version}-linux-amd64"        
      sha256 "acefa1f7535c10796e04fdfc4e1e41e9c648e23bd232505b2074f90aca9d329f"
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