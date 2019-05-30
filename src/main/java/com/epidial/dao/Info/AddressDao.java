package com.epidial.dao.Info;

import com.epidial.bean.Address;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface AddressDao {
    //插入地址
    @Insert("insert into address(uuid, recipient, phone, country, address, postalcode)" +
            "values (#{uuid}, #{recipient}, #{phone}, #{country}, #{address}, #{postalcode})")
    public int save(Address address);

    @Select("select * from address where uuid=#{uuid}")
    public Address findByUUID(@Param("uuid") String uuid);



}
