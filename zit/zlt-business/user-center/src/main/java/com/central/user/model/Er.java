package com.central.user.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.central.common.model.SuperEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Getter;
import lombok.Setter;
import lombok.EqualsAndHashCode;

import java.util.Date;

/**
 * 订单
 *
 * @author zlt
 * @date 2020-12-27 00:48:40
 */
@Getter
@Setter
@EqualsAndHashCode(callSuper = false)
@TableName("myorder")
public class Er {
    private static final long serialVersionUID = 1L;
    @TableId(type = IdType.AUTO)
    private Long id;
    private String orderNum;
    private Date orderTime;
    private Double price;
    private String consignee;
    private String consigneePhone;
    private String status;
    private String content;
    @TableField(exist = false)
    private String contentStr;
    @TableField(exist = false)
    private String orderTimeStr;
}
