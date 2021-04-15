package com.goods.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.goods.entity.Goods;
import com.goods.entity.Goods;
import com.goods.service.GoodsService;
import com.goods.util.ServerResponse;
import com.mysql.cj.protocol.x.Notice;
import com.netflix.hystrix.contrib.javanica.annotation.HystrixCommand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
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
@RequestMapping(value = "/goods",produces = {"application/json;charset=UTF-8"})
public class GoodsController {
    @Autowired
    GoodsService goodsService;
    //查询
    @GetMapping("list")
    public ServerResponse list(@RequestParam(value = "name",required = false,defaultValue = "") String name,@RequestParam(value = "page",required = false,defaultValue = "1") Integer page, @RequestParam(value = "limit",required = false,defaultValue = "10") Integer limit){
        QueryWrapper<Goods> wrapper = new QueryWrapper<Goods>();
        if (!StringUtils.isEmpty(name)) {
            wrapper.like("name", name);
        }
        IPage<Goods> pageList = new Page<Goods>(page, limit);
        pageList = goodsService.page(pageList, wrapper);
        // 会自动查出总条数
        int count = (int) pageList.getTotal();
        List<Goods> list=pageList.getRecords();
        return new ServerResponse(ServerResponse.SUCCESS,count,list);
    }
    @PostMapping("add")
    public ServerResponse add(@RequestBody Goods goods) {
        boolean flag = goodsService.save(goods);
        if (flag) {
            return new ServerResponse(ServerResponse.SUCCESS, "添加成功");
        } else {
            return new ServerResponse(ServerResponse.ERROR, "添加失败");
        }
    }
    @PostMapping("update")
    public ServerResponse update(@RequestBody Goods goods) {
        boolean flag = goodsService.updateById(goods);
        if (flag) {
            return new ServerResponse(ServerResponse.SUCCESS, "修改成功");
        } else {
            return new ServerResponse(ServerResponse.ERROR, "修改失败");
        }
    }
    @GetMapping("delete/{id}")
    public ServerResponse delete(@PathVariable Integer id) {
        boolean flag = goodsService.removeById(id);
        if (flag) {
            return new ServerResponse(ServerResponse.SUCCESS, "删除成功");
        } else {
            return new ServerResponse(ServerResponse.ERROR, "删除失败");
        }
    }
    //Hystrix容错处理
    @RequestMapping(value = "get/{id}", method = RequestMethod.GET)
    @HystrixCommand(fallbackMethod="hystrixGet")
    public ServerResponse get(@PathVariable("id") Integer id) {
        Goods good=goodsService.getById(id);
        if(good==null){
            throw new RuntimeException("无法找到编号"+id+"的信息");
        }
        return new ServerResponse(ServerResponse.ERROR,good);
    }
    //出现异常就会找这个回调
    public ServerResponse hystrixGet(@PathVariable("id") Integer id){
        //出错后访问这个方法，得到一个对象,链式调用
        Goods good=new Goods();
        good.setId(0);
        good.setName("无法找到此编号");
        good.setPic("");
        good.setContent("无法找到此编号");
        good.setPrice(0);
        return new ServerResponse(ServerResponse.ERROR,good);
    }
}

