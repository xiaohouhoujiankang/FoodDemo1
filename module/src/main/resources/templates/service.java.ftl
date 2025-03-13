package ${packageName};

import ${packageName}.entity.${entityName};
import ${packageName}.mapper.${mapperName};
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigInteger;
import java.util.List;

@Service
public class ${serviceName} {
@Autowired
private ${mapperName} ${mapperName};

public ${entityName} extractById(BigInteger id) {
return ${mapperName}.extractById(id);
}

public ${entityName} getById(BigInteger id) {
return ${mapperName}.getById(id);
}

public BigInteger insert${entityName}(<#list fields as field>${field.type} ${field.name}<#if field?has_next>, </#if></#list>) {
<#list fields as field>
    if (${field.name} == null || ${field.name}.isEmpty()) {
    throw new RuntimeException("${entityName} ${field.name} cannot be empty");
    }
</#list>

<#if relatedEntity>
    ${relatedEntity.name} ${relatedEntity.field} = ${relatedEntity.mapper}.getById(${relatedEntity.field});
    if (${relatedEntity.field} == null) {
    throw new RuntimeException("${relatedEntity.name} ID does not exist");
    }
</#if>

int timestamp = (int) (System.currentTimeMillis() / 1000);
${entityName} ${entityName} = new ${entityName}();

<#list fields as field>
    ${entityName}.set${field.name}(${field.name});
</#list>
${entityName}.setCreateTime(timestamp);
${entityName}.setUpdateTime(timestamp);
${entityName}.setIsDeleted(0);

${mapperName}.insert(${entityName});
return ${entityName}.getId();
}
public BigInteger update${entityName}(BigInteger id<#list fields as field>, ${field.type} ${field.name}</#list>) {
if (id == null) {
throw new RuntimeException("ID cannot be null for update operation");
}

<#list fields as field>
    if (${field.name} == null || ${field.name}.isEmpty()) {
    throw new RuntimeException("${entityName} ${field.name} cannot be empty");
    }
</#list>

<#if relatedEntity>
    ${relatedEntity.name} ${relatedEntity.field} = ${relatedEntity.mapper}.getById(${relatedEntity.field});
    if (${relatedEntity.field} == null) {
    throw new RuntimeException("${relatedEntity.name} ID does not exist");
    }
</#if>

int timestamp = (int) (System.currentTimeMillis() / 1000);
${entityName} ${entityName} = new ${entityName}();

<#list fields as field>
    ${entityName}.set${field.name}(${field.name});
</#list>
${entityName}.setUpdateTime(timestamp);
${entityName}.setId(id);

${entityName} existing${entityName} = ${mapperName}.getById(id);
if (existing${entityName} == null) {
throw new RuntimeException("${entityName} with id " + id + " does not exist");
}

${mapperName}.update(${entityName});
return ${entityName}.getId();
}

public int delete${entityName}(BigInteger id) {
return ${mapperName}.delete(id, (int) (System.currentTimeMillis() / 1000));
}




}