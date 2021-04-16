package com.central.user.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.central.db.mapper.SuperMapper;
import com.central.user.model.Er;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * 订单
 * 
 * @author zlt
 * @date 2020-12-27 00:48:40
 */
@Mapper
public interface ErMapper extends SuperMapper<Er> {
    /**
     * 分页查询用户列表
     * @param page
     * @param params
     * @return
     */
    List<Er> findList(Page<Er> page, @Param("p") Map<String, Object> params);
}
