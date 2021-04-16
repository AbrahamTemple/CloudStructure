package com.central.user.mapper;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.central.db.mapper.SuperMapper;
import com.central.user.model.D;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * 商品
 * 
 * @author zlt
 * @date 2020-12-27 00:48:42
 */
@Mapper
public interface DMapper extends SuperMapper<D> {
    /**
     * 分页查询用户列表
     * @param page
     * @param params
     * @return
     */
    List<D> findList(Page<D> page, @Param("u") Map<String, Object> params);
}
