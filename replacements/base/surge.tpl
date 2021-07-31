{% if request.target == "surge" %}

[General]
# 通用设置

# > 增强版 Wi-Fi 助理
# (在 Wi-Fi 网络不佳时尝试使用数据网络建立连接，请仅当使用不限量的数据流量时开启)
wifi-assist = false
# > Internet 测试 URL
internet-test-url = http://wifi.vivo.com.cn/generate_204
# > 代理测速 URL
proxy-test-url = http://cp.cloudflare.com/generate_204
# > 测试超时（秒）
test-timeout = 5
# > TLS 引擎
tls-provider = openssl

# > 自定义 GeoIP 数据库
geoip-maxmind-url = https://raw.githubusercontent.com/JMVoid/ipip2mmdb/release/Country.mmdb
# > IPv6 支持（默认关闭）
ipv6 = false
# > 允许 Wi-Fi 访问 (仅 iOS，若允许远程访问将「false」改为「true」)
allow-wifi-access = false
wifi-access-http-port = 6152
wifi-access-socks5-port = 6153
# > 允许 Wi-Fi 访问 (仅 macOS，若允许远程访问将「127.0.0.1」改为「0.0.0.0」)
http-listen = 127.0.0.1:6152
socks5-listen = 127.0.0.1:6153

# > 兼容模式 (仅 iOS)
# compatibility-mode = 0
# > 跳过代理
skip-proxy = 127.0.0.1,192.168.0.0/16,10.0.0.0/8,172.16.0.0/12,100.64.0.0/10,localhost,*.local,e.crashlytics.com,captive.apple.com,::ffff:0:0:0:0/1,::ffff:128:0:0:0/1
# > 排除简单主机名
exclude-simple-hostnames = true
# > Network framwork
network-framework = false
# > DNS 服务器 (如无必要不建议使用 DNS over HTTPS)
dns-server = 119.29.29.29, 223.5.5.5, system
# > 从 /etc/hosts 读取 DNS 记录
# read-etc-hosts = true

# 高级设置
# > 日志级别
loglevel = notify
# > 当遇到 REJECT 策略时返回错误页
show-error-page-for-reject = true

# > Always Real IP Hosts
always-real-ip = msftconnecttest.com, msftncsi.com, *.msftconnecttest.com, *.msftncsi.com, *.srv.nintendo.net, *.stun.playstation.net, xbox.*.microsoft.com, *.xboxlive.com, *.battlenet.com.cn, *.battlenet.com, *.blzstatic.cn, *.battle.net
# > TCP Force HTTP Hosts
# KOOWO - 123.59.31.1,119.18.193.135, 122.14.246.33, 175.102.178.52
# TencentVideo - 116.253.24.*, 175.6.26.*, 220.169.153.*
# force-http-engine-hosts = *.ott.cibntv.net, 123.59.31.1,119.18.193.135, 122.14.246.33, 175.102.178.52, 116.253.24.*, 175.6.26.*, 220.169.153.*
# > VIF Excluded Routes
tun-excluded-routes = 192.168.0.0/16, 10.0.0.0/8, 172.16.0.0/12

[Replica]
# 0 为关闭，1 为开启
# > 隐藏 Apple 请求
hide-apple-request = 0
# > 隐藏崩溃追踪器请求
hide-crash-reporter-request = 1
# > 隐藏 UDP 会话
hide-udp = 0
# > 关键词过滤器
# none（关闭关键词过滤器） / whitelist（blacklist（仅记录包含关键字的请求）） / blacklist（仅记录不包含关键字的请求） / pattern（匹配通配符的请求）
# keyword-filter-type = none
# > 关键词
# keyword-filter = (null)
[Rule]
RULE-SET,https://raw.githubusercontent.com/DivineEngine/Profiles/master/Surge/Ruleset/Guard/Advertising.list,🛡️ 广告拦截
DOMAIN-SET,https://raw.githubusercontent.com/DivineEngine/Profiles/master/Surge/Ruleset/Guard/AdvertisingPlus.list,🛡️ 广告拦截
RULE-SET,https://raw.githubusercontent.com/Gavin1997/gavinsurge/main/Rule/guardBlock.list,🛡️ 广告拦截
RULE-SET,https://raw.githubusercontent.com/DivineEngine/Profiles/master/Surge/Ruleset/Guard/Privacy.list,🛡️ 运营劫持
RULE-SET,https://raw.githubusercontent.com/DivineEngine/Profiles/master/Surge/Ruleset/Guard/Hijacking.list,🛡️ 运营劫持
RULE-SET,https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/LocalAreaNetwork.list,🇺🇳 全球直连
RULE-SET,https://raw.githubusercontent.com/DivineEngine/Profiles/master/Surge/Ruleset/Unbreak.list,🇺🇳 全球直连
RULE-SET,https://raw.githubusercontent.com/DivineEngine/Profiles/master/Surge/Ruleset/StreamingMedia/Video/Netflix.list,🎥 NETFLIX
RULE-SET,https://raw.githubusercontent.com/Gavin1997/gavinsurge/main/Rule/disneyplys.list,🐻 disneyplus
RULE-SET,https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Porn.list,🔞 porn
RULE-SET,https://raw.githubusercontent.com/DivineEngine/Profiles/master/Surge/Ruleset/StreamingMedia/Video/YouTube.list,🎬 YouTube
RULE-SET,https://raw.githubusercontent.com/DivineEngine/Profiles/master/Surge/Ruleset/StreamingMedia/Video/TikTok.list,🪄 TikTok
RULE-SET,https://raw.githubusercontent.com/DivineEngine/Profiles/master/Surge/Ruleset/StreamingMedia/Streaming.list,🎞 国外媒体
RULE-SET,https://raw.githubusercontent.com/DivineEngine/Profiles/master/Surge/Ruleset/StreamingMedia/StreamingCN.list,🌏 国内媒体
RULE-SET,https://raw.githubusercontent.com/DivineEngine/Profiles/master/Surge/Ruleset/Extra/Telegram/Telegram.list,📲 电报信息
RULE-SET,https://raw.githubusercontent.com/DivineEngine/Profiles/master/Surge/Ruleset/Extra/Game/Nintendo.list,🎾 Nintendo
RULE-SET,https://raw.githubusercontent.com/Gavin1997/gavinsurge/main/Rule/game.list,🎮 游戏平台
RULE-SET,https://raw.githubusercontent.com/DivineEngine/Profiles/master/Surge/Ruleset/Global.list,🔰 节点选择
RULE-SET,https://raw.githubusercontent.com/DivineEngine/Profiles/master/Surge/Ruleset/Extra/Apple/Apple.list,🍎 苹果服务
RULE-SET,https://raw.githubusercontent.com/Gavin1997/gavinsurge/main/Rule/TV.list,🍎 AppleTv
RULE-SET,https://raw.githubusercontent.com/DivineEngine/Profiles/master/Surge/Ruleset/China.list,🇺🇳 全球直连
RULE-SET,https://raw.githubusercontent.com/NobyDa/Script/master/Surge/Download.list,🇺🇳 全球直连
[Script]
{% endif %}
