{% if request.target == "quanx" %}

[general]
# resource_parser_url 示例可以在以下网站找到 https://raw.githubusercontent.com/crossutility/Quantumult-X/master/resource-parser.js
resource_parser_url=https://cdn.jsdelivr.net/gh/KOP-XIAO/QuantumultX@master/Scripts/resource-parser.js
geo_location_checker=http://ip-api.com/json/?lang=zh-CN, https://github.com/KOP-XIAO/QuantumultX/raw/master/Scripts/IP_API.js
# 由于 Trojan 协议为无响应校验协议，使得 HTTP 检测方式即使获得了 HTTP 响应，也不代表节点一定可用。
server_check_url=http://cp.cloudflare.com/generate_204

# DNS 排除列表
# dns_exclusion_list 包含了禁用占位符 IP (240.*) 的域，不在 dns_exclusion_list 中的域都启用了占位符 IP，并打开了 resolve-on-remote 设置。
dns_exclusion_list=*.cmpassport.com, *.jegotrip.com.cn, *.icitymobile.mobi, id6.me, *.pingan.com.cn, *.cmbchina.com

# Quantumult 将不会处理到 excluded_routes 的流量。修改后最好重新启动您的设备。
;excluded_routes=192.168.0.0/16, 172.16.0.0/12, 100.64.0.0/10, 10.0.0.0/8
# 在网络环境切换时出发运行模式变更
# filter - 规则分流，all_proxy - 全部代理，all_direct - 全部直连
# 示例意思：[蜂窝数据],[Wi-Fi],[SSID]
# 下列示例的意思为：在蜂窝数据使用规则分流(第一个 filter)，在 Wi-Fi 使用规则分流(第二个 filter)，在 SSID 为 LINK_22E171 的 Wi-Fi 使用全部代理，，在 SSID 为 LINK_22E172 的 Wi-Fi 使用全部直连
# Rewrite 及 Task 模块始终生效
running_mode_trigger=filter, filter, Redmi_594D_5G:all_direct

# 在特定 SSID 网络时(除了 Task 模块)暂停 Quantumult X
;ssid_suspended_list=LINK_22E174, LINK_22E175

# 参数 udp_whitelist 从 IP 层控制 UDP 数据是否需要舍弃；如舍弃，则该 UDP 请求不会进入规则模块以及策略模块，TCP/UDP 请求记录中也不会有相应的条目，但仍可在日志中查询到相关信息（日志等级 debug）。
# 该参数控制的是流入 Quantumult X Tunnel 的请求，并非 Quantumult X Tunnel 发出的请求，即不会作用于节点所使用的 UDP 目标端口。
;udp_whitelist=53, 123, 1900, 80-443

# 说明：参数 fallback_udp_policy 的值仅支持末端策略（末端策略为经由规则模块和策略模块后所命中的策略，例如：direct、reject 以及节点；不支持内置策略 proxy 以及其它自定义策略）。默认为 reject。
# 当 UDP 请求经过规则模块以及策略模块后所命中的节点为 Quantumult X 所不支持 UDP 转发的节点（如：VMess、trojan），或支持 UDP 转发但未注明 udp-relay=true 的（例如：SS/SSR 且与服务器是否真实开启 UDP 转发无关），则 fallback_udp_policy 会被使用。
# 注意：如果您需要调整该参数的值为 direct，请务必清楚了解同一目标主机名 TCP 请求与 UDP 请求的源地址不同所造成的隐私及安全风险。
fallback_udp_policy=direct

;icmp_auto_reply=true

[dns]
# 查询结果只用于评估过滤器或通过直接策略连接，当通过服务器连接时，查询结果不会被使用，Quantumult 永远不会知道相关域名的目标 IP。
# 如果您想让某个域名(例如：example.com)为 127.0.0.0.1，只需在「filter_local」部分添加「host, example.com, reject」即可。拒绝操作将返回 127.0.0.0.1 的 DNS 响应。

# 禁用系统 DNS
# 为了提高性能，会使用从当前网络(系统)中获取的 DNS 服务器(您可以使用「no-system」禁用此功能，但至少要增加一个自定义的 DNS 服务器。
;no-system

# 禁用 IPv6
# 当设置「no-ipv6」时，Quanumult X Tunnel 的 DNS 模块会直接让 AAAA 查询失败。
no-ipv6

# 自定义 DNS
# > DNSPod Public DNS
server=119.29.29.29
# > Alibaba Public DNS
server=223.5.5.5
# 在特定的网络环境下忽略自定义 DNS 可在后方加上「excluded_ssids」相关字段。
# 注意：如配置了 no-system，则请务必确保在忽略了部分自定义 DNS 的配置下至少有一个可用的自定义 DNS 配置。
# server=114.114.114.114, excluded_ssids=SSID1, SSID2

# DNS over HTTPS
# 当 DoH 服务器被设置时，所有其他普通的（没有与之相关的特定域）服务器将被忽略。
# 当设置了多个 DoH 服务器时，只有第一个会被使用。
# 当使用的 DoH 服务器不是基于 HTTP/2 时，DoH 将被暂时禁用，并使用常规服务器，直到下次启动 VPN 连接。
# 不建议在与防火墙相关的网络环境中使用，不确定 DoH 服务器是否总能被到达。
# 如果 DoH 服务器在您的国家或地区不是流行的 DNS 服务器，则不推荐使用，它可能会丢失 ISP DNS 服务器返回的 CDN 优化结果。
# 如果 DoH 服务器是一个反广告相关的服务器，则不推荐使用（Quantumult X 过滤模块对于被拒绝的域具有更好的性能，它可以避免客户端无休止的请求）。
;doh-server=https://dns.alidns.com/dns-query
;doh-server=https://223.6.6.6/dns-query

# 本地 DNS 映射
# Firebase Cloud Messaging
address=/mtalk.google.com/108.177.125.188
# Google Dl
server=/dl.google.com/119.29.29.29
server=/dl.l.google.com/119.29.29.29

;server=8.8.4.4:53
;server=/example0.com/system
;server=/example1.com/8.8.4.4
;server=/*.example2.com/223.5.5.5
;server=/example4.com/[2001:4860:4860::8888]:53
;address=/example5.com/192.168.16.18
;address=/example6.com/[2001:8d3:8d3:8d3:8d3:8d3:8d3:8d3]

[policy]


[server_remote]
http://139.129.243.117/sub?target=quanx&url=http%3A%2F%2Fservice-f8ydge06-1306597368.jp.apigw.tencentcs.com%2Flink%2FgSKnvkNuYlkYxVFJ%3Fclash%3D1%26extend%3D1&insert=false&include=VIP&emoji=true&list=true&tfo=false&scv=false&fdn=false&sort=true,tag=火箭🚀, update-interval=172800, opt-parser=false, enabled=true
[filter_remote]

[rewrite_remote]
# google重定向高级优化
https://raw.githubusercontent.com/DivineEngine/Profiles/master/Quantumult/Rewrite/General.conf, tag=🌳general update-interval=172800, opt-parser=false, enabled=true
# gavin重写去广告
https://raw.githubusercontent.com/Gavin1997/gavinsurge/main/quanx/urlRewrite.conf, tag=🍒BlockBygavin update-interval=172800, opt-parser=false, enabled=true
# 神机重写去广告
https://raw.githubusercontent.com/DivineEngine/Profiles/master/Quantumult/Rewrite/Block/AdvertisingPlus.conf, tag=🛡Block Advertising update-interval=172800, opt-parser=false, enabled=true
https://raw.githubusercontent.com/DivineEngine/Profiles/master/Quantumult/Rewrite/Block/Advertising.conf, tag=🛡Block Advertising+, update-interval=172800, opt-parser=false, enabled=true
# 美国
https://raw.githubusercontent.com/Semporia/TikTok-Unlock/master/Quantumult%20X/TikTok-US.conf, tag=TikTok_US, update-interval=86400, opt-parser=false, enabled=false
# 韩国
https://raw.githubusercontent.com/Semporia/TikTok-Unlock/master/Quantumult%20X/TikTok-KR.conf, tag=TikTok_KR, update-interval=86400, opt-parser=false, enabled=true
# emby
https://raw.githubusercontent.com/qiangxinglin/Emby/main/QuantumultX/emby.conf, tag=Emby Premiere, update-interval=86400, opt-parser=false, enabled=false
[server_local]

[filter_local]

[rewrite_local]
# 酷我音乐SVIP (By yxiaocai)
^https?:\/\/vip1\.kuwo\.cn\/(vip\/v2\/user\/vip|vip\/spi/mservice) url script-response-body https://raw.githubusercontent.com/NobyDa/Script/master/Surge/JS/Kuwo.js

# VSCO滤镜VIP
^https:\/\/(api\.revenuecat\.com\/v\d\/subscribers|vsco\.co\/api\/subscriptions\/\d\.\d\/user-subscriptions)\/ url script-response-body https://raw.githubusercontent.com/NobyDa/Script/master/QuantumultX/File/vsco.js
# WPS (By eHpo)
^https://account.wps.cn/api/users/ url script-response-body https://raw.githubusercontent.com/NobyDa/Script/master/Surge/JS/Wps.js
# 扫描全能王 pro
^https:\/\/(api|api-cs)\.intsig\.net\/purchase\/cs\/query_property\? url script-response-body https://raw.githubusercontent.com/NobyDa/Script/master/Surge/JS/CamScanner.js
# 泼辣修图
^https:\/\/api\.polaxiong\.com\/v1\/payments\/appleiap\/receipts\/confirmation url script-response-body https://raw.githubusercontent.com/NobyDa/Script/master/Surge/JS/Polarr.js
# 去微博应用内广告 (yichahucha)
^https?://(sdk|wb)app\.uve\.weibo\.com(/interface/sdk/sdkad.php|/wbapplua/wbpullad.lua) url script-response-body https://raw.githubusercontent.com/yichahucha/surge/master/wb_launch.js
^https?://m?api\.weibo\.c(n|om)/2/(statuses/(unread|extend|positives/get|(friends|video)(/|_)(mix)?timeline)|stories/(video_stream|home_list)|(groups|fangle)/timeline|profile/statuses|comments/build_comments|photo/recommend_list|service/picfeed|searchall|cardlist|page|!/(photos/pic_recommend_status|live/media_homelist)|video/tiny_stream_video_list|photo/info|remind/unread_count) url script-response-body https://raw.githubusercontent.com/yichahucha/surge/master/wb_ad.js

# 知乎去广告 (onewayticket255)
https://api.zhihu.com/(ad|drama|fringe|commercial|market/popover|search/(top|preset|tab)|.*featured-comment-ad) url reject-200
https://api.zhihu.com/people/ url script-response-body https://raw.githubusercontent.com/onewayticket255/Surge-Script/master/surge%20zhihu%20people.js
https://api.zhihu.com/moments/recommend url script-response-body https://raw.githubusercontent.com/onewayticket255/Surge-Script/master/surge%20zhihu%20feed.js
https://api.zhihu.com/topstory/recommend url script-response-body https://raw.githubusercontent.com/onewayticket255/Surge-Script/master/surge%20zhihu%20recommend.js
https://api.zhihu.com/v4/questions url script-response-body https://raw.githubusercontent.com/onewayticket255/Surge-Script/master/surge%20zhihu%20answer.js

# 哔哩哔哩动画去广告 (onewayticket255)
https://app.bilibili.com/x/v2/(splash|search/(defaultword|square)) url reject-200
https://api.bilibili.com/x/v2/dm/ad url reject-200
#https://app.bilibili.com/x/v2/space\?access_key url script-response-body https://raw.githubusercontent.com/onewayticket255/Surge-Script/master/surge%20bilibili%20space.js
https://app.bilibili.com/x/resource/show/tab\?access_key url script-response-body https://raw.githubusercontent.com/onewayticket255/Surge-Script/master/surge%20bilibili%20tab.js
https://app.bilibili.com/x/v2/feed/index\?access_key url script-response-body https://raw.githubusercontent.com/onewayticket255/Surge-Script/master/surge%20bilibili%20feed.js
https://app.bilibili.com/x/v2/account/mine\?access_key url script-response-body https://raw.githubusercontent.com/onewayticket255/Surge-Script/master/surge%20bilibili%20account.js
https://app.bilibili.com/x/v2/view\?access_key url script-response-body https://raw.githubusercontent.com/onewayticket255/Surge-Script/master/surge%20bilibili%20view%20relate.js
https://api.bilibili.com/x/v2/reply/main\?access_key url script-response-body https://raw.githubusercontent.com/onewayticket255/Surge-Script/master/surge%20bilibili%20reply.js
https://api.live.bilibili.com/xlive/app-room/v1/index/getInfoByRoom\?access_key url script-response-body https://raw.githubusercontent.com/onewayticket255/Surge-Script/master/surge%20bilibili%20live.js

# 京东比价 (yichahucha)
^https?://api\.m\.jd\.com/client\.action\?functionId=(wareBusiness|serverConfig|basicConfig) url script-response-body https://service.2ti.st/QuanX/Script/jd_tb_price/main.js
#奈飞评分
^https?://ios(-.*)?\.prod\.ftl\.netflix\.com/iosui/user/.+path=%5B%22videos%22%2C%\d+%22%2C%22summary%22%5D url script-request-header https://raw.githubusercontent.com/yichahucha/surge/master/nf_rating.js
^https?://ios(-.*)?\.prod\.ftl\.netflix\.com/iosui/user/.+path=%5B%22videos%22%2C%\d+%22%2C%22summary%22%5D url script-response-body https://raw.githubusercontent.com/yichahucha/surge/master/nf_rating.js
[mitm]
hostname = *.tiktokv.com, *.byteoversea.com, *.tik-tokapi.com,api.weibo.cn, mapi.weibo.com, *.uve.weibo.com, mp.weixin.qq.com, www.zhihu.com, api.zhihu.com, link.zhihu.com, vip1.kuwo.cn, p.du.163.com, vsco.co, user*.zymk.cn, vni.kwaiying.com, *.my10api.com, www.luqijianggushi.com, account.wps.cn, origin-prod-phoenix.jibjab.com, api.bjxkhc.com, xy-viva.kakalili.com, ap*.intsig.net, tag= m*.bybutter.com, api.vuevideo.net, tag= api.picsart.c*, ios.fuliapps.com, apple.fuliapps.com, *.pipiapps.com, ios.xiangjiaoapps.com, apple.xiangjiaoapps.com, *.xiangxiangapps.com, api.meiease.c*, trade-acs.m.taobao.com, api.m.jd.com, ios*.prod.ftl.netflix.com, api.revenuecat.com,api.polaxiong.com
passphrase = 9CB02FCD
p12 = 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

{% endif %}