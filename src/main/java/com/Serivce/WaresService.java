package com.Serivce;

import com.Bean.Wares;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
public interface WaresService {

    public List<Wares> getInfo(List<Wares> list);
}
