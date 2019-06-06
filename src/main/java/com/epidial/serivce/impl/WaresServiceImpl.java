package com.epidial.serivce.impl;

import com.epidial.bean.Wares;
import com.epidial.dao.epi.WaresDao;
import com.epidial.serivce.WaresService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @ CreateDate : Create in 15:58 2019/3/18
 * @ Explain :
 * @ UpdateDate : Update in
 * @ Author : Eestill
 */
@Service(value = "waresService")
public class WaresServiceImpl implements WaresService {

    @Resource
    private WaresDao waresDao;

    @Override
    public List<Wares> getInfo(List<Wares> list) {
        return waresDao.GetWaresInfo(list);
    }
}
