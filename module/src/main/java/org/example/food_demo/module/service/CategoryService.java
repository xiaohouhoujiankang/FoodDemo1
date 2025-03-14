package org.example.food_demo.module.service;

import org.example.food_demo.module.mapper.CategoryMapper;
import org.example.food_demo.module.entity.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigInteger;
@Service
public class CategoryService{
    @Autowired
    private CategoryMapper categoryMapper;
    public Category getById(BigInteger id){
        return categoryMapper.getById(id);
    }
    public Category extractById(BigInteger id){
        return categoryMapper.extractById(id);
    }
    public int insert(Category category) {
        return categoryMapper.insert(category);
    }
    public int update(Category category) {
        return categoryMapper.update(category);
    }
    public int delete(BigInteger id) {
        return categoryMapper.delete(id, (int) (System.currentTimeMillis() / 1000));
    }
}