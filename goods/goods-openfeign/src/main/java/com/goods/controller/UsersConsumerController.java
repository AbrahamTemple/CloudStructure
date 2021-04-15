package com.goods.controller;

import com.goods.entity.Goods;
import com.goods.entity.Users;
import com.goods.service.GoodsClientService;
import com.goods.service.UsersClientService;
import com.goods.util.ServerResponse;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Api(value="用户Controller",tags={"用户操作接口"})
@RestController
//以json格式返回，不然会是xml
@RequestMapping(value = "/consumer/users/", produces = {"application/json;charset=UTF-8"})
public class UsersConsumerController {
    //通过Feign接口访问
    @Autowired
    public UsersClientService usersClientService;
    @RequestMapping(value = "add")
    @ApiOperation("用户注册方法")
    public ServerResponse add(@RequestBody Users users) {
        users.setRole(1);
        return usersClientService.add(users);
    }

    @RequestMapping(value = "login")
    @ApiOperation("用户登录方法")
    public ServerResponse login(String username,String password) {
        return usersClientService.login(username,password);
    }


}



