package com.central.user.service.impl;

import com.central.user.mapper.ErMapper;
import com.central.user.model.Er;
import com.central.user.service.IErService;
import org.springframework.stereotype.Service;
import com.central.common.model.PageResult;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.central.common.service.impl.SuperServiceImpl;

import java.util.List;
import java.util.Map;
import org.apache.commons.collections4.MapUtils;
import lombok.extern.slf4j.Slf4j;


/**
 * 订单
 *
 * @author zlt
 * @date 2020-12-27 00:48:40
 */
@Slf4j
@Service
public class ErServiceImpl extends SuperServiceImpl<ErMapper, Er> implements IErService {
    /**
     * 列表
     * @param params
     * @return
     */
    @Override
    public PageResult<Er> findList(Map<String, Object> params){
        Page<Er> page = new Page<>(MapUtils.getInteger(params, "page"), MapUtils.getInteger(params, "limit"));
        List<Er> list  =  baseMapper.findList(page, params);
        return PageResult.<Er>builder().data(list).code(0).count(page.getTotal()).build();
    }
}
