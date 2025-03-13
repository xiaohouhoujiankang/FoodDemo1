import ${package.Mapper}.${entity}Mapper
import ${package.Entity}.${entity};
import java.math.BigInteger;
@Service
public class ${entity}service{
@Autowired
private ${table.mapperName} ${table.name}Mapper;
public ${entity} getById(Biginteger id){
    return ${table.name}Mapper.getById(id);
}
public ${entity} extractById(Biginteger id){
return ${table.name}Mapper.extractById(id);
}
public int insert(${entity} ${table.name}) {
return ${table.name}Mapper.insert(${table.name});
}
public int update(${entity} ${table.name}) {
return ${table.name}Mapper.update(${table.name});
}
public int delete(${entity} ${table.name}) {
return ${table.name}Mapper.delete(${table.name});
}
}