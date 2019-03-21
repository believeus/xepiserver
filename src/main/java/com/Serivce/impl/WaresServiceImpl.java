package com.Serivce.impl;

import com.Bean.Wares;
import com.Dao.WaresDao;
import com.Serivce.WaresService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ CreateDate : Create in 15:58 2019/3/18
 * @ Explain :
 * @ UpdateDate : Update in
 * @ Author : Eestill
 */
@Service(value = "waresService")
public class WaresServiceImpl implements WaresService {

    @Autowired
    private WaresDao waresDao;

    @Override
    public List<Wares> getInfo(List<Wares> list) {
        return waresDao.GetWaresInfo(list);
    }
}
