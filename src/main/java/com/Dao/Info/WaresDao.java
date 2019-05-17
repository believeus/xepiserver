package com.Dao.Info;

import com.Bean.Wares;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @ CreateDate : Create in 14:23 2019/3/9
 * @ Explain :
 * @ UpdateDate : Update in
 * @ Author : Eestill
 */
@Mapper
public interface WaresDao {

    //用于返回商品详细信息
    public Wares selectWares(Integer wares_id);

    //用于反馈用户购物车中的信息
    public List<Wares> selectCartWares(String uuid);

    //用于查询商品信息
    public List<Wares> GetWaresInfo(List list);
}
