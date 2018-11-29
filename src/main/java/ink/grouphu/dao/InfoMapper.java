package ink.grouphu.dao;

import ink.grouphu.bean.Info;
import ink.grouphu.bean.InfoExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface InfoMapper {
    long countByExample(InfoExample example);

    int deleteByExample(InfoExample example);

    int deleteByPrimaryKey(String hostname);

    int insert(Info record);

    int insertSelective(Info record);

    List<Info> selectByExample(InfoExample example);

    Info selectByPrimaryKey(String hostname);

    int updateByExampleSelective(@Param("record") Info record, @Param("example") InfoExample example);

    int updateByExample(@Param("record") Info record, @Param("example") InfoExample example);

    int updateByPrimaryKeySelective(Info record);

    int updateByPrimaryKey(Info record);
}