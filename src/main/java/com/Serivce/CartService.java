package com.Serivce;

import com.Bean.Wares;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;

@Transactional
public interface CartService {


    public Map CheckCart(String uuid);
    /**
     *
     * 功能描述: 用于对购物车进行新增产品的操作
     * @author: Eestill
     * @date: 2019/3/8 13:27
     * @param wares
     */
    public String InsertIntoCart(Wares wares);

    /**
     *
     * 功能描述: 用于对购物车现有已添加产品进行数量更新
     * @author: Eestill
     * @date: 2019/3/8 13:31
     * @param wares
     */
    public String UpdataSetCart(Wares wares);

    /**
     *
     * 功能描述: 对购物车现有产品进行删除操作
     * @author: Eestill
     * @date: 2019/3/8 13:32
     * @param wares
     */
    public String deleteFromCart(Wares wares);

}
