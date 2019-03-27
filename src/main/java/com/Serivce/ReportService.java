package com.Serivce;

import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Transactional
public interface ReportService {

    public List GetDataForReport(String uuid);

    public List GetDataForPerson(String id);

    public List GetDataForPersonById(String uuid);


}
