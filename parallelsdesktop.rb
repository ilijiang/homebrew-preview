# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Parallelsdesktop < Formula
  desc ""
  homepage ""
  url "https://download.parallels.com/desktop/v16/16.3.2-50531/ParallelsDesktop-16.3.2-50531.dmg"
  sha256 "50cb03c5385fa5913e6e0fc00b978cd0722f8fa35e224d44b839173b7963e4f7"
  license ""

  # depends_on "cmake" => :build
  app "Parallels Desktop.app"
  
  preflight do
    system_command "chflags",
                   args: ["nohidden", "#{staged_path}/Parallels Desktop.app"]
    system_command "xattr",
                   args: ["-d", "com.apple.FinderInfo", "#{staged_path}/Parallels Desktop.app"]
  end

  postflight do
    system_command "#{appdir}/Parallels Desktop.app/Contents/MacOS/inittool",
                   args: ["init"],
                   sudo: true
  end

  uninstall_preflight do
    set_ownership "#{appdir}/Parallels Desktop.app"
  end

  # uninstall delete: [
  #  "/usr/local/bin/prl_convert",
  #  "/usr/local/bin/prl_disk_tool",
  #  "/usr/local/bin/prl_perf_ctl",
  #  "/usr/local/bin/prlcore2dmp",
  #  "/usr/local/bin/prlctl",
  #  "/usr/local/bin/prlexec",
  #  "/usr/local/bin/prlsrvctl",
  # ]

  zap trash: [
    "~/.parallels_settings",
    "~/Library/Application Scripts/com.parallels.desktop*",
    "~/Library/Caches/com.apple.helpd/Generated/com.parallels.desktop.console.help*",
    "~/Library/Caches/com.parallels.desktop.console",
    "~/Library/Caches/Parallels Software/Parallels Desktop",
    "~/Library/Containers/com.parallels.desktop*",
    "~/Library/Logs/parallels.log",
    "~/Library/Parallels/Parallels Desktop",
    "~/Library/Preferences/com.parallels.desktop.console.LSSharedFileList.plist",
    "~/Library/Preferences/com.parallels.desktop.console.plist",
    "~/Library/Preferences/com.parallels.Parallels Desktop Statistics.plist",
    "~/Library/Preferences/com.parallels.Parallels Desktop Events.plist",
    "~/Library/Preferences/com.parallels.Parallels Desktop.plist",
    "~/Library/Preferences/com.parallels.Parallels.plist",
    "~/Library/Preferences/com.parallels.PDInfo.plist",
  ]

  # def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    system "./configure", *std_configure_args, "--disable-silent-rules"
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
  # end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test ParallelsDesktop`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
