### DON'T LOAD THE DEFAULT CONFIG ### 
config.load_autoconfig(False)

### BACKEND ###
c.backend = 'webengine'

### DOWNLOAD LOCATION ###
c.downloads.location.directory = '~/Downloads'

### ALWAYS SHOW TABS ###
c.tabs.show = 'always'

### COOKIES ###
config.set('content.cookies.accept', 'all', 'chrome-devtools://*')
config.set('content.cookies.accept', 'all', 'devtools://*')
config.set('content.headers.accept_language', '', 'https://matchmaker.krunker.io/*')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:136.0) Gecko/20100101 Firefox/139.0', 'https://accounts.google.com/*')

### ALLOW IMAGES ###
config.set('content.images', True, 'chrome-devtools://*')
config.set('content.images', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome-devtools://*')
config.set('content.javascript.enabled', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome://*/*')
config.set('content.javascript.enabled', True, 'qute://*/*')
config.set('content.local_content_can_access_remote_urls', True, 'file:///home/zakky/.local/share/qutebrowser/userscripts/*')
config.set('content.local_content_can_access_file_urls', False, 'file:///home/zakky/.local/share/qutebrowser/userscripts/*')
config.set('content.notifications.enabled', True, 'https://www.youtube.com')

### NO SCROLL BAR ###
c.scrolling.bar = 'never'
c.statusbar.show = 'never'

### NORD COLORS ###
c.colors.completion.fg = '#d8dee9'
c.colors.completion.odd.bg = '#3b4252'
c.colors.completion.even.bg = '#3b4252'
c.colors.completion.category.fg = '#e5e9f0'
c.colors.completion.category.bg = '#2e3440'
c.colors.completion.category.border.top = '#2e3440'
c.colors.completion.category.border.bottom = '#2e3440'
c.colors.completion.item.selected.fg = '#eceff4'
c.colors.completion.item.selected.bg = '#4c566a'
c.colors.completion.item.selected.border.top = '#4c566a'
c.colors.completion.item.selected.border.bottom = '#4c566a'
c.colors.completion.match.fg = '#ebcb8b'
c.colors.completion.scrollbar.fg = '#e5e9f0'
c.colors.completion.scrollbar.bg = '#3b4252'
c.colors.downloads.bar.bg = '#2e3440'
c.colors.downloads.stop.bg = '#b48ead'
c.colors.downloads.system.bg = 'none'
c.colors.downloads.error.fg = '#e5e9f0'
c.colors.downloads.error.bg = '#bf616a'
c.colors.hints.fg = '#2e3440'
c.colors.hints.bg = '#ebcb8b'
c.colors.hints.match.fg = '#5e81ac'
c.colors.keyhint.fg = '#e5e9f0'
c.colors.keyhint.suffix.fg = '#ebcb8b'
c.colors.keyhint.bg = '#3b4252'
c.colors.messages.error.fg = '#e5e9f0'
c.colors.messages.error.bg = '#bf616a'
c.colors.messages.error.border = '#bf616a'
c.colors.messages.warning.fg = '#e5e9f0'
c.colors.messages.warning.bg = '#d08770'
c.colors.messages.warning.border = '#d08770'
c.colors.messages.info.fg = '#e5e9f0'
c.colors.messages.info.bg = '#88c0d0'
c.colors.messages.info.border = '#88c0d0'
c.colors.prompts.fg = '#e5e9f0'
c.colors.prompts.border = '1px solid #2e3440'
c.colors.prompts.bg = '#434c5e'
c.colors.prompts.selected.bg = '#4c566a'
c.colors.statusbar.normal.fg = '#e5e9f0'
c.colors.statusbar.normal.bg = '#2e3440'
c.colors.statusbar.insert.fg = '#3b4252'
c.colors.statusbar.insert.bg = '#a3be8c'
c.colors.statusbar.passthrough.fg = '#e5e9f0'
c.colors.statusbar.passthrough.bg = '#5e81ac'
c.colors.statusbar.private.fg = '#e5e9f0'
c.colors.statusbar.private.bg = '#4c566a'
c.colors.statusbar.command.fg = '#e5e9f0'
c.colors.statusbar.command.bg = '#434c5e'
c.colors.statusbar.command.private.fg = '#e5e9f0'
c.colors.statusbar.command.private.bg = '#434c5e'
c.colors.statusbar.caret.fg = '#e5e9f0'
c.colors.statusbar.caret.bg = '#b48ead'
c.colors.statusbar.caret.selection.fg = '#e5e9f0'
c.colors.statusbar.caret.selection.bg = '#b48ead'
c.colors.statusbar.progress.bg = '#e5e9f0'
c.colors.statusbar.url.fg = '#e5e9f0'
c.colors.statusbar.url.error.fg = '#bf616a'
c.colors.statusbar.url.hover.fg = '#88c0d0'
c.colors.statusbar.url.success.http.fg = '#e5e9f0'
c.colors.statusbar.url.success.https.fg = '#a3be8c'
c.colors.statusbar.url.warn.fg = '#d08770'
c.colors.tabs.bar.bg = '#4c566a'
c.colors.tabs.indicator.error = '#bf616a'
c.colors.tabs.indicator.system = 'none'
c.colors.tabs.odd.fg = '#e5e9f0'
c.colors.tabs.odd.bg = '#4c566a'
c.colors.tabs.even.fg = '#e5e9f0'
c.colors.tabs.even.bg = '#4c566a'
c.colors.tabs.selected.odd.fg = '#e5e9f0'
c.colors.tabs.selected.odd.bg = '#2e3440'
c.colors.tabs.selected.even.fg = '#e5e9f0'
c.colors.tabs.selected.even.bg = '#2e3440'

### FONTS ###
c.fonts.default_family = 'Iosevka Nerd Font'
c.fonts.default_size = '12pt'
c.fonts.web.family.standard = 'Iosevka Nerd Font'
c.fonts.web.family.fixed = 'Iosevka Nerd Font'
c.fonts.web.family.serif = 'Iosevka Nerd Font'
c.fonts.web.family.sans_serif = 'Iosevka Nerd Font'
c.fonts.web.size.default = 16
c.fonts.web.size.default_fixed = 16
