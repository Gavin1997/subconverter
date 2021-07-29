{% if request.target == "clash" or request.target == "clashr" %}

port: {{ default(global.clash.http_port, "7890") }}
socks-port: {{ default(global.clash.socks_port, "7891") }}
allow-lan: {{ default(global.clash.allow_lan, "true") }}
mode: Rule
log-level: {{ default(global.clash.log_level, "info") }}
external-controller: :9090
{% if default(request.clash.dns, "") == "1" %}
dns:
  enabled: true
  listen: 1053
{% endif %}
{% if local.clash.new_field_name == "true" %}
proxies: ~
proxy-groups: ~
rules: ~
{% else %}
Proxy: ~
Proxy Group: ~
Rule: ~
{% endif %}

{% endif %}
{% if request.target == "surge" %}

[General]
loglevel = notify
bypass-system = true
skip-proxy = 127.0.0.1,192.168.0.0/16,10.0.0.0/8,172.16.0.0/12,100.64.0.0/10,localhost,*.local,e.crashlytics.com,captive.apple.com,::ffff:0:0:0:0/1,::ffff:128:0:0:0/1
#DNS设置或根据自己网络情况进行相应设置
bypass-tun = 192.168.0.0/16,10.0.0.0/8,172.16.0.0/12
dns-server = 119.29.29.29,223.5.5.5

[Script]

{% endif %}
{% if request.target == "loon" %}

[General]
skip-proxy = 192.168.0.0/16,10.0.0.0/8,172.16.0.0/12,localhost,*.local,e.crashlynatics.com
bypass-tun = 10.0.0.0/8,100.64.0.0/10,127.0.0.0/8,169.254.0.0/16,172.16.0.0/12,192.0.0.0/24,192.0.2.0/24,192.88.99.0/24,192.168.0.0/16,198.18.0.0/15,198.51.100.0/24,203.0.113.0/24,224.0.0.0/4,255.255.255.255/32
dns-server = system,119.29.29.29,223.5.5.5
allow-udp-proxy = false
host = 127.0.0.1

[Proxy]

[Remote Proxy]

[Proxy Group]

[Rule]

[Remote Rule]

[URL Rewrite]
enable = true
^https?:\/\/(www.)?(g|google)\.cn https://www.google.com 302

[Remote Rewrite]
https://raw.githubusercontent.com/Loon0x00/LoonExampleConfig/master/Rewrite/AutoRewrite_Example.list,auto

[MITM]
hostname = *.example.com,*.sample.com
enable = true
skip-server-cert-verify = true
#ca-p12 =
#ca-passphrase =

{% endif %}
{% if request.target == "quan" %}

[SERVER]

[SOURCE]

[BACKUP-SERVER]

[SUSPEND-SSID]

[POLICY]

[DNS]
1.1.1.1

[REWRITE]

[URL-REJECTION]

[TCP]

[GLOBAL]

[HOST]

[STATE]
STATE,AUTO

[MITM]

{% endif %}
{% if request.target == "quanx" %}

[general]
excluded_routes=192.168.0.0/16, 172.16.0.0/12, 100.64.0.0/10, 10.0.0.0/8
geo_location_checker=http://ip-api.com/json/?lang=zh-CN, https://github.com/KOP-XIAO/QuantumultX/raw/master/Scripts/IP_API.js
network_check_url=http://www.baidu.com/
server_check_url=http://www.gstatic.com/generate_204
running_mode_trigger=filter, filter, Redmi_594D_5G:all_direct
[dns]
server=119.29.29.29
server=223.5.5.5
server=1.0.0.1
server=8.8.8.8

[policy]
static=♻️ 自动选择, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Auto.png
static=🔰 节点选择, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Proxy.png
static=🌍 国外媒体, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/GlobalMedia.png
static=🌏 国内媒体, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/DomesticMedia.png
static=Ⓜ️ 微软服务, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Microsoft.png
static=📲 电报信息, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Telegram.png
static=🍎 苹果服务, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Apple.png
static=🎯 全球直连, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Direct.png
static=🛑 全球拦截, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Advertising.png
static=🐟 漏网之鱼, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Final.png

[server_remote]
https://gavin-converter.kooldns.cn/sub?target=quanx&url=http%3A%2F%2Fservice-f8ydge06-1306597368.jp.apigw.tencentcs.com%2Flink%2FgSKnvkNuYlkYxVFJ%3Fclash%3D1%26extend%3D1&insert=false&include=VIP&emoji=true&list=true&tfo=false&scv=false&fdn=false&sort=true,tag=火箭🚀, update-interval=172800, opt-parser=false, enabled=true
[filter_remote]

[rewrite_remote]
https://raw.githubusercontent.com/DivineEngine/Profiles/master/Quantumult/Rewrite/Block/AdvertisingPlus.conf, tag=广告神机plus, update-interval=172800, opt-parser=false, enabled=true
https://raw.githubusercontent.com/DivineEngine/Profiles/master/Quantumult/Rewrite/Block/Advertising.conf, tag=广告-神机, update-interval=172800, opt-parser=false, enabled=true
# 美国
https://raw.githubusercontent.com/Semporia/TikTok-Unlock/master/Quantumult%20X/TikTok-US.conf, tag=TikTok, update-interval=86400, opt-parser=false, enabled=true
# 韩国
https://raw.githubusercontent.com/Semporia/TikTok-Unlock/master/Quantumult%20X/TikTok-KR.conf, tag=TikTok, update-interval=86400, opt-parser=false, enabled=true
# emby
https://raw.githubusercontent.com/qiangxinglin/Emby/main/QuantumultX/emby.conf, tag=Emby Premiere, update-interval=86400, opt-parser=false, enabled=true
[server_local]

[filter_local]

[rewrite_local]

#tiktok 解锁直播区域限制
(?<=_region=)CN(?=&) url 307 KR
(?<=&mcc_mnc=)4 url 307 2
^(https?:\/\/(tnc|dm)[\w-]+\.\w+\.com\/.+)(\?)(.+) url 302  $1$3
(?<=\d\/\?\w{7}_\w{4}=)1[6-9]..(?=.?.?&) url 307 17

# 去微信公众号广告 (By Choler)
^https?:\/\/mp\.weixin\.qq\.com\/mp\/getappmsgad url script-response-body https://raw.githubusercontent.com/NobyDa/Script/master/QuantumultX/File/Wechat.js

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
hostname = *.tiktokv.com, *.byteoversea.com, *.tik-tokapi.com,api.weibo.cn, mapi.weibo.com, *.uve.weibo.com, mp.weixin.qq.com, www.zhihu.com, api.zhihu.com, link.zhihu.com, vip1.kuwo.cn, p.du.163.com, vsco.co, user*.zymk.cn, vni.kwaiying.com, *.my10api.com, www.luqijianggushi.com, account.wps.cn, origin-prod-phoenix.jibjab.com, api.bjxkhc.com, xy-viva.kakalili.com, ap*.intsig.net, m*.bybutter.com, api.vuevideo.net, api.picsart.c*, ios.fuliapps.com, apple.fuliapps.com, *.pipiapps.com, ios.xiangjiaoapps.com, apple.xiangjiaoapps.com, *.xiangxiangapps.com, api.meiease.c*, trade-acs.m.taobao.com, api.m.jd.com, ios*.prod.ftl.netflix.com, api.revenuecat.com,api.polaxiong.com
passphrase = 9CB02FCD
p12 = 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

{% endif %}
{% if request.target == "mellow" %}

[Endpoint]
DIRECT, builtin, freedom, domainStrategy=UseIP
REJECT, builtin, blackhole
Dns-Out, builtin, dns

[Routing]
domainStrategy = IPIfNonMatch

[Dns]
hijack = Dns-Out
clientIp = 114.114.114.114

[DnsServer]
localhost
223.5.5.5
8.8.8.8, 53, Remote
8.8.4.4

[DnsRule]
DOMAIN-KEYWORD, geosite:geolocation-!cn, Remote
DOMAIN-SUFFIX, google.com, Remote

[DnsHost]
doubleclick.net = 127.0.0.1

[Log]
loglevel = warning

{% endif %}
{% if request.target == "surfboard" %}

[General]
loglevel = notify
interface = 127.0.0.1
skip-proxy = 127.0.0.1, 192.168.0.0/16, 10.0.0.0/8, 172.16.0.0/12, 100.64.0.0/10, localhost, *.local
ipv6 = false
dns-server = system, 223.5.5.5
exclude-simple-hostnames = true
enhanced-mode-by-rule = true
{% endif %}
{% if request.target == "sssub" %}
{
  "route": "bypass-lan-china",
  "remote_dns": "dns.google",
  "ipv6": false,
  "metered": false,
  "proxy_apps": {
    "enabled": false,
    "bypass": true,
    "android_list": [
      "com.eg.android.AlipayGphone",
      "com.wudaokou.hippo",
      "com.zhihu.android"
    ]
  },
  "udpdns": false
}

{% endif %}
