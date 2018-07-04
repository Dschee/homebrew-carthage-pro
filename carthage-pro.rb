class CarthagePro < Formula
  desc "Decentralized dependency manager for Cocoa, Pro Version."
  homepage "https://github.com/Dschee/Carthage"
  url "https://github.com/Dschee/Carthage.git",
      :tag => "1.1.0",
      :revision => "cc503c0c78716cdef1e91829a6d65d8e9bb7cacb",
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
