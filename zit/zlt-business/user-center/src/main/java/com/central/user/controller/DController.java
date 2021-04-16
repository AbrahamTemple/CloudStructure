package com.central.user.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import cn.hutool.core.lang.UUID;
import cn.hutool.json.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.central.common.annotation.LoginUser;
import com.central.common.model.SysUser;
import com.central.user.mapper.ErMapper;
import com.central.user.model.D;
import com.central.user.model.Diancan;
import com.central.user.model.Er;
import com.central.user.service.IDService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;

import com.central.common.model.PageResult;
import com.central.common.model.Result;

/**
 * 商品
 *
 * @author zlt
 * @date 2020-12-27 00:48:42
 */
@Slf4j
@RestController
@RequestMapping("/d")
@Api(tags = "商品")
public class DController {
    @Autowired
    private IDService dService;
    @Autowired
    private ErMapper erMapper;

    /**
     * 列表
     */
    @ApiOperation(value = "查询列表")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "page", value = "分页起始位置", required = true, dataType = "Integer"),
            @ApiImplicitParam(name = "limit", value = "分页结束位置", required = true, dataType = "Integer")
    })
    @GetMapping
    public PageResult list(@RequestParam Map<String, Object> params) {
        PageResult<D> list = dService.findList(params);
        List<D> data = list.getData();
        for (D datum : data) {
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String format = simpleDateFormat.format(datum.getProductTime());
            datum.setProductTimeStr(format);
        }
        return list;
    }

    /**
     * 查询
     */
    @ApiOperation(value = "查询")
    @GetMapping("/{id}")
    public Result findUserById(@PathVariable Long id) {
        D model = dService.getById(id);
        return Result.succeed(model, "查询成功");
    }

    /**
     * 新增or更新
     */
    @ApiOperation(value = "保存")
    @PostMapping
    public Result save(@RequestBody D d) throws ParseException {
        String productTimeStr = d.getProductTimeStr();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date parse = simpleDateFormat.parse(productTimeStr);
        d.setProductTime(parse);
        dService.saveOrUpdate(d);
        return Result.succeed("保存成功");
    }

    /**
     * 新增or更新
     */
    @ApiOperation(value = "点餐")
    @GetMapping("/diancan")
    public Result dian(String myname,Double myprice,@LoginUser(isFull = true) SysUser user) throws ParseException {
        QueryWrapper<Er> erQueryWrapper = new QueryWrapper<>();
        erQueryWrapper.eq("status","未完成")
                .eq("consignee",user.getUsername())
                .orderByDesc("order_time");
        List<Er> ers = erMapper.selectList(erQueryWrapper);
        if (ers.size()==0){
            Er er = new Er();
            er.setOrderNum(UUID.fastUUID().toString());
            er.setConsignee(user.getUsername());
            er.setConsigneePhone(user.getMobile());
            er.setPrice(myprice);
            //订单详情用json存
            JSONObject jsonObject = new JSONObject();
            jsonObject.put(myname,1);
            er.setContent(jsonObject.toString());
            erMapper.insert(er);
        }else {
            Er er = ers.get(0);
            //价格
            Double price=er.getPrice();
            price=price+myprice;
            er.setPrice(price);
            //详情
            String content = er.getContent();
            com.alibaba.fastjson.JSONObject jsonObject = com.alibaba.fastjson.JSONObject.parseObject(content);
            String name="";
            for (String key : jsonObject.keySet()) {
                if (jsonObject.get(myname)==null){
                    name=myname;
                }
            }
            jsonObject.put(name,1);
            //
            for (String key : jsonObject.keySet()) {
                if (key.equals(myname)){
                    Integer num = (Integer)jsonObject.get(key);
                    num=num+1;
                    jsonObject.put(key,num);
                }
            }
            er.setContent(jsonObject.toString());
            erMapper.updateById(er);
        }
        return Result.succeed("下单成功");
    }

    /**
     * 删除
     */
    @ApiOperation(value = "删除")
    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Long id) {
        dService.removeById(id);
        return Result.succeed("删除成功");
    }
}
