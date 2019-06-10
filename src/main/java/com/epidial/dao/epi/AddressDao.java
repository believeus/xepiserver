package com.epidial.dao.epi;

import com.epidial.bean.Address;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface AddressDao {
    //插入地址
    @Insert("insert into address(uuid, recipient, phone, country,city, detail, postalcode,valid)" +
            "values (#{uuid}, #{recipient}, #{phone}, #{country}, #{city},#{detail}, #{postalcode},#{valid})")
    public int save(Address address);

    @Select("select * from address where ${c}=#{v}")
    public List<Address> find(@Param("c") String c,@Param("v") Object v);

    @Delete("delete from address where  ${c}=#{v}")
    public boolean delete(@Param("c") String c,@Param("v") String v);

    @Select("select * from address where ${c1}=#{v1} and ${c2}=#{v2}")
    public Address findValidAddress(@Param("c1") String c1,@Param("v1") Object v1,@Param("c2") String  c2,@Param("v2") Object v2);

    @Update("update address set ${c1}=#{v1} where ${c2}=#{v2} ")
    public boolean update(@Param("c1") String c1,@Param("v1") Object v1,@Param("c2") String  c2,@Param("v2") Object v2);

}
