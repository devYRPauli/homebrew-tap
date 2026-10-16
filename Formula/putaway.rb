class Putaway < Formula
  desc "Files what is in a folder into the folders you already have"
  homepage "https://github.com/devYRPauli/putaway"
  url "https://github.com/devYRPauli/putaway/releases/download/v0.1.0/Putaway.zip"
  sha256 "4ddcfacc0243dc394822e387511e18235c9bdb16487f462cc06d1167a6c28ebc"
  version "0.1.0"
  license "MIT"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  def install
    # Homebrew unpacks the zip and runs install from inside Putaway.app.
    (prefix/"Putaway.app").install Dir["*"]
    bin.write_exec_script prefix/"Putaway.app/Contents/Helpers/putaway"
  end

  def caveats
    <<~TEXT
      To open the app now and add it to ~/Applications:
        ln -sf #{opt_prefix}/Putaway.app ~/Applications/Putaway.app
        open ~/Applications/Putaway.app
    TEXT
  end

  test do
    assert_match "usage", shell_output("#{bin}/putaway")
  end
end
