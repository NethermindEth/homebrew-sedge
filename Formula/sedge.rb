class Sedge < Formula
    app_version = '0.3.0'
    desc "A one click setup tool for PoS network/chain validators."
    homepage "https://docs.sedge.nethermind.io/"
    license "Apache License 2.0"
    version app_version

    case
    when OS.mac? && Hardware::CPU.intel?
      url "https://github.com/NethermindEth/sedge/releases/download/v#{app_version}/sedge-v#{app_version}-darwin-amd64"
      sha256 "a6b0c849489204d0feb32edbc831a1e3bdee920e5648bc543e7407fe3a97671f"
    when OS.mac? && Hardware::CPU.arm?
      url "https://github.com/NethermindEth/sedge/releases/download/v#{app_version}/sedge-v#{app_version}-darwin-arm64"
      sha256 "c48995bd42a62e1b2163869a5b62b3f86580da123920cc997339000f6c24439f"
    when OS.linux? && Hardware::CPU.intel?
      url "https://github.com/NethermindEth/sedge/releases/download/v#{app_version}/sedge-v#{app_version}-linux-amd64"        
      sha256 "b9322e84b96ad0de1556e2d969e35ffc5933cdef8d6088869e0edf4d579ac977"
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
