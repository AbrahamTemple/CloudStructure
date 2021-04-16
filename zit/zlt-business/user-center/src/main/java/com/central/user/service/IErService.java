package com.central.user.service;


import com.central.common.model.PageResult;
import com.central.common.service.ISuperService;
import com.central.user.model.Er;

import java.util.Map;

/**
 * 订单
 *
 * @author zlt
 * @date 2020-12-27 00:48:40
 */
public interface IErService extends ISuperService<Er> {
    /**
     * 列表
     * @param params
     * @return
     */
    PageResult<Er> findList(Map<String, Object> params);
}

