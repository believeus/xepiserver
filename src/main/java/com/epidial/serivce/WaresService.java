package com.epidial.serivce;

import com.epidial.bean.Wares;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
public interface WaresService {

    public List<Wares> getInfo(List<Wares> list);
}
