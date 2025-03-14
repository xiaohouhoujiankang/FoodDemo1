
package org.example.food_demo.module.mapper;

import org.example.food_demo.module.entity.Category;
import org.apache.ibatis.annotations.*;
import java.math.BigInteger;
@Mapper
public interface CategoryMapper {

    @Select("SELECT * FROM category WHERE id =  #{id} AND is_deleted=0")
    Category getById(@Param("id") BigInteger id);

    @Select("SELECT * FROM category WHERE id =  #{id}")
    Category extractById(@Param("id") BigInteger id);

    int insert(@Param("category") Category category);

    int update(@Param("category") Category category);

    @Update("UPDATE category SET update_time = #{time} , is_deleted = 1 WHERE id = #{id}")
    int delete(@Param("id") BigInteger id, @Param("time")  Integer time);


}