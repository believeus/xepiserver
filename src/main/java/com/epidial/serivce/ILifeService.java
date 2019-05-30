package com.epidial.serivce;

import com.epidial.bean.ChartData;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Transactional
public interface ILifeService {

    /**
     *
     *  功能描述: 修改对应用户今日对应栏目的属性值
     *  @author: Eestill
     *  @date: 2019/2/27 15:46
     *  @param column 栏目
     *  @param value1 属性值1
     *  @param value2 属性值2
     */
    public Map<String, Object> getLift(String column, Double value1, Double value2 , String uuid);

    /**
     *
     * 功能描述:
     * @author: Eestill
     * @date: 2019/3/6 16:31
     * @param column 栏目名称
     * @param type 栏目下细分的类型
     * @param value1 属性值1
     * @param value2 属性值2
     */
    public Map<String, Object> getLift(String column,String type, Double value1, Double value2 , String uuid);

    public List<ChartData> getData(String column , String type , String uuid);
}
