package com.goods;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})
@EnableEurekaClient
//扫描哪些服务可以使用Feign调用,,注解@EnableFeignClients:扫描和注册feign客户端bean定义
@EnableFeignClients("com.goods")
public class GoodsOpenFeign {
	public static void main(String[] args) {
		SpringApplication.run(GoodsOpenFeign.class, args);
	}
}
