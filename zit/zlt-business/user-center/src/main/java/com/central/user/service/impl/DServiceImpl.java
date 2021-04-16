package com.central.user.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.central.user.mapper.DMapper;
import com.central.user.model.D;
import com.central.user.service.IDService;
import org.springframework.stereotype.Service;
import com.central.common.model.PageResult;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.central.common.service.impl.SuperServiceImpl;

import java.util.List;
import java.util.Map;
import org.apache.commons.collections4.MapUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.util.StringUtils;


/**
 * 商品
 *
 * @author zlt
 * @date 2020-12-27 00:48:42
 */
@Slf4j
@Service
public class DServiceImpl extends SuperServiceImpl<DMapper, D> implements IDService {
    /**
     * 列表
     * @param params
     * @return
     */
    @Override
    public PageResult<D> findList(Map<String, Object> params){
        Page<D> page = new Page<>(MapUtils.getInteger(params, "page"), MapUtils.getInteger(params, "limit"));
        QueryWrapper<D> dQueryWrapper = new QueryWrapper<>();
        dQueryWrapper.like(!StringUtils.isEmpty(params.get("searchValue")),(String)params.get("searchKey"),params.get("searchValue"));
        Page<D> dPage = baseMapper.selectPage(page, dQueryWrapper);
        //List<D> list  =  baseMapper.findList(page, params);
        return PageResult.<D>builder().data(dPage.getRecords()).code(0).count(page.getTotal()).build();
    }
}
