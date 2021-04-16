package com.central.user.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.central.user.model.Er;
import com.central.user.service.IErService;
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
 * 订单
 *
 * @author zlt
 * @date 2020-12-27 00:48:40
 */
@Slf4j
@RestController
@RequestMapping("/er")
@Api(tags = "订单")
public class ErController {
    @Autowired
    private IErService erService;

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
        PageResult<Er> list = erService.findList(params);
        List<Er> data = list.getData();
        for (Er datum : data) {

            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String format = simpleDateFormat.format(datum.getOrderTime());
            datum.setOrderTimeStr(format);
            //
            String content = datum.getContent();
            JSONObject jsonObject = JSON.parseObject(content);
            StringBuffer contentStr= new StringBuffer();
            for (String key : jsonObject.keySet()) {
                contentStr.append(key).append(jsonObject.get(key)+"份").append(";");
            }
            datum.setContentStr(contentStr.toString());
        }
        return list;
    }

    /**
     * 查询
     */
    @ApiOperation(value = "查询")
    @GetMapping("/{id}")
    public Result findUserById(@PathVariable Long id) {
        Er model = erService.getById(id);
        return Result.succeed(model, "查询成功");
    }

    /**
     * 新增or更新
     */
    @ApiOperation(value = "保存")
    @PostMapping
    public Result save(@RequestBody Er er) throws ParseException {
        String orderTimeStr = er.getOrderTimeStr();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date parse = simpleDateFormat.parse(orderTimeStr);
        er.setOrderTime(parse);
        er.setContent(new JSONObject().toString());
        erService.saveOrUpdate(er);
        return Result.succeed("保存成功");
    }

    @ApiOperation(value = "完成")
    @GetMapping("/finish")
    public Result finish(Long id) throws ParseException {
        Er er = new Er();
        er.setId(id);
        er.setStatus("完成");
        erService.saveOrUpdate(er);
        return Result.succeed("完成成功");
    }

    /**
     * 删除
     */
    @ApiOperation(value = "删除")
    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Long id) {
        erService.removeById(id);
        return Result.succeed("删除成功");
    }
}
