class CarthagePro < Formula
  desc "Decentralized dependency manager for Cocoa, Pro Version."
  homepage "https://github.com/Dschee/Carthage"
  url "https://github.com/Dschee/Carthage.git",
      :tag => "1.0.0",
      :revision => "cd87e8650a0dbcbaa8a037ee4b3e05929fdafb45",
      :shallow => false
  head "https://github.com/Dschee/Carthage.git", :shallow => false

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
