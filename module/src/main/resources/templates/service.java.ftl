import ${package.Mapper}.${entity}Mapper;
import ${package.Entity}.${entity};
import java.math.BigInteger;
@Service
public class ${entity}Service{
    @Autowired
    private ${table.mapperName} ${table.name}Mapper;
    public ${entity} getById(BigInteger id){
        return ${table.name}Mapper.getById(id);
    }
    public ${entity} extractById(BigInteger id){
        return ${table.name}Mapper.extractById(id);
    }
    public int insert(${entity} ${table.name}) {
        return ${table.name}Mapper.insert(${table.name});
    }
    public int update(${entity} ${table.name}) {
        return ${table.name}Mapper.update(${table.name});
    }
    public int delete(BigInteger id) {
        return ${table.name}Mapper.delete(id, (int) (System.currentTimeMillis() / 1000));
    }
}