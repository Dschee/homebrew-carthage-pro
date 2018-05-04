class CarthagePro < Formula
  desc "Decentralized dependency manager for Cocoa, Pro Version."
  homepage "https://github.com/Dschee/Carthage"
  url "https://github.com/Dschee/Carthage/archive/1.0.0.tar.gz"
  sha256 "9ec243726bb86e65037adb2d222eb596236e34bbaadb55e36c2c4cfd2bc4f6df"

  depends_on :xcode => ["9.0", :build]

  def install
    system "make", "prefix_install", "PREFIX=#{prefix}"
    bash_completion.install "Source/Scripts/carthage-bash-completion" => "carthage"
    zsh_completion.install "Source/Scripts/carthage-zsh-completion" => "_carthage"
    fish_completion.install "Source/Scripts/carthage-fish-completion" => "carthage.fish"
  end

  test do
    (testpath/"Cartfile").write 'github "jspahrsummers/xcconfigs"'
    system bin/"carthage", "update"
  end
end
