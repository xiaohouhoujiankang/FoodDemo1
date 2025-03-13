<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${package.Mapper}.${table.mapperName}">

    <insert id="insert"
            useGeneratedKeys="true"
            keyProperty="id"
            parameterType="${package.Entity}.${entity}">
        insert into ${table.name}(
        <#list table.fields as field>
            <#if field.keyFlag == true>
            <#else>
                <#if field.name == "is_deleted">
                    is_deleted <#if field_has_next>,</#if>
                <#else>
                    <#if field.propertyType == "String">
                        <if test=" ${table.name}.${field.propertyName}  != null and ${table.name}.${field.propertyName} != ''"> `${field.name}` <#if field_has_next>,</#if></if>
                    <#else>
                        <if test=" ${table.name}.${field.propertyName}  != null"> `${field.name}` <#if field_has_next>,</#if></if>
                    </#if>
                </#if>
            </#if>
        </#list>
        )values(
        <#list table.fields as field>
            <#if field.keyFlag == true>
            <#else>
                <#if field.name == "is_deleted">
                    <#noparse>#{</#noparse>isDeleted<#noparse>}</#noparse> <#if field_has_next>,</#if>
                <#else>
                    <#if field.propertyType == "String">
                        <if test="${table.name}.${field.propertyName} != null and ${table.name}.${field.propertyName}!= ''"><#noparse>#{</#noparse>${table.name}.${field.propertyName}<#noparse>}</#noparse><#if field_has_next>,</#if></if>
                    <#else>
                        <if test="${table.name}.${field.propertyName} != null"><#noparse>#{</#noparse>${field.propertyName}<#noparse>}</#noparse><#if field_has_next>,</#if></if>
                    </#if>
                </#if>
            </#if>
        </#list>
        )
    </insert>


    <update id="update" parameterType="${package.Entity}.${entity}">
        UPDATE ${table.name}
        <set>
            <#list table.fields as field>
                <#if field.keyFlag == true>
                    `id` = <#noparse>#{</#noparse>${table.name}.id<#noparse>}</#noparse>,
                <#else>
                    <#if field.propertyType == "String">
                        <if test="${table.name}.${field.propertyName} != null and ${table.name}.${field.propertyName} != ''">
                            `${field.name}` = <#noparse>#{</#noparse> ${table.name}.${field.propertyName} <#noparse>}</#noparse>,
                        </if>
                    <#else>
                        <if test="${table.name}.${field.propertyName} != null">
                            `${field.name}` = <#noparse>#{</#noparse> ${table.name}.${field.propertyName} <#noparse>}</#noparse>,
                        </if>
                    </#if>
                </#if>
            </#list>
        </set>
        WHERE `id` = <#noparse>#{</#noparse>${table.name}.id<#noparse>}</#noparse>
    </update>

</mapper>
