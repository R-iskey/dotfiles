
function icon_map() {
  case "$1" in
  "Figma")
    echo ":figma:"
    ;;
  "Alacritty" | "iTerm2" | "Terminal" | "WezTerm")
    echo ":terminal:"
    ;;
  "App Store")
    echo ":app_store:"
    ;;
  "Discord" | "Discord Canary" | "Discord PTB")
    echo ":discord:"
    ;;
  "Code")
    echo ":code:"
    ;;
  "Microsoft Excel")
    echo ":microsoft_excel:"
    ;;
  "Microsoft PowerPoint")
    echo ":microsoft_power_point:"
    ;;
  "Telegram")
    echo ":telegram:"
    ;;
  "Reminders")
    echo ":reminders:"
    ;;
  "Finder")
    echo ":finder:"
    ;;
  "Notes")
    echo ":notes:"
    ;;
  "Spotlight")
    echo ":spotlight:"
    ;;
  "Linear")
    echo ":linear:"
    ;;
  "Chromium" | "Google Chrome" | "Google Chrome Canary")
    echo ":google_chrome:"
    ;;
  "GitHub Desktop")
    echo ":git_hub:"
    ;;
  "Firefox")
    echo ":firefox:"
    ;;
  "Slack")
    echo ":slack:"
    ;;
  "Color Picker")
    echo ":color_picker:"
    ;;
  "Default")
    echo ":default:"
    ;;
  "Pages")
    echo ":pages:"
    ;;
  "MAMP" | "MAMP PRO")
    echo ":mamp:"
    ;;
  "Canary Mail" | "Mail")
    echo ":mail:"
    ;;
  "WebStorm")
    echo ":web_storm:"
    ;;
  "VLC")
    echo ":vlc:"
    ;;
  "Music")
    echo ":music:"
    ;;
  "Calendar")
    echo ":calendar:"
    ;;
  "Microsoft Word")
    echo ":microsoft_word:"
    ;;
  "Safari"| "Safari Technology Preview")
    echo ":safari:"
    ;;
  "Xcode")
    echo ":xcode:"
    ;;
  "Numbers")
    echo ":numbers:"
    ;;
  "Arc")
    echo ":arc:"
    ;;
  "zoom.us")
    echo ":zoom:"
    ;;
  "Tor Browser")
    echo ":tor_browser:"
    ;;
  "Drafts")
    echo ":drafts:"
    ;;
  "Preview")
    echo ":pdf:"
    ;;
  "VSCodium")
    echo ":vscodium:"
    ;;
  "Firefox Developer Edition" | "Firefox Nightly")
    echo ":firefox_developer_edition:"
    ;;
  "Alfred")
    echo ":alfred:"
    ;;
  "Docker" | "Docker Desktop")
    echo ":docker:"
    ;;
  "Messages")
    echo ":messages:"
    ;;
  "Obsidian")
    echo ":obsidian:"
    ;;
  "IntelliJ IDEA")
    echo ":idea:"
    ;;
  "Microsoft Teams")
    echo ":microsoft_teams:"
    ;;
  "System Preferences" | "System Settings")
    echo ":gear:"
    ;;
  "WhatsApp")
    echo ":whats_app:"
    ;;
  "DBeaver")
    echo ":idea:"
    ;;
  "Yandex Music")
    echo ":music:"
    ;;
  *)
    echo ":default:"
    ;;
  esac
}
