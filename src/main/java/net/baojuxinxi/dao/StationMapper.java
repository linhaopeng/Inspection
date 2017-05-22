package net.baojuxinxi.dao;

import net.baojuxinxi.pojo.Station;

public interface StationMapper {
    int deleteByPrimaryKey(String stationId);

    int insert(Station record);

    int insertSelective(Station record);

    Station selectByPrimaryKey(String stationId);

    int updateByPrimaryKeySelective(Station record);

    int updateByPrimaryKey(Station record);
}