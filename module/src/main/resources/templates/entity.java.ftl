package ${package.Entity};
import lombok.Data;
import lombok.experimental.Accessors;
import java.math.BigInteger;

@Data
@Accessors(chain = true)
public class ${entity} {
    private BigInteger id;
    private BigInteger categoryId;
<#list table.fields as field>
    <#if field.propertyName != "id" >
        <#if field.propertyName != "categoryId" >
        private ${field.propertyType} ${field.propertyName};
    </#if>
    </#if>
</#list>
}