package com.goods.controller;

import com.goods.entity.Goods;
import com.goods.service.GoodsClientService;
import com.goods.util.ServerResponse;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


@Api(value="商品Controller",tags={"商品操作接口"})
@RestController
//以json格式返回，不然会是xml
@RequestMapping(value = "/consumer/goods/", produces = {"application/json;charset=UTF-8"})
public class GoodsConsumerController {
    //通过Feign接口访问
    @Autowired
    public GoodsClientService goodsClientService;
    @RequestMapping(value = "add")
    @ApiOperation("添加商品方法")
    public ServerResponse add(@RequestBody Goods goods) {
    	return goodsClientService.add(goods);
    }

    @RequestMapping(value = "update")
    @ApiOperation("添修改商品方法")
    public ServerResponse update(@RequestBody Goods goods) {
        return goodsClientService.update(goods);
    }

    @RequestMapping(value = "get/{id}")
    @ApiOperation("查询单个商品方法")
    public ServerResponse get(@PathVariable("id") Integer id) {
        return goodsClientService.get(id);
    }

    @RequestMapping(value = "delete/{id}")
    @ApiOperation("删除商品方法")
    public ServerResponse delete(@PathVariable("id") Integer id) {
        return goodsClientService.delete(id);
    }

    @RequestMapping(value = "list")
    @ApiOperation("查询所有商品方法")
    public ServerResponse list(@RequestParam(value = "name",required = false,defaultValue = "") String name,@RequestParam(value = "page",required = false,defaultValue = "1") Integer page, @RequestParam(value = "limit",required = false,defaultValue = "10") Integer limit) {
    	return goodsClientService.list(name,page,limit);
    }
}



