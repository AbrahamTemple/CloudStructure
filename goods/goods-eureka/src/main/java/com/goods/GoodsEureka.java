package com.goods;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@SpringBootApplication
//开启Eureka
@EnableEurekaServer
public class GoodsEureka {
	public static void main(String[] args) {
		SpringApplication.run(GoodsEureka.class, args);
	}
}
