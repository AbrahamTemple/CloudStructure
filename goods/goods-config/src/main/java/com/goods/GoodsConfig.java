package com.goods;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.config.server.EnableConfigServer;

//读取配置的主类，其他的项目都找该类去远程获取配置，目前goods-admin就是找它读取配置
@SpringBootApplication
@EnableConfigServer
public class GoodsConfig {
    //配置的服务器端，去拿远程服务器的配置
    public static void main(String[] args) {
            SpringApplication.run(GoodsConfig.class, args);
        }
}
