package ${package.Entity};
import lombok.Data;
import lombok.experimental.Accessors;
import java.math.BigInteger;

@Data
@Accessors(chain = true)
public class ${entity} {
    private BigInteger id;
<#list table.fields as field>
    <#if field.propertyName != "id" >
        private ${field.propertyType} ${field.propertyName};
    </#if>
</#list>
}