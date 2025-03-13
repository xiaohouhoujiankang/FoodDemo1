package org.example.food_demo.module.service;

import org.example.food_demo.module.entity.Food;
import org.example.food_demo.module.mapper.FoodMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigInteger;
@Service
public class Foodservice{
@Autowired
private FoodMapper foodMapper;
public Food getById(BigInteger id){
    return foodMapper.getById(id);
}
public Food extractById(BigInteger id){
return foodMapper.extractById(id);
}
public int insert(Food food) {
return foodMapper.insert(food);
}
public int update(Food food) {
return foodMapper.update(food);
}
public int delete(Food food) {
return foodMapper.delete(food);
}
}