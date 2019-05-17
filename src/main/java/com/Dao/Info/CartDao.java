package com.Dao.Info;

import com.Bean.Wares;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Map;

@Mapper
public interface CartDao {

    //添加产品进入购物车
    public int InsertIntoCart(@Param("cart") Wares wares);

    //更新产品数量
    public int UpdateSetCart(@Param("cart") Wares wares);

    //移除产品
    public int DeleteFromCart(@Param("cart") Wares wares);

    //提交订单后，删除在购物车中被选择的商品信息
    public int MoveCartWares(Map map);
}
