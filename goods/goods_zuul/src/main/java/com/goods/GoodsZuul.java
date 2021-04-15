package com.goods;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.zuul.EnableZuulProxy;

@SpringBootApplication
@EnableZuulProxy
public class GoodsZuul {
    public static void main(String[] args) {
        SpringApplication.run(GoodsZuul.class, args);
    }
}
