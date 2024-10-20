import subprocess
import os
from qutebrowser.api import interceptor

"""
qutebrowser settings for video
for more settings check out
https://qutebrowser.org/doc/help/settings.html
"""

# ================== Youtube Add Blocking ======================= {{{
def filter_yt(info: interceptor.Request):
    """Block the given request if necessary."""
    url = info.request_url
    if (
        url.host() == "www.youtube.com"
        and url.path() == "/get_video_info"
        and "&adformat=" in url.query()
    ):
        info.block()


interceptor.register(filter_yt)

# Autogenerated config.py
#
# NOTE: config.py is intended for advanced users who are comfortable
# with manually migrating the config file on qutebrowser upgrades. If
# you prefer, you can also configure qutebrowser using the
# :set/:bind/:config-* commands without having to write a config.py
# file.
#
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

# Change the argument to True to still load settings configured via autoconfig.yml
config.load_autoconfig(False)

# Which cookies to accept. With QtWebEngine, this setting also controls
# other features with tracking capabilities similar to those of cookies;
# including IndexedDB, DOM storage, filesystem API, service workers, and
# AppCache. Note that with QtWebKit, only `all` and `never` are
# supported as per-domain values. Setting `no-3rdparty` or `no-
# unknown-3rdparty` per-domain on QtWebKit will have the same effect as
# `all`. If this setting is used with URL patterns, the pattern gets
# applied to the origin/first party URL of the page making the request,
# not the request URL. With QtWebEngine 5.15.0+, paths will be stripped
# from URLs, so URL patterns using paths will not match. With
# QtWebEngine 5.15.2+, subdomains are additionally stripped as well, so
# you will typically need to set this setting for `example.com` when the
# cookie is set on `somesubdomain.example.com` for it to work properly.
# To debug issues with this setting, start qutebrowser with `--debug
# --logfilter network --debug-flag log-cookies` which will show all
# cookies being set.
# Type: String
# Valid values:
#   - all: Accept all cookies.
#   - no-3rdparty: Accept cookies from the same origin only. This is known to break some sites, such as GMail.
#   - no-unknown-3rdparty: Accept cookies from the same origin only, unless a cookie is already set for the domain. On QtWebEngine, this is the same as no-3rdparty.
#   - never: Don't accept cookies at all.
config.set('content.cookies.accept', 'all', 'chrome-devtools://*')

# Which cookies to accept. With QtWebEngine, this setting also controls
# other features with tracking capabilities similar to those of cookies;
# including IndexedDB, DOM storage, filesystem API, service workers, and
# AppCache. Note that with QtWebKit, only `all` and `never` are
# supported as per-domain values. Setting `no-3rdparty` or `no-
# unknown-3rdparty` per-domain on QtWebKit will have the same effect as
# `all`. If this setting is used with URL patterns, the pattern gets
# applied to the origin/first party URL of the page making the request,
# not the request URL. With QtWebEngine 5.15.0+, paths will be stripped
# from URLs, so URL patterns using paths will not match. With
# QtWebEngine 5.15.2+, subdomains are additionally stripped as well, so
# you will typically need to set this setting for `example.com` when the
# cookie is set on `somesubdomain.example.com` for it to work properly.
# To debug issues with this setting, start qutebrowser with `--debug
# --logfilter network --debug-flag log-cookies` which will show all
# cookies being set.
# Type: String
# Valid values:
#   - all: Accept all cookies.
#   - no-3rdparty: Accept cookies from the same origin only. This is known to break some sites, such as GMail.
#   - no-unknown-3rdparty: Accept cookies from the same origin only, unless a cookie is already set for the domain. On QtWebEngine, this is the same as no-3rdparty.
#   - never: Don't accept cookies at all.
config.set('content.cookies.accept', 'all', 'devtools://*')

# Value to send in the `Accept-Language` header. Note that the value
# read from JavaScript is always the global value.
# Type: String
config.set('content.headers.accept_language', '', 'https://matchmaker.krunker.io/*')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}', 'https://web.whatsapp.com/')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:90.0) Gecko/20100101 Firefox/90.0', 'https://accounts.google.com/*')

# Load images automatically in web pages.
# Type: Bool
config.set('content.images', True, 'chrome-devtools://*')

# Load images automatically in web pages.
# Type: Bool
config.set('content.images', True, 'devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome-devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome://*/*')

# Setting dark mode
# config.set("colors.webpage.darkmode.enabled", True)

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'qute://*/*')

# Allow locally loaded documents to access remote URLs.
# Type: Bool
config.set('content.local_content_can_access_remote_urls', True, 'file:///home/rendi/.local/share/qutebrowser/userscripts/*')

# Allow locally loaded documents to access other local URLs.
# Type: Bool
config.set('content.local_content_can_access_file_urls', False, 'file:///home/rendi/.local/share/qutebrowser/userscripts/*')

# Bindings for normal mode
config.bind("M", 'hint links spawn mpv {hint-url}')
config.bind("Z", 'hint links spawn st -e youtube-dl {hint-url}')
config.bind("t", 'set-cmd-text -s :open -t')
config.bind("xb", 'config-cycle statusbar.show always never')
config.bind("xt", 'config-cycle tabs.show always never')
config.bind("xx", 'config-cycle statusbar.show always never;; config-cycle tabs.show always never')

config.bind('<Ctrl-1>', "tab-select 1")
config.bind('<Ctrl-2>', "tab-select 2")
config.bind('<Ctrl-3>', "tab-select 3")
config.bind('<Ctrl-4>', "tab-select 4")
config.bind('<Ctrl-5>', "tab-select 5")
config.bind('<Ctrl-6>', "tab-select 6")
config.bind('<Ctrl-7>', "tab-select 7")
config.bind('<Ctrl-8>', "tab-select 8")
config.bind('<Ctrl-9>', "tab-select 9")
config.bind('<Ctrl-0>', "tab-select 0")

# Go to next tab
config.bind(']t', 'tab-next')

# Go to previous tab
config.bind('[t', 'tab-prev')

# Move cursor left
config.bind('<Ctrl-h>', 'fake-key <Left>', 'insert')

# Move cursor right
config.bind('<Ctrl-l>', 'fake-key <Right>', 'insert')

# Move cursor up
config.bind('<Ctrl-p>', 'fake-key <Up>', 'insert')

# Move cursor down
config.bind('<Ctrl-n>', 'fake-key <Down>', 'insert')

# Delete the character before the cursor
config.bind('<Ctrl-d>', 'fake-key <Delete>', 'insert')

# Delete the word before the cursor (Ctrl+w in Vim)
config.bind('<Ctrl-w>', 'fake-key <Ctrl-Backspace>', 'insert')

config.bind("<Ctrl-i>", "fake-key <Home>", "insert")
config.bind("<Ctrl-a>", "fake-key <End>", "insert")

# Delete the word after the cursor 
config.bind('<Ctrl-D>', 'fake-key <Ctrl-Delete>', 'insert')

# Delete from the cursor to the beginning of the line (Ctrl+u in Vim)
config.bind('<Ctrl-u>', 'fake-key <Shift-Home><Delete>', 'insert')

# Delete from the cursor to the end of the line (Ctrl+k in Vim)
config.bind('<Ctrl-k>', 'fake-key <Shift-End><Delete>', 'insert')

# config.set("fileselect.handler", "external")
# config.set("fileselect.single_file.command", ['alacritty', '--class', 'ranger,ranger', '-e', 'ranger', '--choosefile', '{}'])
# config.set("fileselect.multiple_files.command", ['alacritty', '--class', 'ranger,ranger', '-e', 'ranger', '--choosefiles', '{}'])


