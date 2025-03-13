<#assign className = table.mapperName>

package ${package.Mapper};

import ${package.Entity}.${entity};
import org.apache.ibatis.annotations.*;
import java.math.BigInteger;
import java.util.List;
@Mapper
public interface ${className} {

@Select("SELECT * FROM ${table.name} WHERE id =  <#noparse>#{</#noparse>id<#noparse>}</#noparse> AND is_deleted=0")
${entity} getById(@Param("id") BigInteger id);

@Select("SELECT * FROM ${table.name} WHERE id =  <#noparse>#{</#noparse>id<#noparse>}</#noparse>")
${entity} extractById(@Param("id") BigInteger id);

int insert(@Param("${table.name}") ${entity} ${table.name});

int update(@Param("${table.name}") ${entity} ${table.name});

@Update("UPDATE ${table.name} SET update_time = <#noparse>#{</#noparse>time<#noparse>}</#noparse> , is_deleted = 1 WHERE id = <#noparse>#{</#noparse>id<#noparse>}</#noparse>")
int delete(@Param("id") BigInteger id, @Param("time")  Integer time);


}