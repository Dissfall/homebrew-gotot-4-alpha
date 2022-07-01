cask "godot-4-alpha" do
    version "4.0-alpha11"
    sha256 "e703a88c6a484815d55c8c4a42718c5c00dd0a463101567dfbcc2a18cef2fe75"
  
    url "https://downloads.tuxfamily.org/godotengine/#{version.sub(/-alpha\d+/, "")}/#{version.minor.sub(/\d+-/, "")}/Godot_v#{version}_osx.universal.zip",
        verified: "downloads.tuxfamily.org/godotengine/"
    name "Godot Engine"
    desc "Game development engine"
    homepage "https://godotengine.org/"
  
    livecheck do
      url "https://downloads.tuxfamily.org/godotengine/#{version.major_minor}/"
      regex(/^alpha\d+$/i)
    end
  
    conflicts_with cask: "godot"
  
    app "Godot.app"
    binary "#{appdir}/Godot.app/Contents/MacOS/Godot", target: "godot"
  
    uninstall quit: "org.godotengine.godot"
  
    zap trash: [
      "~/Library/Application Support/Godot",
      "~/Library/Caches/Godot",
      "~/Library/Saved Application State/org.godotengine.godot.savedState",
    ]
  end