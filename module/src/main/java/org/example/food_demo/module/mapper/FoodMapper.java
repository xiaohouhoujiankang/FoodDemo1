
package org.example.food_demo.module.mapper;

import org.example.food_demo.module.entity.Food;
import org.apache.ibatis.annotations.*;
import java.math.BigInteger;
import java.util.List;
@Mapper
public interface FoodMapper {

@Select("SELECT * FROM food WHERE id =  #{id} AND is_deleted=0")
Food getById(@Param("id") BigInteger id);

@Select("SELECT * FROM food WHERE id =  #{id}")
Food extractById(@Param("id") BigInteger id);

int insert(@Param("food") Food food);

int update(@Param("food") Food food);

@Update("UPDATE food SET update_time = #{time} , is_deleted = 1 WHERE id = #{id}")
int delete(@Param("id") BigInteger id, @Param("time")  Integer time);

List<Food> selectByLimit(@Param("offset") Integer offset,@Param("limit") Integer limit,@Param("keyWord") String keyWord);

@Select("SELECT COUNT(*) FROM food WHERE is_deleted = 0")
int getTotalCount();

}