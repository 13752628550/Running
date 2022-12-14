<?php

return [
    // 管理员相关
    'manager'=>[
        // token配置
        'token'=>[
            // 存储引擎 redis,file
            'store'=>'file'
        ]
    ],
    // 用户相关
    'user'=>[
        // token配置
        'token'=>[
            // 存储引擎 redis,file
            'store'=>'file'
        ]
    ],
    // 订单相关
    'order'=>[
        // 订单超时1800秒（半小时）后自动关闭
        'delay'=>1800,
        // 自动收货（7天）
        'received_delay'=>604800,
    ],
    // 物流相关
    'ship'=>[
    	'appkey'=>'6c2787719b5ce602',
    ],
    
    "oss"=>[
        "Bucket" => "tangzhe123-com",
        "http" => "oss-cn-shenzhen.aliyuncs.com",
        "ACCESS_KEY" => "LTAI4SpvHSqreVgDvbcCo2Yq",
        "SECRET_KEY" => "r91jBRWSGVzAx8BuUNi8aA0m3tpGwk"
    ],
    
    // 支付相关
    'payment'=>[
        'alipay' => [
            'notify_url' =>"/api/payment/alipay/notify",

            'app_id'         => '2019081561159522',

            'ali_public_key' => "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAhysWmVdABTKzpH3qM40zBo2zGVWNhGe4xm/bFWKnmv/KOtmfaQm8tBjQGQ1o9ME56m0fASnnz5lJS2r+AC4qIePCiKFE5uH57WZo2N9yO042y8VZ/MJsWUgog/FrIvjU3pkp5vB7FcZ1uresciKYFt/jTQPe7Bdoqt6GDetKBCXdEbJbL+DOyYNiCPmVaVH9pv8oy58RjWP5JeBOYIDe3+aMyilHt2sH0Vg/KrvKWzFanoltzwHrgMp27gtvTDPmnIjpkKEVfzevxOHe0q/NpsD+4qWd/6xclfcgd70Y+Dc9dwrq30BfoWJtIytTJJ0qqeNkQOLNeOppzintBXFpgQIDAQAB",

            'private_key'    => "MIIEpAIBAAKCAQEAqld5rwZvdFQYzIMhfx7mn+YxTQ6o2yhoYfpZnQaDH7yHCqfIN8svMJ2PXVSrfMkX+dlkQzsT5nYiujRZ8WJ/RT5Nbh45nAoj+o9id3weWs0qwXU2a7F36LwfaDmvn0zSVoq4zq0wdaCZio/sa7IZ1NaRu/FYuoYINlYZgWYsggecxKBTR6gGb4Cad/9T759L/2xWc0vETvr14KRb+5cnKOc+avR9BAbgRQNBMZcD6fx5DgZXzQ704GRh4W32hL5WXpzOFPvNf1oOTD4brv4KojPEMcfxBUV/tzDk+dr+HpJpLtGV9aRMqgjZumIpCjmPRADIVpgrmjEXYvF64/UXvwIDAQABAoIBAB/GW4ODnszDVzDnERuGZxzSssWeA2+GNRp5ubep3FHSOBqLu7R0qWPXMEQHpEmNtXQ80hAceBTYWpgDZfe6GOWQvp7Y8oQh/B4kGwkQ1RS5Cs21kKY8H5MBb1VBjXoYuW+9RsX+1nhKsfl/6WkZeuoR8HNvjM6Wa/e+zdkudwT2GqYD1yuPhSmtlmpjLh0kMBfK4qFbVxbu3XqViWwJOuLwFQl6N258dfp4uMnKNz0nqNQeUfoDZ35Ixe0orPIffypdfdTqOirC7WYbF/8W5Ygtuj/HTQqAIZ+I1qbmI5GfP4Q1S0kkXvj4aq/5r0u9iJOI7GK9U8mFVNu3xVKKsJkCgYEA0sCQmtpSAldXCXFuXSB6RJUKCIw2jmcVLuMfCYBKyGlNUa2jSIKQisXbSQmqYgL7/L6G82GwKjD6ZXvQFAs+c8L/MEkaF2nT6zmMtDSBdIyFIb+bd8kx97EmQjUyd+vf4vDY1zV1cGZa6iF/EHgMHNK4OM5EiX9zvFDGt/3qz8sCgYEAzunatzRCFhQK0tfAV6c0VOrgZntirooa6onH/0sO6Sm1W4vEJoYHkaPJpaOO4V2nbNcLK1620NkqB1RT+5YzMb7jEpL8DY24ufM1dD+aihWHt8DGCRSZdycDcwIKM+f2vwtsvwjldfudRjh9QXWTfALPkSbqpYABoqqKD8PtcV0CgYEAr1pbtwyKCbqkB45itoesU93yEDShvBCW9oExNNWS43eCRsCDyHQiUeTYVMf/BTfYdG4OmPih/CjuXnwLIHJOj0Ei1Qkt9WcvVVt38ARz5gZ5SyBC+gLkWWQDIjli+Za/nPKqaT3orhHr+TzPnWNVKLJHZ7RwIDt0j65h+XsC4csCgYAi3wyqVZdRqz0Lvaq/2wEZ0p/RBbhi3AmfP2tCXj78Erhq3kpHh80cwXLJhKAe4S7HTBKo04SR/Bd2NsMUooKsPpR8W+M40YqxZAi9N77uyKQf1tBJVXxrtVqCdnSLvOs71UwVggVR9f7Sh9CsSIl7m+mpd9qR29nqtT0hXQ7WTQKBgQDP4NIHuAQOc0xbO58HZgtGB4wFLbSG+PFL+VJxlVvJ6oBHR6axiWTFR+yzS/nJC918BCh7HfsQnfePlrydG2o7NDO25jGyQZvbf5welgCSxWaQ1j9rulng4saBrZNgOmUFBWi+YB3U2NY5HILYuw/2UB8sJyv326iqnKLA7hVVzg==",

	            'log'            => [
	                'file' => './payment/alipay.log',
	                'level' => 'debug',
	                'type' => 'single', // optional, 可选 daily.
	                'max_file' => 30, // optional, 当 type 为 daily 时有效，默认 30 天
	            ],
	            //'mode' => 'dev' // 进入沙箱模式 不需要的时候需要注释掉
        ],
    
        'wechat' => [
            'notify_url' => "/api/payment/wxpay/notify",
            
            'app_id' => 'wxf0d12abcc66aab61', // 公众号 APPID
            'miniapp_id' => 'wxbaf305de99c0fe32', // 小程序 APPID
            
            'appid'      => 'wxc949eade7d0a3bde', // appid
            'mch_id'      => '1554325981', // 商户号
            'key'         => '8b078169c793049f1c97793464c7049f', // API 密钥
            'cert_client' => __DIR__.'/payment/wechat2/apiclient_cert.pem',
            'cert_key'    => __DIR__.'/payment/wechat2/apiclient_key.pem',
            
            'log'         => [
                'file' => './payment/wechat_pay.log',
                'level' => 'debug', // 建议生产环境等级调整为 info，开发环境为 debug
		        'type' => 'single', // optional, 可选 daily.
		        'max_file' => 30, 
            ],
            'http' => [ // optional
                'timeout' => 5.0,
                'connect_timeout' => 5.0,
            ],
            //'mode' => 'dev',
        ],
    ],
    // 微信小程序相关
    'wx'=>[
        'appid'=>'wxbaf305de99c0fe32',
        'secret'=>'e3ac1sf80f1d3fb9aa57cbb8417c8f71'
    ]
];