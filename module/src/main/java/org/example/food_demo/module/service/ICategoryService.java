


@Service
public class Categoryservice{
@Autowired
private CategoryMapper categoryMapper;
public Category getById(Biginteger id){
    return categoryMapper.getById(id);
}
public Category extractById(Biginteger id){
return categoryMapper.extractById(id);
}
public int insert(Category category) {
return categoryMapper.insert(category)
}
public int update(Category category) {
return categoryMapper.update(category)
}
public int delete(Category category) {
return categoryMapper.delete(category)
}
}