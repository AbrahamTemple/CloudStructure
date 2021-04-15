package com.goods.service;

import com.goods.entity.Users;
import com.goods.util.ServerResponse;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

//此处使用Feign去调用Admin中提供的服务
//服务名称此时在这里指定，通过Feign指定，客户端访问时就不需要再通过服务名访问了
//取而代之的就是调用这个接口
//fallbackFactory服务降级处理类,服务提供者已经集成就不再编写
@FeignClient(value = "GOODS-HYSTRIX-ADMIN")
public interface UsersClientService {
    //调用其他服务的增删改查业务之类的
    @RequestMapping(value = "/users/add", method = RequestMethod.GET)
    public ServerResponse add(@RequestBody Users users);

    @RequestMapping(value = "/users/login", method = RequestMethod.GET)
    public ServerResponse login(@RequestParam("username") String username,@RequestParam("password") String password);

    @RequestMapping(value = "/users/list", method = RequestMethod.GET)
    public ServerResponse list();
}
