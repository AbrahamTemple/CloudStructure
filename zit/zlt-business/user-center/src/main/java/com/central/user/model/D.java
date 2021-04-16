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
 * 商品
 *
 * @author zlt
 * @date 2020-12-27 00:48:42
 */
@Getter
@Setter
@EqualsAndHashCode(callSuper = false)
@TableName("food")
public class D {
    private static final long serialVersionUID = 1L;

    @TableId(type = IdType.AUTO)
    private Long id;
    private String shop;
    private String type;
    private String name;
    private Double price;
    private String introduce;
    private String distributionfee;
    private Date createTime;
    private Date productTime;
    private String manufactor;
    private String comment;
    @TableField(exist = false)
    private String productTimeStr;
}
