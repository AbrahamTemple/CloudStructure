package com.goods.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.goods.entity.Users;
import com.goods.entity.Users;
import com.goods.service.UsersService;
import com.goods.service.UsersService;
import com.goods.util.ServerResponse;
import com.netflix.hystrix.contrib.javanica.annotation.HystrixCommand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author nnn
 * @since 2020-12-24
 */
@RestController
@RequestMapping(value = "/users",produces = {"application/json;charset=UTF-8"})
public class UsersController {
    @Autowired
    UsersService usersService;
    //查询
    @GetMapping("list")
    public ServerResponse list(){
        return new ServerResponse(ServerResponse.SUCCESS,usersService.list());
    }
    @PostMapping("add")
    public ServerResponse add(@RequestBody Users users) {
        boolean flag = usersService.save(users);
        if (flag) {
            return new ServerResponse(ServerResponse.SUCCESS, "注册成功");
        } else {
            return new ServerResponse(ServerResponse.ERROR, "注册失败");
        }
    }
    @PostMapping("update")
    public ServerResponse update(@RequestBody Users users) {
        boolean flag = usersService.updateById(users);
        if (flag) {
            return new ServerResponse(ServerResponse.SUCCESS, "修改成功");
        } else {
            return new ServerResponse(ServerResponse.ERROR, "修改失败");
        }
    }

    @RequestMapping(value = "login", method = RequestMethod.GET)
    public ServerResponse login(String username,String password) {
        QueryWrapper<Users> wrapper=new QueryWrapper<Users>();
        wrapper.eq("username",username);
        wrapper.eq("password",password);
        List<Users> usersList=usersService.list(wrapper);
        if(usersList.size()>0){
            return new ServerResponse(ServerResponse.SUCCESS,"登录成功",usersList.get(0).getId());
        }else{
            return new ServerResponse(ServerResponse.ERROR,"登录失败",null);
        }
    }

}

