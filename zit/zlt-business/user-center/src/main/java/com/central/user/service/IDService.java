package com.central.user.service;


import com.central.common.model.PageResult;
import com.central.common.service.ISuperService;
import com.central.user.model.D;

import java.util.Map;

/**
 * ๅๅ
 *
 * @author zlt
 * @date 2020-12-27 00:48:42
 */
public interface IDService extends ISuperService<D> {
    /**
     * ๅ่กจ
     * @param params
     * @return
     */
    PageResult<D> findList(Map<String, Object> params);
}

