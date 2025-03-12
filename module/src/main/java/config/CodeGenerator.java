package config;

import com.baomidou.mybatisplus.generator.FastAutoGenerator;
import com.baomidou.mybatisplus.generator.config.OutputFile;
import com.baomidou.mybatisplus.generator.config.TemplateType;
import com.baomidou.mybatisplus.generator.config.rules.DbColumnType;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;


import java.sql.Types;
import java.util.*;

public class CodeGenerator {
    public static void main(String[] args) {
        FastAutoGenerator.create("jdbc:mysql://localhost:3306/reggie?allowPublicKeyRetrieval=true&characterEncoding=utf8&useSSL=false&serverTimezone=UTC&rewriteBatchedStatements=true&useAffectedRows=true", "root", "123456")
                .globalConfig(builder -> {
                    builder.author("bobo") // 设置作者
                            .enableSwagger() // 开启 swagger 模式
                            .outputDir("M:\\b5197\\FoodDemo1\\module\\src\\main\\java");// 指定输出目录
                    Map<String, Object> dataModel = new HashMap<>();

                    // 生成 editFood 方法签名
                    dataModel.put("methodName", "editFood");
                    dataModel.put("returnType", "BigInteger");
                    List<Map<String, String>> editFoodParams = Arrays.asList(
                            Map.of("type", "BigInteger", "name", "id"),
                            Map.of("type", "String", "name", "name"),
                            Map.of("type", "String", "name", "foodPhotos"),
                            Map.of("type", "String", "name", "foodIntroduce"),
                            Map.of("type", "BigInteger", "name", "categoryId")
                    );
                    dataModel.put("parameters", editFoodParams);
                    dataModel.clear();
                    dataModel.put("methodName", "editCategory");
                    dataModel.put("returnType", "BigInteger");
                    List<Map<String, String>> editCategoryParams = Arrays.asList(
                            Map.of("type", "BigInteger", "name", "id"),
                            Map.of("type", "String", "name", "name"),
                            Map.of("type", "String", "name", "image")
                    );
                    dataModel.put("parameters", editCategoryParams);


                })
                .dataSourceConfig(builder ->
                        builder.typeConvertHandler((globalConfig, typeRegistry, metaInfo) -> {
                            int typeCode = metaInfo.getJdbcType().TYPE_CODE;
                            if (typeCode == Types.SMALLINT) {
                                // 自定义类型转换
                                return DbColumnType.INTEGER;
                            }
                            return typeRegistry.getColumnType(metaInfo);
                        })
                )
                .packageConfig(builder ->
                        builder.parent("org.example.food_demo.module") // 设置父包名
                                .entity("entity")
                                .mapper("mapper")
                                .service("service")
                                .xml("mapper")
                                .pathInfo(Collections.singletonMap(OutputFile.xml, "M:\\b5197\\FoodDemo1\\module\\src\\main\\resources\\mapper")) // 设置mapperXml生成路径
                )
                .strategyConfig(builder ->
                        builder.addInclude("food","category") // 设置需要生成的表名
                                .entityBuilder()
                                .enableLombok()
                                .enableTableFieldAnnotation()
                                .controllerBuilder()
                                .enableRestStyle()
                )
                .templateEngine(new FreemarkerTemplateEngine()) // 使用Freemarker引擎模板，默认的是Velocity引擎模板
                .templateConfig(builder -> {

                    builder.entity("/templates/entity.java.ftl")
                            .mapper("/templates/mapper.java.ftl")
                            .xml("/templates/mapper.xml.ftl");



                })
                .execute();
    }
}
